/////////////////////////////////////////////
//Time Clock Terminal////////////////////////
/////////////////////////////////////////////

//
// Timeclock terminal machine itself
//
/obj/machinery/timeclock
	name = "timeclock terminal"
	icon = 'mods/content/lighthouse/icons/obj/machines/timeclock.dmi'
	icon_state = "timeclock"
	layer = ABOVE_WINDOW_LAYER
	density = FALSE // wall object
	frame_type = /obj/item/frame/timeclock
	light_color = "#0099ff"
	var/light_range_on = 2
	var/light_power_on = 0.5
	var/base_icon_state = "timeclock"
	var/channel = "Common" // Name of the radio channel to announce on
	var/obj/item/card/id/card // Inserted ID card

/obj/item/stock_parts/circuitboard/timeclock
	name = "circuit board (timeclock)"
	build_path = /obj/machinery/timeclock
	board_type = "machine"
	origin_tech = "{'programming':2}"
	additional_spawn_components = list(
		/obj/item/stock_parts/console_screen = 1,
		/obj/item/stock_parts/keyboard = 1,
		/obj/item/stock_parts/power/apc/buildable = 1,
		/obj/item/stock_parts/network_receiver = 1
	)

/obj/machinery/timeclock/Destroy()
	if(card)
		card.dropInto(loc)
		card = null
	. = ..()

/obj/machinery/timeclock/on_update_icon()
	if(stat & NOPOWER || construct_state?.type != /decl/machine_construction/wall_frame/panel_closed)
		set_light(0)
	else
		set_light(light_range_on, light_power_on, light_color)
	switch(construct_state?.type)
		if(/decl/machine_construction/wall_frame/no_circuit)
			icon_state = "[base_icon_state]_b0"
			return
		if(/decl/machine_construction/wall_frame/no_wires)
			icon_state = "[base_icon_state]_b2"
			return
		if(/decl/machine_construction/wall_frame/panel_open)
			icon_state = "[base_icon_state]_b3"
			return

	if(inoperable())
		icon_state = "[base_icon_state]_off"
	else if(card)
		icon_state = "[base_icon_state]_card"
	else
		icon_state = base_icon_state

/obj/machinery/timeclock/attackby(obj/item, mob/user)
	if(!istype(item, /obj/item/card/id))
		return ..()
	if(card)
		to_chat(user, SPAN_WARNING("There is already an ID card inside."))
	else if(user.remove_from_mob(item, src))
		card = item
		SSnano.update_uis(src)
		queue_icon_update()
	return TRUE

/obj/machinery/timeclock/interface_interact(mob/user)
	ui_interact(user)
	return TRUE

/obj/machinery/timeclock/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1)
	user.set_machine(src)

	var/list/data = list()
	// Okay, data for showing the user's OWN PTO stuff
	if(user.client)
		data["department_hours"] = SANITIZE_LIST(user.client.department_hours)
	data["user_name"] = "[user]"

	// Data about the card that we put into it.
	if(card)
		data["card"] = "[card]"
		data["assignment"] = card.assignment
		var/datum/job/job = SSjobs.get_by_title(card.position)
		if (job)
			data["job_datum"] = list(
				"title" = job.title,
				"departments" = job.get_department_names(),
				"economic_modifier" = job.economic_power,
				"selection_color" = job.selection_color,
				"timeoff_factor" = job.timeoff_factor,
				"pto_department" = job.pto_type
			)
		// TODO: Reimplement this check once we have modular config options.
		// if(config.time_off && config.pto_job_change)
		data["allow_change_job"] = TRUE
		if(job && job.timeoff_factor < 0) // Currently are Off Duty, so gotta lookup what on-duty jobs are open
			data["job_choices"] = getOpenOnDutyJobs(user, job.pto_type)

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "timeclock.tmpl", capitalize(src.name), 500, 520)
		ui.set_initial_data(data)
		ui.open()

/obj/machinery/timeclock/OnTopic(href, href_list)
	if (href_list["id"])
		if(card)
			usr.put_in_hands(card)
			card = null
		else
			var/obj/item/held_item = usr.get_active_held_item()
			if (istype(held_item, /obj/item/card/id) && usr.remove_from_mob(held_item, src))
				card = held_item
		queue_icon_update()
		return TOPIC_REFRESH
	if(href_list["switch-to-onduty-rank"])
		if(checkFace())
			if(checkCardCooldown())
				makeOnDuty(usr, href_list["switch-to-onduty-rank"], href_list["switch-to-onduty-assignment"])
				usr.put_in_hands(card)
				card = null
		queue_icon_update()
		return TOPIC_REFRESH
	if(href_list["switch-to-offduty"])
		if(checkFace())
			if(checkCardCooldown())
				makeOffDuty(usr)
				usr.put_in_hands(card)
				card = null
		queue_icon_update()
		return TOPIC_REFRESH
	return TOPIC_NOACTION

/obj/machinery/timeclock/proc/getOpenOnDutyJobs(var/mob/user, var/department)
	var/list/available_jobs = list()
	for(var/datum/job/job in SSjobs.primary_job_datums)
		if(isOpenOnDutyJob(user, department, job))
			available_jobs[job.title] = list(job.title)
			if(job.alt_titles)
				for(var/alt_job in job.alt_titles)
					if(alt_job != job.title)
						available_jobs[job.title] += alt_job
	return available_jobs

/obj/machinery/timeclock/proc/isOpenOnDutyJob(mob/living/human/user, department, datum/job/job)
	var/decl/species/user_species = user.get_species()
	return job \
		   && job.is_position_available() \
		   && !jobban_isbanned(user, job.title) \
		   && job.player_old_enough(user.client) \
		   && job.pto_type == department \
		   && !job.disallow_jobhop \
		   && job.timeoff_factor > 0 \
		   && (job.is_species_allowed(user.get_species())) \
		   && !(job.title in SSticker.mode.disabled_jobs) \
		   && (isnull(job.allowed_branches) || (user.char_branch && job.is_branch_allowed(user.char_branch.name))) \
		   && (isnull(job.allowed_ranks) || (user.char_rank && job.is_rank_allowed(user.char_branch.name, user.char_rank.name))) \
		   && (LAZYACCESS(job.minimum_character_age, user_species.get_root_species_name()) && (user.get_age() < job.minimum_character_age[user_species.get_root_species_name()]))

/obj/machinery/timeclock/proc/fetch_record(name)
	RETURN_TYPE(/datum/computer_file/report/crew_record)
	var/datum/extension/network_device/netdevice = get_extension(src, /datum/extension/network_device)
	var/datum/computer_network/obj_network = netdevice?.get_network(NET_FEATURE_RECORDS)
	var/datum/computer_file/report/crew_record/record = obj_network?.get_crew_record_by_name(card.registered_name)
	return record

/obj/machinery/timeclock/proc/reassign_player(mob/living/player, newrank, newassignment)
	var/datum/job/oldjob = SSjobs.get_by_title(card.position)
	var/datum/job/newjob = SSjobs.get_by_title(newrank)
	if(!oldjob || !newjob)
		return FALSE
	oldjob.clear_slot()
	card.access = newjob.get_access()
	card.position = newjob.title
	card.assignment = newassignment
	fetch_record(card.registered_name)?.set_job(card.assignment)
	card.last_job_switch = world.time
	callHook("reassign_employee", list(card)) // FIXME: REPLACE WITH OBSERV
	newjob.current_positions++
	player.mind.assigned_role = card.position
	player.mind.role_alt_title = card.assignment
	return TRUE

/obj/machinery/timeclock/proc/makeOnDuty(mob/living/player, newrank, newassignment)
	if(!card)
		return
	var/datum/job/oldjob = SSjobs.get_by_title(card.position)
	var/datum/job/newjob = SSjobs.get_by_title(newrank)
	if(!oldjob || !isOpenOnDutyJob(usr, oldjob.pto_type, newjob))
		return
	if(newassignment != newjob.title && !(newassignment in newjob.alt_titles))
		return
	if(reassign_player(player, newrank, newassignment))
		do_telecomms_announcement(src, "[card.registered_name] has moved On-Duty as [card.assignment].", "Employee Oversight", channel)

/obj/machinery/timeclock/proc/makeOffDuty(mob/living/player)
	var/datum/job/foundjob = SSjobs.get_by_title(card.position)
	if(!foundjob)
		return
	var/new_dept = foundjob.pto_type || PTO_CIVILIAN
	var/datum/job/ptojob = null
	for(var/datum/job/job in SSjobs.primary_job_datums)
		if(job.pto_type == new_dept && job.timeoff_factor < 0) // our timeoff job is the first job in the same PTO category that spends PTO time
			ptojob = job
			break
	if(reassign_player(player, ptojob.title, ptojob.title))
		do_telecomms_announcement(src, "[card.registered_name], [foundjob.title], has moved Off-Duty.", "Employee Oversight", channel)

/obj/machinery/timeclock/proc/checkCardCooldown()
	if(!card)
		return FALSE
	// todo: make this a config option once we get modpack config options
	var/time_left = 10 MINUTES - (world.time - card.last_job_switch)
	if(time_left > 0)
		to_chat(usr, "You need to wait another [ticks2readable(time_left)] minute\s before you can switch.")
		return FALSE
	return TRUE

/obj/machinery/timeclock/proc/checkFace(mob/living/human/user)
	if(!card)
		to_chat(usr, SPAN_NOTICE("No ID is inserted."))
		return FALSE
	var/obj/item/clothing/maskwear = user.get_equipped_item(slot_wear_mask_str)
	var/obj/item/clothing/headwear = user.get_equipped_item(slot_head_str)
	if((maskwear?.flags_inv & HIDEFACE) || (headwear?.flags_inv & HIDEFACE)) //Face hiding bad
		to_chat(user, SPAN_WARNING("Facial recognition scan failed due to physical obstruction. Access denied."))
		return FALSE
	else if(!user.identity_is_visible() || user.real_name != card.registered_name)
		to_chat(user, SPAN_WARNING("Facial recognition scan failed. Access denied."))
		return FALSE
	return TRUE

//
// Frame type for construction
//
/obj/item/frame/timeclock
	name = "timeclock terminal frame"
	desc = "Used for building timeclock terminals."
	icon = 'mods/content/lighthouse/icons/obj/machines/timeclock.dmi'
	icon_state = "timeclock_b0"
	build_machine_type = /obj/machinery/timeclock

/obj/item/frame/timeclock/kit
	fully_construct = TRUE
	name = "timeclock terminal kit"
	desc = "An all-in-one timeclock terminal kit, comes preassembled."

//
// Easy mapping
//
/obj/machinery/timeclock
	directional_offset = @'{"NORTH":{"y":-26}, "SOUTH":{"y":26}, "EAST":{"x":-26}, "WEST":{"x":26}}'
/obj/machinery/timeclock/premade/north
	dir = SOUTH
	pixel_y = 26

/obj/machinery/timeclock/premade/south
	dir = NORTH
	pixel_y = -26

/obj/machinery/timeclock/premade/east
	dir = WEST
	pixel_x = 26

/obj/machinery/timeclock/premade/west
	dir = EAST
	pixel_x = -26
