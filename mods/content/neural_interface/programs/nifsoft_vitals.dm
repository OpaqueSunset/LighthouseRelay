// Reimplementation of the suit sensors program but with NIF-specific limitations and functionality.
/datum/computer_file/program/nifsoft/suit_sensors
	filename = "nifsensormonitor"
	filedesc = "NIF Suit Sensors Monitoring"
	nanomodule_path = /datum/nano_module/program/crew_monitor
	ui_header = "crew_green.gif"
	program_icon_state = "crew"
	program_key_state = "med_key"
	program_menu_icon = "heart"
	extended_desc = "This program connects to life signs monitoring system to provide basic information on crew health."
	read_access = list(access_medical)
	requires_network = 1
	requires_network_feature = NET_FEATURE_SECURITY
	network_destination = "crew lifesigns monitoring system"
	size = 11
	category = PROG_MONITOR
	usage_flags = PROGRAM_NIF
	var/has_alert = FALSE

/datum/computer_file/program/nifsoft/suit_sensors/process_tick()
	..()
	var/datum/nano_module/program/crew_monitor/NMC = NM
	if(istype(NMC) && (NMC.has_alerts() != has_alert))
		if(!has_alert)
			program_icon_state = "crew-red"
			ui_header = "crew_red.gif"
		else
			program_icon_state = "crew"
			ui_header = "crew_green.gif"
		update_computer_icon()
		has_alert = !has_alert

	return TRUE

// TODO: Self-body-scan NIF.