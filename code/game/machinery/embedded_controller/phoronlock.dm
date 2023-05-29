/obj/machinery/airlock_sensor/phoron
	name = "phoronlock sensor"
	public_variables = list(
		/decl/public_access/public_variable/airlock_pressure,
		/decl/public_access/public_variable/phoronlock_phoron,
		/decl/public_access/public_variable/input_toggle,
		/decl/public_access/public_variable/set_airlock_cycling/airlock_sensor
	)
	public_methods = list(/decl/public_access/public_method/toggle_input_toggle)
	stock_part_presets = list(
		/decl/stock_part_preset/radio/basic_transmitter/airlock_sensor/phoron = 1,
		/decl/stock_part_preset/radio/receiver/airlock_sensor = 1 // currently no need to change this
	)
	var/phoron


/obj/machinery/airlock_sensor/phoron/Process()
	if(!(stat & (NOPOWER | BROKEN)))
		var/datum/gas_mixture/air_sample = return_air()
		var/pressure = round(air_sample.return_pressure(), 0.1)
		var/new_phoron = round(air_sample.get_gas(/decl/material/solid/phoron), 0.1)

		if(abs(pressure - pressure) > 0.001 || pressure == null || abs(phoron - new_phoron) > 0.01 || phoron == null)
			var/decl/public_access/public_variable/airlock_pressure/pressure_var = GET_DECL(/decl/public_access/public_variable/airlock_pressure)
			var/decl/public_access/public_variable/phoronlock_phoron/phoron_var = GET_DECL(/decl/public_access/public_variable/phoronlock_phoron)
			pressure_var.write_var(src, pressure)
			phoron_var.write_var(src, new_phoron)

			var/new_alert = (pressure < ONE_ATMOSPHERE*0.8) || (phoron > 0.5)
			if(new_alert != alert)
				alert = new_alert
				update_icon()

/decl/public_access/public_variable/phoronlock_phoron
	expected_type = /obj/machinery/airlock_sensor/phoron
	name = "phoronlock sensor phoron"
	desc = "The moles of phoron in the location where the sensor is placed."
	can_write = FALSE
	has_updates = TRUE
	var_type = IC_FORMAT_NUMBER

/decl/public_access/public_variable/phoronlock_phoron/access_var(obj/machinery/airlock_sensor/phoron/sensor)
	return sensor.phoron

/decl/public_access/public_variable/phoronlock_phoron/write_var(obj/machinery/airlock_sensor/phoron/sensor, new_val)
	. = ..()
	if(.)
		sensor.phoron = new_val

/decl/stock_part_preset/radio/basic_transmitter/airlock_sensor/phoron
	transmit_on_change = list(
		"pressure" = /decl/public_access/public_variable/airlock_pressure,
		"phoron" = /decl/public_access/public_variable/phoronlock_phoron
	)

/obj/machinery/portable_atmospherics/powered/scrubber/huge/stationary/phoronlock
	uncreated_component_parts = list(
		/obj/item/stock_parts/power/apc/buildable,
		/obj/item/stock_parts/radio/receiver/buildable,
		/obj/item/stock_parts/radio/transmitter/on_event/buildable,
	)
	public_variables = list(
		/decl/public_access/public_variable/input_toggle,
		/decl/public_access/public_variable/area_uid,
		/decl/public_access/public_variable/identifier,
		/decl/public_access/public_variable/use_power,
		/decl/public_access/public_variable/name,
		/decl/public_access/public_variable/phoronlock_scrubbing_gas
	)
	public_methods = list(
		/decl/public_access/public_method/toggle_power,
		/decl/public_access/public_method/refresh,
		/decl/public_access/public_method/phoronlock_set_scrub_gas
	)
	stock_part_presets = list(
		/decl/stock_part_preset/radio/receiver/phoronlock_scrubber = 1,
		/decl/stock_part_preset/radio/event_transmitter/phoronlock_scrubber = 1
	)

/decl/stock_part_preset/radio/event_transmitter/phoronlock_scrubber
	frequency = EXTERNAL_AIR_FREQ
	event = /decl/public_access/public_variable/input_toggle
	transmit_on_event = list(
		"area" = /decl/public_access/public_variable/area_uid,
		"device" = /decl/public_access/public_variable/identifier,
		"power" = /decl/public_access/public_variable/use_power,
		"scrubbing_gas" = /decl/public_access/public_variable/phoronlock_scrubbing_gas
	)

/decl/stock_part_preset/radio/receiver/phoronlock_scrubber
	frequency = EXTERNAL_AIR_FREQ
	receive_and_call = list(
		"power_toggle" = /decl/public_access/public_method/toggle_power,
		"set_scrub_gas" = /decl/public_access/public_method/phoronlock_set_scrub_gas,
		"status" = /decl/public_access/public_method/refresh
	)
	receive_and_write = list(
		"set_power" = /decl/public_access/public_variable/use_power,
		"init" = /decl/public_access/public_variable/name
	)

/decl/public_access/public_variable/phoronlock_scrubbing_gas
	expected_type = /obj/machinery/portable_atmospherics/powered/scrubber/huge/stationary/phoronlock
	name = "gasses scrubbing"
	desc = "A list of gases that this scrubber is scrubbing."
	can_write = FALSE
	has_updates = FALSE
	var_type = IC_FORMAT_LIST

/decl/public_access/public_variable/phoronlock_scrubbing_gas/access_var(obj/machinery/portable_atmospherics/powered/scrubber/huge/stationary/phoronlock/machine)
	return machine.scrubbing_gas.Copy()

/decl/public_access/public_method/phoronlock_set_scrub_gas
	name = "set filter gases"
	desc = "Given a list of gases, sets whether the gas is being scrubbed to the value of the gas in the list."
	forward_args = TRUE
	call_proc = /obj/machinery/portable_atmospherics/powered/scrubber/huge/stationary/phoronlock/proc/set_scrub_gas

/obj/machinery/portable_atmospherics/powered/scrubber/huge/stationary/phoronlock/proc/set_scrub_gas(list/gases)
	for(var/gas_id in gases)
		if((gas_id in scrubbing_gas) ^ gases[gas_id])
			scrubbing_gas ^= gas_id

//Special scrubber with bonus inbuilt heater
/obj/machinery/portable_atmospherics/powered/scrubber/huge/stationary/phoronlock
	volume_rate = 40000 // Approx. 16 turfs worth of air
	power_rating = 7.5 KILOWATTS * 4 // Increase the limit 4x
	power_efficiency = 0.25 // and decrease consumption to just 0.25x
	var/target_temp = T20C
	var/heating_power = 150 KILOWATTS /// The maximum thermal energy added in one tick.

// Modified to heat the environment after scrubbing it.
// Unlike on CitRP/Virgo this is done separately from the scrubbing step.
/obj/machinery/portable_atmospherics/powered/scrubber/huge/stationary/phoronlock/process_scrubber()
	. = ..()
	if((use_power == POWER_USE_ACTIVE) && !(stat & NOPOWER))
		var/datum/gas_mixture/environment
		if(holding)
			environment = holding.air_contents
		else
			environment = loc.return_air()
		if(environment && (target_temp > environment.temperature)) // doesn't cool, just heats
			var/datum/gas_mixture/heated_gas = environment.remove_ratio(0.25) // can only heat 25% at a time, using space heater code as a reference
			if(heated_gas)
				var/heat_transfer = min(heating_power, heated_gas.get_thermal_energy_change(target_temp))
				heated_gas.add_thermal_energy(heat_transfer)
				environment.merge(heated_gas)
				use_power_oneoff(heat_transfer)

//
// PHORON LOCK CONTROLLER
//
/obj/machinery/embedded_controller/radio/airlock/phoron
	var/tag_scrubber

/obj/machinery/embedded_controller/radio/airlock/phoron/Initialize()
	. = ..()
	program = new/datum/computer/file/embedded_program/airlock/phoron(src)

//Advanced airlock controller for when you want a more versatile airlock controller - useful for turning simple access control rooms into airlocks
/obj/machinery/embedded_controller/radio/airlock/phoron
	name = "Phoron Lock Controller"

/obj/machinery/embedded_controller/radio/airlock/phoron/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1)
	var/data[0]

	data = list(
		"chamber_pressure" = program.memory["chamber_sensor_pressure"],
		"chamber_phoron" = program.memory["chamber_sensor_phoron"],
		"exterior_status" = program.memory["exterior_status"],
		"interior_status" = program.memory["interior_status"],
		"processing" = program.memory["processing"]
	)

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "phoron_airlock_console.tmpl", name, 470, 290)
		ui.set_initial_data(data)
		ui.open()
		ui.set_auto_update(TRUE)

/obj/machinery/embedded_controller/radio/airlock/phoron/modify_mapped_vars(map_hash)
	..()
	ADJUST_TAG_VAR(tag_scrubber, map_hash)

//
// PHORON LOCK CONTROLLER PROGRAM
//

//Handles the control of airlocks
// Airlocks
#define STATE_IDLE			0
#define STATE_PREPARE		1
#define STATE_CLEAN			16
#define STATE_PRESSURIZE	17

#define TARGET_NONE			0
#define TARGET_INOPEN		-1
#define TARGET_OUTOPEN		-2

/datum/computer/file/embedded_program/airlock/phoron
	var/tag_scrubber

// TODO: MOVE THESE TO MAP FILES
//Atmosphere properties
#define VIRGO3B_ONE_ATMOSPHERE	82.4 //kPa
#define VIRGO3B_AVG_TEMP	234 //kelvin

#define VIRGO3B_PER_N2		0.16 //percent
#define VIRGO3B_PER_O2		0.00
#define VIRGO3B_PER_N2O		0.00 //Currently no capacity to 'start' a turf with this. See turf.dm
#define VIRGO3B_PER_CO2		0.12
#define VIRGO3B_PER_PHORON	0.72

//Math only beyond this point
#define VIRGO3B_MOL_PER_TURF	(VIRGO3B_ONE_ATMOSPHERE*CELL_VOLUME/(VIRGO3B_AVG_TEMP*R_IDEAL_GAS_EQUATION))
#define VIRGO3B_MOL_N2			(VIRGO3B_MOL_PER_TURF * VIRGO3B_PER_N2)
#define VIRGO3B_MOL_O2			(VIRGO3B_MOL_PER_TURF * VIRGO3B_PER_O2)
#define VIRGO3B_MOL_N2O			(VIRGO3B_MOL_PER_TURF * VIRGO3B_PER_N2O)
#define VIRGO3B_MOL_CO2			(VIRGO3B_MOL_PER_TURF * VIRGO3B_PER_CO2)
#define VIRGO3B_MOL_PHORON		(VIRGO3B_MOL_PER_TURF * VIRGO3B_PER_PHORON)
// END TODO

/datum/computer/file/embedded_program/airlock/phoron/New(var/obj/machinery/embedded_controller/M)
	..(M)
	memory["chamber_sensor_phoron"] = 0
	memory["external_sensor_pressure"] = VIRGO3B_ONE_ATMOSPHERE
	memory["external_sensor_phoron"] = VIRGO3B_MOL_PHORON
	memory["internal_sensor_phoron"] = 0
	memory["scrubber_status"] = "unknown"
	memory["target_phoron"] = 0.1
	memory["secure"] = TRUE
	if (istype(M, /obj/machinery/embedded_controller/radio/airlock/phoron))	//if our controller is an airlock controller than we can auto-init our tags
		var/obj/machinery/embedded_controller/radio/airlock/phoron/controller = M
		memory["secure"] = controller.tag_secure
		cycle_to_external_air = controller.cycle_to_external_air

#define SET_AIRLOCK_TAG(FROM_CONTROLLER, FROM_SRC) (base_tag ? FROM_SRC : (FROM_CONTROLLER || FROM_SRC))
/datum/computer/file/embedded_program/airlock/phoron/reset_id_tags(base_tag)
	. = ..()
	if(istype(master, /obj/machinery/embedded_controller/radio/airlock))	//if our controller is a phoronlock controller than we can auto-init our tags
		var/obj/machinery/embedded_controller/radio/airlock/phoron/controller = master
		tag_scrubber = SET_AIRLOCK_TAG(controller.tag_scrubber, "[id_tag]_scrubber")
#undef SET_AIRLOCK_TAG


/datum/computer/file/embedded_program/airlock/phoron/receive_signal(datum/signal/signal, receive_method, receive_param)
	var/receive_tag = signal.data["tag"]
	if(!receive_tag) return

	if((. = ..()))
		return

	// Adds the phoron variables; pressure is already handled in parent
	if(receive_tag==tag_chamber_sensor)
		memory["chamber_sensor_phoron"] = text2num(signal.data["phoron"])

	else if(receive_tag==tag_exterior_sensor)
		memory["external_sensor_phoron"] = text2num(signal.data["phoron"])

	else if(receive_tag==tag_interior_sensor)
		memory["internal_sensor_phoron"] = text2num(signal.data["phoron"])

	else if(receive_tag==tag_scrubber)
		if(signal.data["power"])
			memory["scrubber_status"] = "on"
		else
			memory["scrubber_status"] = "off"

// Note: This code doesn't wait for pumps and scrubbers to be offline like other code does
// The idea is to make the doors open and close faster, since there isn't much harm really.
// But lets evaluate how it actually works in the game.
/datum/computer/file/embedded_program/airlock/phoron/process()
	switch(state)
		if(STATE_IDLE)
			if(target_state == TARGET_INOPEN)
				// TODO - Check if okay to just open immediately
				close_doors()
				state = STATE_PREPARE
			else if(target_state == TARGET_OUTOPEN)
				close_doors()
				state = STATE_PREPARE
			// else if(memory["scrubber_status"] != "off")
			// 	signalScrubber(tag_scrubber, 0) // Keep scrubbers off while idle
			// else if(memory["pump_status"] != "off")
			// 	signalPump(tag_airpump, 0) // Keep vent pump off while idle

		if(STATE_PREPARE)
			if (check_doors_secured())
				if(target_state == TARGET_INOPEN)
					// TODO: Phoronlock TTS from Virgo?
					// playsound(master, 'sound/AI/airlockin.ogg', 100, 0)
					if(memory["chamber_sensor_phoron"] > memory["target_phoron"])
						state = STATE_CLEAN
						signalScrubber(tag_scrubber, 1) // Start cleaning
						signalPump(tag_airpump, 1, 1, memory["target_pressure"]) // And pressurizng to offset losses
					else // We can go directly to pressurize
						state = STATE_PRESSURIZE
						signalPump(tag_airpump, 1, 1, memory["target_pressure"]) // Send a signal to start pressurizing
				// We must be cycling outwards! Shut down the pumps and such!
				else if(memory["scrubber_status"] != "off")
					signalScrubber(tag_scrubber, 0)
				else if(memory["pump_status"] != "off")
					signalPump(tag_airpump, 0)
				else
					// See above TODO
					// playsound(master, 'sound/AI/airlockout.ogg', 100, 0)
					cycleDoors(target_state)
					state = STATE_IDLE
					target_state = TARGET_NONE

		if(STATE_CLEAN)
			playsound(master, 'sound/machines/twobeep.ogg', 100, 0)
			if(!check_doors_secured())
				//the airlock will not allow itself to continue to cycle when any of the doors are forced open.
				stop_cycling()
			else if(memory["chamber_sensor_phoron"] <= memory["target_phoron"])
				// Okay, we reached target phoron! Turn off the scrubber
				signalScrubber(tag_scrubber, 0)
				// And proceed to finishing pressurization
				state = STATE_PRESSURIZE

		if(STATE_PRESSURIZE)
			playsound(master, 'sound/machines/twobeep.ogg', 100, 0)
			if(!check_doors_secured())
				//the airlock will not allow itself to continue to cycle when any of the doors are forced open.
				stop_cycling()
			else if(memory["chamber_sensor_pressure"] >= memory["target_pressure"] * 0.95)
				signalPump(tag_airpump, 0)	// send a signal to stop pumping. No need to wait for it tho.
				cycleDoors(target_state)
				// TODO: VIRGO AIRLOCK TTS
				// playsound(master, 'sound/AI/airlockdone.ogg', 100, 0)
				state = STATE_IDLE
				target_state = TARGET_NONE

	memory["processing"] = (state != target_state)
	return 1

/datum/computer/file/embedded_program/airlock/phoron/stop_cycling()
	state = STATE_IDLE
	target_state = TARGET_NONE
	signalPump(tag_airpump, 0)
	signalScrubber(tag_scrubber, 0)

/datum/computer/file/embedded_program/airlock/phoron/proc/signalScrubber(var/tag, var/power)
	var/datum/signal/signal = new
	signal.data = list(
		"tag" = tag,
		"sigtype" = "command",
		"power" = "[power]",
	)
	post_signal(signal)