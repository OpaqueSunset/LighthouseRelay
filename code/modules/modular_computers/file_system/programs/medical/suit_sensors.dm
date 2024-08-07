/datum/computer_file/program/suit_sensors
	filename = "sensormonitor"
	filedesc = "Suit Sensors Monitoring"
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
	var/has_alert = FALSE

/datum/computer_file/program/suit_sensors/process_tick()
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

	return 1

/datum/nano_module/program/crew_monitor
	name = "Crew monitor"

/datum/nano_module/program/crew_monitor/proc/has_alerts()
	var/datum/computer_network/network = get_network()
	if(!network)
		return FALSE
	for(var/z_level in SSmapping.get_connected_levels(network.get_router_z()))
		if (crew_repository.has_health_alert(z_level))
			return TRUE
	return FALSE

/datum/nano_module/program/crew_monitor/Topic(href, href_list)
	if(..()) return 1

	if(href_list["track"])
		if(isAI(usr))
			var/mob/living/silicon/ai/AI = usr
			var/mob/living/human/H = locate(href_list["track"]) in SSmobs.mob_list
			if(hassensorlevel(H, VITALS_SENSOR_TRACKING))
				AI.ai_actual_track(H)
		return 1

/datum/nano_module/program/crew_monitor/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1, var/datum/topic_state/state = global.default_topic_state)

	var/list/data = host.initial_data()
	data["isAI"] = isAI(user)

	var/list/crewmembers = list()
	var/datum/computer_network/network = get_network()
	if(network)
		for(var/z_level in SSmapping.get_connected_levels(network.get_router_z()))
			crewmembers += crew_repository.health_data(z_level)
		data["crewmembers"] = sortTim(crewmembers, /proc/cmp_list_name_key_asc)
	else
		data["crewmembers"] = list()

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if(!ui)
		ui = new(user, src, ui_key, "crew_monitor.tmpl", "Crew Monitoring Computer", 1050, 800, state = state)

		// adding a template with the key "mapContent" enables the map ui functionality
		ui.add_template("mapContent", "crew_monitor_map_content.tmpl")
		// adding a template with the key "mapHeader" replaces the map header content
		ui.add_template("mapHeader", "crew_monitor_map_header.tmpl")

		ui.set_initial_data(data)
		ui.open()
		ui.set_auto_update(1)
