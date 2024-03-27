#define MAX_PRINTING_PASSES 5
#define COST_PER_PRINT 30 //in units

/obj/machinery/bioprinter
	name = "bioprinter"
	desc = "An enormous machine designed to additively manufacture living things. You wouldn't download a person."
	icon = 'mods/content/resleeving/new_printer.dmi'
	icon_state = "base"
	density = TRUE
	anchored = TRUE
	idle_power_usage = 200
	active_power_usage = 15 KILOWATTS
	stat_immune = 0

	var/printing = FALSE
	var/needs_attention = FALSE
	var/errored = FALSE
	var/print_finished = FALSE
	var/removing_clone = FALSE
	var/cleaning = FALSE
	var/cleaning_interrupted = FALSE

	var/printing_time = 6 MINUTES
	var/printing_end_time //What time we will finish printing.

	var/width = 2
	var/height = 2

	var/tool_pixel_y_offset
	var/mob_mask_y_offset

	var/total_interactions = 0
	var/max_interaction_requests = 4
	var/next_interaction_request = 0
	var/last_warning_sound = 0 //we have a delay on playing our warning sounds.
	var/next_interact_request_delay = 10 SECONDS
	var/cleaning_delay = 5 MINUTES

	var/interaction_timer_id
	var/cleaning_timer_id

	var/increment_delay //The time between y increments for the alpha masking of the mob icon and the print head. This is based on the printing time, hence why it is configurable.
	var/next_increment = 0
	var/total_passes = 0
	var/obj/item/disk/diskette
	var/datum/sound_token/sound_token
	var/sound_id

	var/obj/item/chems/glass/biomass_reservoir

	var/list/technobabble_systems = list(
		"microservo positioning system",
		"flash-sterilization subsystem",
		"flash-differentiation feed system",
		"print laser power regulation system",
		"biomass circulation subsystem",
		"neural stimulation subsystem"
		)
	var/list/technobabble_used = list()

	var/static/list/cached_choices = null

	var/last_used_technobabble

	var/obj/structure/clone_pod_lid/lid
	var/obj/effect/print_head/ph

	var/list/clone_mobs = list()
	var/mob/living/carbon/human/clonemob
	var/lid_open = FALSE

/obj/machinery/bioprinter/get_contained_external_atoms()
	. = ..()
	LAZYREMOVE(., biomass_reservoir)

/obj/machinery/bioprinter/filled/Initialize()
	. = ..()
	biomass_reservoir = new /obj/item/chems/glass/beaker/large
	biomass_reservoir.reagents.add_reagent(/decl/material/liquid/biomass, 120)

/obj/machinery/bioprinter/Initialize()
	. = ..()
	ph = new(src)
	ph.layer += 0.06
	lid = new(src)
	lid.layer += 0.08
	vis_contents += lid
	open_pod_start()
	prepare_choices()
	make_fake_mobs()
	var/delay = get_printing_increment()
	next_interact_request_delay = (delay - delay/2)
	SetBounds()
	if(!sound_id)
		sound_id = "[type]_[sequential_id(/obj/machinery/bioprinter)]"

/obj/machinery/bioprinter/Destroy()
	. = ..()
	remove_fake_mobs()
	if(clonemob)
		qdel(clonemob)
		clonemob = null
	qdel(ph)
	ph = null
	qdel(lid)
	lid = null
	clone_mobs.Cut()
	sound_token = null

/obj/machinery/bioprinter/proc/SetBounds()
	bound_width = width * world.icon_size
	bound_height = height * world.icon_size

/obj/machinery/bioprinter/proc/prepare_choices()
	if(!LAZYLEN(cached_choices))
		cached_choices = list()

		var/image/radial_button

		radial_button = image(icon = 'icons/obj/items/device/diskette.dmi', icon_state = ICON_STATE_WORLD)
		radial_button.color = COLOR_DEEP_SKY_BLUE
		radial_button.overlays = list(
			mutable_appearance(radial_button.icon, "slider", flags = RESET_COLOR),
			mutable_appearance(radial_button.icon, "label_dna", flags = RESET_COLOR)
		)
		radial_button.name = "Eject the backup diskette"
		cached_choices["disk_eject"] = radial_button

		radial_button = image('icons/screen/radial.dmi', "radial_eject")
		radial_button.name = "Eject the patient"
		cached_choices["eject_clone"] = radial_button

		radial_button = image('icons/screen/radial.dmi', "radial_use")
		radial_button.name = "Start print"
		cached_choices["start_print"] = radial_button

		radial_button = image('icons/screen/radial.dmi', "radial_next")
		radial_button.name = "Interact"
		cached_choices["interact"] = radial_button

		radial_button = image(icon = 'icons/obj/items/chem/beakers/beaker.dmi', icon_state = ICON_STATE_WORLD)
		radial_button.color = GLASS_COLOR
		var/mutable_appearance/shine_overlay = mutable_appearance(radial_button.icon, "[ICON_STATE_WORLD]_shine", adjust_brightness(GLASS_COLOR, 20 + MAT_VALUE_SHINY))
		shine_overlay.alpha = MAT_VALUE_SHINY * 3
		radial_button.overlays += shine_overlay
		radial_button.name = "Eject the biomass container"
		cached_choices["biomass_eject"] = radial_button

/obj/machinery/bioprinter/attackby(obj/item/I, mob/user)
	. = ..()
	if(istype(I, /obj/item/disk) && !diskette)
		var/obj/item/disk/D = I
		if(user.unequip(D))
			D.forceMove(src)
			diskette = D
			to_chat(user, SPAN_NOTICE("You insert \the [D] into \the [src]."))
		return TRUE
	if(istype(I, /obj/item/chems/glass/beaker) && !biomass_reservoir)
		if(user.unequip(I))
			I.forceMove(src)
			biomass_reservoir = I
			to_chat(user, SPAN_NOTICE("You insert \the [biomass_reservoir] into \the [src]."))
		return TRUE

/obj/machinery/bioprinter/proc/open_pod_start()
	animate(lid, pixel_y = 38, time = 3 SECONDS, easing = SINE_EASING)
	addtimer(CALLBACK(src, PROC_REF(open_pod_finish)), 3 SECONDS)
	playsound(get_turf(src), 'sound/machines/podopen.ogg', 75)

/obj/machinery/bioprinter/proc/open_pod_finish()
	lid_open = TRUE

/obj/machinery/bioprinter/proc/close_pod_start()
	animate(lid, pixel_y = 0, time = 3 SECONDS, easing = SINE_EASING)
	addtimer(CALLBACK(src, PROC_REF(close_pod_finish)), 3 SECONDS)
	playsound(get_turf(src), 'sound/machines/podclose.ogg', 75)

/obj/machinery/bioprinter/proc/close_pod_finish()
	lid_open = FALSE

/obj/machinery/bioprinter/on_update_icon()
	. = ..()
	cut_overlays()
	lid.cut_overlays()

	if(stat & (NOPOWER|BROKEN))
		add_overlay(image(icon, "keyboard_off"))
		if(stat & BROKEN)
			if(!lid.lid_rotated)
				var/matrix/M = new()
				M.Turn(rand(-50, 50))
				lid.transform = M
				lid.lid_rotated = TRUE
				lid.icon_state = "lid_broken"
			add_overlay(image(icon, "screen_broken"))
		return

	lid.lid_rotated = FALSE
	lid.transform = null

	add_overlay(image(icon, "keyboard"))
	if(!diskette)
		add_overlay(image(icon, "dna_indicator_base"))
	else
		var/has_record = diskette.contains_file_type("BDY")
		add_overlay(image(icon, "dna_indicator_[has_record ? "sample" : "none"]"))

	var/biomass_volume = REAGENT_VOLUME(biomass_reservoir?.reagents, /decl/material/liquid/biomass)
	if(biomass_volume <= COST_PER_PRINT)
		add_overlay(image(icon, "reactor_low"))
	else if(biomass_volume < biomass_reservoir.reagents.maximum_volume)
		add_overlay(image(icon, "reactor_medium"))
	else
		add_overlay(image(icon, "reactor_full"))

	if(!printing && !cleaning)
		add_overlay(image(icon, "computer_standby"))
	if(printing && !needs_attention)
		add_overlay(image(icon, "computer_working"))
		var/image/I = image(icon, icon_state = "status_indicator_good")
		I.color = COLOR_GREEN
		add_overlay(I)
	if(printing && needs_attention && !errored)
		add_overlay(image(icon, "computer_warning"))
		var/image/I = image(icon, icon_state = "status_indicator_bad")
		I.color = COLOR_YELLOW_GRAY
		add_overlay(I)
	if(printing && needs_attention && errored)
		var/image/I = image(icon, icon_state = "status_indicator_bad")
		I.color = COLOR_RED_GRAY
		add_overlay(I)
		add_overlay(image(icon, "computer_fail"))
	if(print_finished)
		add_overlay(image(icon, "computer_finished"))
	if(cleaning)
		add_overlay(image(icon, "computer_cleaning"))
		add_lid_overlay(COLOR_PURPLE, "lid_cleaning")
		var/image/I = image(icon, icon_state = "status_indicator_good")
		I.color = COLOR_PURPLE
		add_overlay(I)

/obj/machinery/bioprinter/physical_attack_hand(var/mob/living/carbon/human/user)
	. = ..()
	if(stat & (NOPOWER|BROKEN)) //shitters clogged
		return FALSE
	var/list/choices = radial_choices()
	var/choice = RADIAL_INPUT(user, choices)
	switch(choice)
		if("start_print")
			start_print()
			return TRUE
		if("interact")
			if(needs_attention)
				fulfill_interaction(user, TRUE)
			return TRUE
		if("eject_clone")
			if(clonemob && print_finished && !removing_clone)
				removing_clone = TRUE
				if(do_after(user, 5 SECONDS, src))
					clonemob.forceMove(get_turf(user))
					clonemob = null
					do_fakemob_animation("fakemob5", "layer5", "stage5", fade_out = TRUE)
					print_finished = FALSE
					removing_clone = FALSE
					ping("\The [src] pings, \"Print removal detected. Engaging cleaning cycle!\"")
					start_cleaning()
				else
					removing_clone = FALSE
			return TRUE
		if("disk_eject")
			if(diskette)
				if(!user.put_in_hands(diskette))
					diskette.dropInto(loc)
				to_chat(user, SPAN_NOTICE("You eject \the [diskette]."))
				diskette = null
			return TRUE
		if("biomass_eject")
			if(biomass_reservoir)
				if(!user.put_in_hands(biomass_reservoir))
					biomass_reservoir.dropInto(loc)
				to_chat(user, SPAN_NOTICE("You eject \the [biomass_reservoir]."))
				biomass_reservoir = null
			return TRUE

/obj/machinery/bioprinter/proc/radial_choices()
	. = list()
	if(diskette && !printing)
		.["disk_eject"] = cached_choices["disk_eject"]
	if(biomass_reservoir && !printing)
		.["biomass_eject"] = cached_choices["biomass_eject"]
	if(clonemob && print_finished)
		.["eject_clone"] = cached_choices["eject_clone"]
	if(!printing && !cleaning && !(print_finished && clonemob))
		.["start_print"] = cached_choices["start_print"]
	if(needs_attention)
		.["interact"] = cached_choices["interact"]


/obj/machinery/bioprinter/proc/get_printing_increment()
	. = round((printing_time / MAX_PRINTING_PASSES))

/obj/machinery/bioprinter/proc/start_print()
	if(stat & (NOPOWER|BROKEN)) //shitters clogged
		return
	if(cleaning)
		buzz("\The [src] buzzes, \"Error! Self-cleaning in progress.\"")
	if(printing)
		buzz("\The [src] buzzes, \"Error! Printer busy.\"")
		return
	if(clonemob) //can't clone someone while there's still someone inside.
		buzz("\The [src] buzzes, \"Error! Printer occupied.\"")
		return
	if(!diskette)
		buzz("\The [src] buzzes, \"Error! No diskette inserted.\"")
		return
	if(!diskette.contains_file_type("BDY"))
		buzz("\The [src] buzzes, \"Error! No body record detected.\"")
		return
	if(!biomass_reservoir?.reagents?.has_reagent(/decl/material/liquid/biomass, COST_PER_PRINT))
		buzz("\The [src] buzzes, \"Error! Insufficent biomass.\"")
		return
	biomass_reservoir.remove_from_reagents(/decl/material/liquid/biomass, COST_PER_PRINT)
	if(lid_open)
		close_pod_start()
	printing = TRUE
	print_finished = FALSE
	next_increment = world.time + 4 SECONDS + get_printing_increment()
	playsound(get_turf(src), pick(global.keyboard_sound))
	addtimer(CALLBACK(src, PROC_REF(start_print_next)), 4 SECONDS)

/obj/machinery/bioprinter/proc/start_print_next()
	var/datum/computer_file/data/body_record/body_record = diskette.contains_file_type("BDY")
	clonemob = body_record.create_human(src)
	update_fake_mob()
	vis_contents += ph

/obj/machinery/bioprinter/Process()
	update_icon()
	if(stat & (NOPOWER|BROKEN))
		if(cleaning_timer_id)
			deltimer(cleaning_timer_id)
			cleaning_interrupted = TRUE
		if(printing) //Printer is broken or loses power during printing - gotta start from scratch.
			cancel_print()
		return
	if(!cleaning && cleaning_interrupted) //restart the cleaning cycle if we were interrupted by power loss or breaking.cleaning_interrupted
		start_cleaning()
	if(sound_token && !printing)
		QDEL_NULL(sound_token)
	if(printing)
		update_use_power(POWER_USE_ACTIVE)
		if((errored || needs_attention) && (last_warning_sound + 10 SECONDS > world.time))
			last_warning_sound = world.time
			playsound(src, 'sound/machines/warning-buzzer.ogg', 50)
		if(!sound_token)
			sound_token = play_looping_sound(src, sound_id, 'sound/machines/fabricator_loop.ogg', volume = 30, range = 3, falloff = 2)
		if((total_interactions < max_interaction_requests) && total_passes >= 1 && !needs_attention && (world.time > next_increment) && (world.time > next_interaction_request))
			needs_attention = TRUE
			total_interactions++
			interact_request(prob(15))
		if(total_passes >= MAX_PRINTING_PASSES)
			printing = FALSE
			print_finished = TRUE
			update_fake_mob()
			finish_print()
			return
		if(needs_attention) //delay the next increment constantly.
			next_increment = world.time + get_printing_increment()
		else if(world.time > next_increment)
			next_increment = world.time + get_printing_increment() + 0.1 SECOND
			total_passes++
			update_fake_mob()
	if(!printing)
		update_use_power(POWER_USE_IDLE)

/obj/machinery/bioprinter/proc/make_fake_mobs()
	clone_mobs["fakemob1"] = new /obj/effect/fake_clone_mob(src)
	clone_mobs["fakemob2"] = new /obj/effect/fake_clone_mob(src)
	clone_mobs["fakemob3"] = new /obj/effect/fake_clone_mob(src)
	clone_mobs["fakemob4"] = new /obj/effect/fake_clone_mob(src)
	clone_mobs["fakemob5"] = new /obj/effect/fake_clone_mob(src)

/obj/machinery/bioprinter/proc/remove_fake_mobs()
	qdel(clone_mobs["fakemob1"])
	qdel(clone_mobs["fakemob2"])
	qdel(clone_mobs["fakemob3"])
	qdel(clone_mobs["fakemob4"])
	qdel(clone_mobs["fakemob5"])
	clone_mobs.Cut()

/obj/machinery/bioprinter/proc/update_fake_mob()
	switch(total_passes)
		if(0)
			do_fakemob_animation("fakemob1", "layer1", "stage1", 0.01, FALSE)
			addtimer(CALLBACK(src, PROC_REF(animate_printhead)), 2 SECONDS)
		if(1)
			animate(ph, pixel_y = 0, time = 2 SECONDS)
			do_fakemob_animation("fakemob2", "layer2", "stage2", 0.02, FALSE)
			addtimer(CALLBACK(src, PROC_REF(animate_printhead)), 2 SECONDS)
		if(2)
			animate(ph, pixel_y = 0, time = 2 SECONDS)
			do_fakemob_animation("fakemob3", "layer3", "stage3", 0.03, FALSE)
			addtimer(CALLBACK(src, PROC_REF(animate_printhead)), 2 SECONDS)
		if(3)
			animate(ph, pixel_y = 0, time = 2 SECONDS)
			do_fakemob_animation("fakemob4", "layer4", "stage4", 0.04, FALSE)
			addtimer(CALLBACK(src, PROC_REF(animate_printhead)), 2 SECONDS)
		if(4) //By this point we can get rid of the three earlier mobs from vis_contents.
			animate(ph, pixel_y = 0, time = 2 SECONDS)
			do_fakemob_animation("fakemob1", "layer1", "stage1", fade_out = TRUE)
			do_fakemob_animation("fakemob2", "layer2", "stage2", fade_out = TRUE)
			do_fakemob_animation("fakemob3", "layer3", "stage3", fade_out = TRUE)
			//we don't use do_fakemob_animation here because we do some custom stuff to make the final fakemob look like the person being printed.
			var/obj/effect/fake_clone_mob/fakemob = clone_mobs["fakemob5"]
			fakemob.appearance = clonemob.appearance
			fakemob.transform = matrix() // do not rest!!
			fakemob.appearance_flags = RESET_TRANSFORM
			fakemob.pixel_x += 1 //appearance means the x and y are completely wonky, so set offsets to make sure it renders properly.
			fakemob.pixel_y += 17
			fakemob.layer = STRUCTURE_LAYER + 0.05
			fakemob.add_filter("layer5",1 ,list(type = "alpha", y = -32, icon = icon('icons/mob/human.dmi', "body_m_s")))
			fakemob.animate_filter("layer5", list(y = 0, time = get_printing_increment()))
			vis_contents += fakemob
			addtimer(CALLBACK(src, PROC_REF(animate_printhead)), 2 SECONDS)

/obj/machinery/bioprinter/proc/do_fakemob_animation(var/fakemob_name, var/filter_name, var/stage_name, var/fakemob_layer_increment, var/fade_out = FALSE)
	var/obj/effect/fake_clone_mob/fakemob = clone_mobs[fakemob_name]

	if(!fakemob)
		return

	if(fade_out)
		fakemob.icon_state = null //reset the icon state, cuz we're gonna re-use these eventually.
		fakemob.remove_filter(filter_name)
		vis_contents -= fakemob
		return

	fakemob.add_filter(filter_name,1 ,list(type = "alpha", y = -32, icon = icon(icon, stage_name)))
	fakemob.animate_filter(filter_name, list(y = 0, time = get_printing_increment()))
	fakemob.icon_state = stage_name
	fakemob.layer = STRUCTURE_LAYER + fakemob_layer_increment
	vis_contents += fakemob

/obj/machinery/bioprinter/proc/animate_printhead()
	animate(ph, pixel_y = 26, time = get_printing_increment(), easing = SINE_EASING)

/obj/machinery/bioprinter/proc/cancel_print()
	total_passes = 0
	vis_contents -= ph
	ph.pixel_z = 0
	do_fakemob_animation("fakemob1", "layer1", fade_out = TRUE)
	do_fakemob_animation("fakemob2", "layer2", fade_out = TRUE)
	do_fakemob_animation("fakemob3", "layer3", fade_out = TRUE)
	do_fakemob_animation("fakemob4", "layer4", fade_out = TRUE)
	do_fakemob_animation("fakemob5", "layer5", fade_out = TRUE)
	printing = FALSE
	errored = FALSE
	needs_attention = FALSE
	QDEL_NULL(clonemob)

/obj/machinery/bioprinter/proc/finish_print()
	vis_contents -= ph
	ph.pixel_y = 0
	do_fakemob_animation("fakemob4", "layer4", "stage4", fade_out = TRUE)
	total_passes = 0
	print_finished = TRUE
	technobabble_used.Cut()
	open_pod_start()
	total_interactions = 0
	var/datum/computer_file/data/mind_record/mind_record = diskette.contains_file_type("MND")
	if(!mind_record)
		return
	if(!istype(mind_record))
		buzz("\The [src] buzzes, \"Mind backup corrupted or incompatible. Skipping...\"")
		return
	var/datum/mind/stored_mind = mind_record.get_mind()
	if(!stored_mind)
		buzz("\The [src] buzzes, \"Mind backup is too outdated. Skipping...\"")
		return
	if(stored_mind.current && stored_mind.current.stat != DEAD)
		buzz("\The [src] buzzes, \"Fork attempt detected, mind signature already present in registered body. Skipping...\"")
		return
	if(mind_record.transfer_to_mob(clonemob))
		ping("\The [src] pings, \"Mind record successfully transferred to body.\"")

/obj/machinery/bioprinter/proc/interact_request(var/is_error)
	var/list/usable_babble = list()
	for(var/I in technobabble_systems)
		if(I in technobabble_used)
			continue
		usable_babble += I
	var/technobabble = pick(usable_babble)
	last_used_technobabble = technobabble
	technobabble_used += technobabble
	if(!is_error) //if not a critical error, auto-resolve in ~30s
		interaction_timer_id = addtimer(CALLBACK(src, PROC_REF(fulfill_interaction)), 50 SECONDS, TIMER_STOPPABLE)
		do_telecomms_announcement(src, "Error in [technobabble] - auto-recovery under way...", "Bioprinter Monitoring System", "Medical")
		buzz("\The [src] buzzes, \"Error in [technobabble] - auto-recovery under way...\"")
	else
		errored = TRUE
		do_telecomms_announcement(src, "Unrecoverable error in [technobabble] - manual intervention required!", "Bioprinter Monitoring System", "Medical")
		buzz("\The [src] buzzes, \"Unrecoverable error in [technobabble] - manual intervention required!\"")
	update_icon()

/obj/machinery/bioprinter/proc/fulfill_interaction(var/mob/living/carbon/human/user, var/manual = FALSE)
	if(user && !user.skill_check(SKILL_MEDICAL, SKILL_ADEPT))
		to_chat(user, SPAN_WARNING("You don't have the skill required to reset the bioprinter!"))
		return
	if(manual)
		deltimer(interaction_timer_id)
		interaction_timer_id = null
		do_telecomms_announcement(src, "Manual recovery of error in [last_used_technobabble] completed.", "Bioprinter Monitoring System", "Medical")
		if(user)
			to_chat(user, SPAN_NOTICE("You [pick("recalibrate", "reconfigure", "reset", "reboot")] the [last_used_technobabble]."))
	needs_attention = FALSE
	if(errored)
		errored = FALSE
	next_interaction_request = world.time + next_interact_request_delay
	next_increment = world.time
	update_icon()
	if(!manual)
		do_telecomms_announcement(src, "Automatic recovery of error in [last_used_technobabble] completed.", "Bioprinter Monitoring System", "Medical")

/obj/machinery/bioprinter/proc/start_cleaning()
	cleaning = TRUE
	close_pod_start()
	cleaning_timer_id = addtimer(CALLBACK(src, PROC_REF(finish_cleaning)), cleaning_delay, TIMER_STOPPABLE)
	update_icon()

/obj/machinery/bioprinter/proc/finish_cleaning()
	cleaning = FALSE
	cleaning_timer_id = FALSE
	cleaning_interrupted = FALSE
	open_pod_start()
	update_icon()

/obj/machinery/bioprinter/proc/add_lid_overlay(var/color, var/lid_state)
	var/image/I = image(icon, lid_state)
	I.color = color
	I.layer = STRUCTURE_LAYER + 0.07
	lid.add_overlay(I)

/obj/structure/clone_pod_lid
	icon = 'mods/content/resleeving/new_printer.dmi'
	icon_state = "lid"
	vis_flags = VIS_INHERIT_ID
	var/lid_rotated = FALSE

/obj/effect/print_head
	icon = 'mods/content/resleeving/new_printer.dmi'
	icon_state = "print_head"
	vis_flags = VIS_INHERIT_ID

/obj/effect/fake_clone_mob
	icon = 'mods/content/resleeving/new_printer.dmi'
	icon_state = "stage1"
	vis_flags = VIS_INHERIT_ID