/obj/machinery/atmospherics/binary/algae_farm
	name = "algae oxygen generator"
	desc = "An oxygen generator using algae to convert carbon dioxide to oxygen."
	icon = 'icons/obj/machines/algae.dmi'
	icon_state = "algae-off"
	anchored = TRUE
	density = TRUE
	power_channel = EQUIP
	use_power = POWER_USE_IDLE
	idle_power_usage = 100		// Minimal lights to keep algae alive
	active_power_usage = 5000	// Powerful grow lights to stimulate oxygen production
	construct_state = /decl/machine_construction/default/panel_closed
	uncreated_component_parts = null
	stat_immune = 0
	obj_flags = OBJ_FLAG_ANCHORABLE | OBJ_FLAG_ROTATABLE
	base_type = /obj/machinery/atmospherics/binary/algae_farm
	power_rating = 7500			//7500 W ~ 10 HP

	var/list/stored_material =  list(/decl/material/solid/organic/plantmatter/algae = 0, /decl/material/solid/graphite = 0)
	// Capacity increases with matter bin quality
	var/list/storage_capacity = list(/decl/material/solid/organic/plantmatter/algae = 10000, /decl/material/solid/graphite = 10000)
	// Speed at which we convert CO2 to O2.  Increases with manipulator quality
	var/moles_per_tick = 1
	// Power required to convert one mole of CO2 to O2 (this is powering the grow lights).  Improves with capacitors
	var/power_per_mole = 1000
	var/algae_per_mole = 2
	var/carbon_per_mole = 2

	var/recent_power_used = 0
	var/recent_moles_transferred = 0
	var/ui_error = null // For error messages to show up in nano ui.

	var/datum/gas_mixture/internal = new()
	var/const/input_gas = /decl/material/gas/carbon_dioxide
	var/const/output_gas = /decl/material/gas/oxygen

/obj/machinery/atmospherics/binary/algae_farm/filled
	stored_material = list(/decl/material/solid/organic/plantmatter/algae = 10000, /decl/material/solid/graphite = 0)

/obj/machinery/atmospherics/binary/algae_farm/examine(mob/user)
	. = ..()
	to_chat(user, SPAN_NOTICE("Its output port is to the [dir2text(dir)]."))

/obj/machinery/atmospherics/binary/algae_farm/Initialize()
	. = ..()
	update_icon()
	// TODO - Make these in actual icon states so its not silly like this
	var/image/I = image(icon = icon, icon_state = "algae-pipe-overlay", dir = dir)
	I.color = PIPE_COLOR_BLUE
	overlays += I
	I = image(icon = icon, icon_state = "algae-pipe-overlay", dir = reverse_dir[dir])
	I.color = PIPE_COLOR_BLACK
	overlays += I

/obj/machinery/atmospherics/binary/algae_farm/Destroy()
	QDEL_NULL(internal)
	return ..()

/obj/machinery/atmospherics/binary/algae_farm/Process()
	..()
	recent_moles_transferred = 0

	if(inoperable() || use_power < POWER_USE_ACTIVE)
		ui_error = null
		update_icon()
		if(use_power == POWER_USE_IDLE)
			last_power_draw = idle_power_usage
		else
			last_power_draw = 0
		return 0

	last_power_draw = active_power_usage

	var/decl/material/algae_mat = GET_DECL(/decl/material/solid/organic/plantmatter/algae)
	var/decl/material/graphite_mat = GET_DECL(/decl/material/solid/graphite)
	var/datum/gas_mixture/input_mix = air_in_dir(turn(dir, 180))
	var/datum/gas_mixture/output_mix = air_in_dir(dir)
	// STEP 1 - Check material resources
	if(stored_material[/decl/material/solid/organic/plantmatter/algae] < algae_per_mole)
		ui_error = "Insufficient [algae_mat.use_name] to process."
		update_icon()
		return
	if(stored_material[/decl/material/solid/graphite] + carbon_per_mole > storage_capacity[/decl/material/solid/graphite])
		ui_error = "[graphite_mat.use_name] output storage is full."
		update_icon()
		return
	var/moles_to_convert = min(moles_per_tick,\
		stored_material[/decl/material/solid/organic/plantmatter/algae] * algae_per_mole,\
		storage_capacity[/decl/material/solid/graphite] - stored_material[/decl/material/solid/graphite])

	// STEP 2 - Take the CO2 out of the input!
	var/power_draw = scrub_gas(src, list(input_gas), input_mix, internal, moles_to_convert, power_rating)
	if (power_draw > 0)
		use_power_oneoff(power_draw)
		last_power_draw += power_draw

	// STEP 3 - Convert CO2 to O2  (Note: We know our internal group multipier is 1, so just be cool)
	var/co2_moles = internal.gas[input_gas]
	var/decl/material/input_gas_mat = GET_DECL(input_gas)
	if(co2_moles < MINIMUM_MOLES_TO_FILTER)
		ui_error = "Insufficient [input_gas_mat.use_name] to process."
		update_icon()
		return

	// STEP 4 - Consume the resources
	var/converted_moles = min(co2_moles, moles_per_tick)
	use_power_oneoff(converted_moles * power_per_mole)
	last_power_draw += converted_moles * power_per_mole
	stored_material[/decl/material/solid/organic/plantmatter/algae] -= converted_moles * algae_per_mole
	stored_material[/decl/material/solid/graphite] += converted_moles * carbon_per_mole

	// STEP 5 - Output the converted oxygen. Fow now we output for free!
	internal.adjust_gas(input_gas, -converted_moles)
	output_mix.adjust_gas_temp(output_gas, converted_moles, internal.temperature)
	update_networks()
	recent_moles_transferred = converted_moles
	ui_error = null // Success!
	update_icon()

/obj/machinery/atmospherics/binary/algae_farm/on_update_icon()
	if(inoperable() || !anchored || use_power < POWER_USE_ACTIVE)
		icon_state = "algae-off"
	else if(recent_moles_transferred >= moles_per_tick)
		icon_state = "algae-full"
	else if(recent_moles_transferred > 0)
		icon_state = "algae-full"
	else
		icon_state = "algae-on"

/obj/machinery/atmospherics/binary/algae_farm/attackby(obj/item/W, mob/user)
	if((. = ..()))
		return
	if(try_load_materials(user, W))
		return TRUE
	else
		to_chat(user, "<span class='notice'>You cannot insert this item into \the [src]!</span>")
		return TRUE

/obj/machinery/atmospherics/binary/algae_farm/attack_hand(mob/user)
	if(..())
		return TRUE
	ui_interact(user)

/obj/machinery/atmospherics/binary/algae_farm/RefreshParts()
	..()
	power_per_mole = round(initial(power_per_mole) / total_component_rating_of_type(/obj/item/stock_parts/capacitor))
	var/storage = 5000 * (total_component_rating_of_type(/obj/item/stock_parts/matter_bin)**2)/2
	for(var/mat in storage_capacity)
		storage_capacity[mat] = storage
	moles_per_tick = initial(moles_per_tick) + (total_component_rating_of_type(/obj/item/stock_parts/manipulator)**2 - 1)

/obj/machinery/atmospherics/binary/algae_farm/ui_interact(mob/user, ui_key = "main", datum/nanoui/ui = null, force_open = 1, datum/nanoui/master_ui = null, datum/topic_state/state = global.default_topic_state)
	var/data[0]
	data["panelOpen"] = panel_open

	var/materials_ui[0]
	for(var/M in stored_material)
		var/decl/material/curr_mat = GET_DECL(M)
		materials_ui[++materials_ui.len] = list(
				"path" = M,
				"display" = curr_mat.use_name,
				"qty" = stored_material[M],
				"max" = storage_capacity[M],
				"percent" = (stored_material[M] / storage_capacity[M] * 100))
	data["materials"] = materials_ui
	data["last_flow_rate"] = last_flow_rate
	data["last_power_draw"] = last_power_draw
	data["inputDir"] = dir2text(reverse_dir[dir])
	data["outputDir"] = dir2text(dir)
	data["usePower"] = use_power
	data["errorText"] = ui_error

	var/decl/material/input_gas_mat = GET_DECL(input_gas)
	var/decl/material/output_gas_mat = GET_DECL(output_gas)
	var/datum/gas_mixture/input_mix = air_in_dir(turn(dir, 180))
	var/datum/gas_mixture/output_mix = air_in_dir(dir)
	if(input_mix)
		data["input"] = list(
			"pressure" = input_mix.return_pressure(),
			"name" = input_gas_mat.use_name,
			"percent" = input_mix.total_moles > 0 ? round((input_mix.gas[input_gas] / input_mix.total_moles) * 100) : 0,
			"moles" = round(input_mix.gas[input_gas], 0.01))
	if(output_mix)
		data["output"] = list(
			"pressure" = output_mix.return_pressure(),
			"name" = output_gas_mat.use_name,
			"percent" = output_mix.total_moles ? round((output_mix.gas[output_gas] / output_mix.total_moles) * 100) : 0,
			"moles" = round(output_mix.gas[output_gas], 0.01))

	// update the ui if it exists, returns null if no ui is passed/found
	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "algae_farm.tmpl", "Algae Farm Control Panel", 500, 600)
		ui.set_initial_data(data)
		ui.set_auto_update(TRUE)
		ui.open()

/obj/machinery/atmospherics/binary/algae_farm/Topic(href, href_list)
	if(..())
		return TRUE
	usr.set_machine(src)
	add_fingerprint(usr)

	// Queue management can be done even while busy
	if(href_list["activate"])
		update_use_power(POWER_USE_ACTIVE)
		update_icon()
		updateUsrDialog()
		return

	if(href_list["deactivate"])
		update_use_power(POWER_USE_IDLE)
		update_icon()
		updateUsrDialog()
		return

	if(href_list["ejectMaterial"])
		var/mat_path = href_list["ejectMaterial"]
		if(!(mat_path in stored_material))
			return
		eject_materials(GET_DECL(mat_path), 0)
		updateUsrDialog()
		return

// amount = 0 means ejecting a full stack; -1 means eject everything
/obj/machinery/atmospherics/binary/algae_farm/proc/eject_materials(var/decl/material/mat, var/amount)
	var/max_ejectable = round(stored_material[mat.type] / SHEET_MATERIAL_AMOUNT)
	if(amount == -1)
		amount = max_ejectable
	amount = min(max_ejectable, amount)
	mat.create_object(loc, amount)
	stored_material[mat.type] -= amount * SHEET_MATERIAL_AMOUNT

// Attept to load materials.  Returns 0 if item wasn't a stack of materials, otherwise 1 (even if failed to load)
/obj/machinery/atmospherics/binary/algae_farm/proc/try_load_materials(var/mob/user, var/obj/item/stack/material/S)
	if(!istype(S))
		return FALSE
	if(!(S.material.type in stored_material))
		to_chat(user, SPAN_WARNING("\The [src] doesn't accept [S.material.use_name]!"))
		return TRUE
	var/max_res_amount = storage_capacity[S.material.type]
	if(stored_material[S.material.type] < max_res_amount)
		var/used_amount = min((max_res_amount - stored_material[S.material.type]) / SHEET_MATERIAL_AMOUNT, S.amount)
		if(used_amount > 0 && S.use(used_amount))
			stored_material += SHEET_MATERIAL_AMOUNT * used_amount
		user.visible_message("<b>\The [user]</b> inserts [S.get_string_for_amount(used_amount)] into \the [src].", SPAN_NOTICE("You insert [S.get_string_for_amount(used_amount)] into \the [src]."))
		updateUsrDialog()
	else
		to_chat(user, SPAN_WARNING("\The [src] cannot hold more [S.reinf_material ? "reinforced " : null][S.material.use_name] [S.plural_name]."))
	return TRUE
