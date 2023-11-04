/datum/map/tether
	name = "Lighthouse"
	full_name = "NRS Lighthouse"
	path = "tether"
	ground_noun = "deck"

	station_name  = "NRS Lighthouse"
	station_short = "Lighthouse"

	dock_name     = "Lighthouse Colony"
	boss_name     = "Central Command"
	boss_short    = "CentCom"
	company_name  = "NanoTrasen"
	company_short = "NT"
	system_name   = "Virgo-Erigone"
	overmap_ids = list(OVERMAP_ID_SPACE)
	num_exoplanets = 0
	// TODO: evac_controller_type = /datum/evacuation_controller/tram
/*
	shuttle_docked_message = "The scheduled Orange Line tram to the %dock_name% has arrived. It will depart in approximately %ETD%."
	shuttle_leaving_dock = "The Orange Line tram has left the station. Estimate %ETA% until the tram arrives at %dock_name%."
	shuttle_called_message = "A scheduled crew transfer to the %dock_name% is occuring. The tram will be arriving shortly. Those departing should proceed to the Orange Line tram station within %ETA%."
	shuttle_recall_message = "The scheduled crew transfer has been cancelled."
	shuttle_name = "Automated Tram"
	emergency_shuttle_docked_message = "The evacuation tram has arrived at the tram station. You have approximately %ETD% to board the tram."
	emergency_shuttle_leaving_dock = "The emergency tram has left the station. Estimate %ETA% until the tram arrives at %dock_name%."
	emergency_shuttle_called_message = "An emergency evacuation has begun, and an off-schedule tram has been called. It will arrive at the tram station in approximately %ETA%."
	emergency_shuttle_recall_message = "The evacuation tram has been recalled."
*/


	starting_money = 5000
	department_money = 0
	salary_modifier = 0.2

	radiation_detected_message = "High levels of radiation have been detected in proximity of the %STATION_NAME%. Please move to a shielded area such as the cargo bay, dormitories or medbay until the radiation has passed."
	default_telecomms_channels = list(
		COMMON_FREQUENCY_DATA,
		list("name" = "Entertainment", "key" = "z", "frequency" = 1461, "color" = COMMS_COLOR_ENTERTAIN, "span_class" = CSS_CLASS_RADIO, "receive_only" = TRUE),
		list("name" = "Command",       "key" = "c", "frequency" = 1353, "color" = COMMS_COLOR_COMMAND,   "span_class" = "comradio", "secured" = list(access_bridge)),
		list("name" = "Security",      "key" = "s", "frequency" = 1359, "color" = COMMS_COLOR_SECURITY,  "span_class" = "secradio", "secured" = list(access_security)),
		list("name" = "Engineering",   "key" = "e", "frequency" = 1357, "color" = COMMS_COLOR_ENGINEER,  "span_class" = "engradio", "secured" = list(access_engine)),
		list("name" = "Medical",       "key" = "m", "frequency" = 1355, "color" = COMMS_COLOR_MEDICAL,   "span_class" = "medradio", "secured" = list(access_medical)),
		list("name" = "Science",       "key" = "n", "frequency" = 1351, "color" = COMMS_COLOR_SCIENCE,   "span_class" = "sciradio", "secured" = list(access_research)),
		list("name" = "Service",       "key" = "v", "frequency" = 1349, "color" = COMMS_COLOR_SERVICE,   "span_class" = "srvradio", "secured" = list(access_bar)),
		list("name" = "Supply",        "key" = "u", "frequency" = 1347, "color" = COMMS_COLOR_SUPPLY,    "span_class" = "supradio", "secured" = list(access_cargo)),
		list("name" = "Exploration",   "key" = "x", "frequency" = 1361, "color" = COMMS_COLOR_EXPLORER , "span_class" = "EXPradio", "secured" = list(access_eva)),
		list("name" = "AI Private",    "key" = "p", "frequency" = 1343, "color" = COMMS_COLOR_AI,        "span_class" = "airadio",  "secured" = list(access_ai_upload))
	)

	holodeck_programs = list(
		"emptycourt"      = new/datum/holodeck_program(/area/holodeck/source_emptycourt, list('sound/music/THUNDERDOME.ogg')),
		"boxingcourt"     = new/datum/holodeck_program(/area/holodeck/source_boxingcourt, list('sound/music/THUNDERDOME.ogg')),
		"basketball"       = new/datum/holodeck_program(/area/holodeck/source_basketball, list('sound/music/THUNDERDOME.ogg')),
		"thunderdome"      = new/datum/holodeck_program(/area/holodeck/source_thunderdomecourt, list('sound/music/THUNDERDOME.ogg')),
		"beach"            = new/datum/holodeck_program(/area/holodeck/source_beach, list('sound/music/europa/WildEncounters.ogg')),
		"desert"           = new/datum/holodeck_program(/area/holodeck/source_desert,
														list(
															'sound/effects/wind/wind_2_1.ogg',
											 				'sound/effects/wind/wind_2_2.ogg',
											 				'sound/effects/wind/wind_3_1.ogg',
											 				'sound/effects/wind/wind_4_1.ogg',
											 				'sound/effects/wind/wind_4_2.ogg',
											 				'sound/effects/wind/wind_5_1.ogg'
												 			)
		 												),
		"snowfield"        = new/datum/holodeck_program(/area/holodeck/source_snowfield,
														list(
															'sound/effects/wind/wind_2_1.ogg',
											 				'sound/effects/wind/wind_2_2.ogg',
											 				'sound/effects/wind/wind_3_1.ogg',
											 				'sound/effects/wind/wind_4_1.ogg',
											 				'sound/effects/wind/wind_4_2.ogg',
											 				'sound/effects/wind/wind_5_1.ogg'
												 			)
		 												),
		"space"            = new/datum/holodeck_program(/area/holodeck/source_space,
														list(
															'sound/ambience/ambispace.ogg',
															'sound/music/main.ogg',
															'sound/music/space.ogg',
															'sound/music/traitor.ogg',
															)
														),
		"picnicarea"       = new/datum/holodeck_program(/area/holodeck/source_picnicarea, list('sound/music/title2.ogg')),
		"theatre"          = new/datum/holodeck_program(/area/holodeck/source_theatre),
		"meetinghall"      = new/datum/holodeck_program(/area/holodeck/source_meetinghall),
		"courtroom"        = new/datum/holodeck_program(/area/holodeck/source_courtroom, list('sound/music/traitor.ogg')),
		"wildlifecarp"     = new/datum/holodeck_program(/area/holodeck/source_wildlife, list()),
		"turnoff"          = new/datum/holodeck_program(/area/holodeck/source_plating, list()),
		"dormturnoff"      = new/datum/holodeck_program(/area/holodeck/holodorm/source_off),
		"basicdorm"        = new/datum/holodeck_program(/area/holodeck/holodorm/source_basic),
		"tableseating"     = new/datum/holodeck_program(/area/holodeck/holodorm/source_seating),
		"beachsim"         = new/datum/holodeck_program(/area/holodeck/holodorm/source_beach),
		"desertarea"       = new/datum/holodeck_program(/area/holodeck/holodorm/source_desert),
		"snowdorm"         = new/datum/holodeck_program(/area/holodeck/holodorm/source_snow),
		"flowergarden"     = new/datum/holodeck_program(/area/holodeck/holodorm/source_garden),
		"spacesim"         = new/datum/holodeck_program(/area/holodeck/holodorm/source_space),
		"boxingring"       = new/datum/holodeck_program(/area/holodeck/holodorm/source_boxing)
	)

	holodeck_off_program = list(
		"TetherHolodorm" = "dormturnoff",
		"TetherMainHolodeck" = "turnoff",
	)

	holodeck_default_program = list(
		"TetherHolodorm" = "basicdorm",
		"TetherMainHolodeck" = "emptycourt"
	)

	holodeck_supported_programs = list(
		"TetherHolodorm" = list(
			"Holodorm Off"  = "dormturnoff",
			"Basic Dorm"    = "basicdorm",
			"Table Seating" = "tableseating",
			"Beach Sim"     = "beachsim",
			"Desert Area"   = "desertarea",
			"Snow Field"    = "snowdorm",
			"Flower Garden" = "flowergarden",
			"Space Sim"     = "spacesim",
			"Boxing Ring"   = "boxingring"
		),
		"TetherMainHolodeck" = list(
			"Holodeck Off"     = "turnoff",
			"Empty Court"      = "emptycourt",
			"Boxing Court"     = "boxingcourt",
			"Basketball Court" = "basketball",
			"Thunderdome"      = "thunderdome",
			"Beach"            = "beach",
			"Desert"           = "desert",
			"Snowy Field"      = "snowfield",
			"Space"            = "space",
			"Picnic Area"      = "picnicarea",
			"Theatre"          = "theatre",
			"Meeting Hall"     =      "meetinghall",
			"Courtroom"        = "courtroom"
		)
	)

	holodeck_restricted_programs = list(
		"TetherMainHolodeck" = list(
			"Wildlife Simulation" = "wildlifecarp"
		)
	)

/datum/map/tether/get_map_info()
	return "You're aboard the <b>[station_name],</b> a backwater communications relay propping up the entire Frontier telecommunications network. \
	No meaningful government can claim the resources in this distant sector, leaving NanoTrasen the only real influence on its denizens."

/datum/map/tether/create_trade_hubs()
	new /datum/trade_hub/singleton/tether

/datum/trade_hub/singleton/tether
	name = "Lighthouse Freight Network"

/datum/trade_hub/singleton/tether/get_initial_traders()
	return list(
		/datum/trader/xeno_shop,
		/datum/trader/medical,
		/datum/trader/mining,
		/datum/trader/books
	)

// Overmap represetation of tether
/obj/effect/overmap/visitable/sector/virgo3b
	name = "Virgo 3B"
	desc = "Full of phoron, and home to the NSR Lighthouse, the backwater backbone of the Frontier telecommunications network."
	icon = 'maps/tether/icons/obj/overmap_vr.dmi'
	icon_state = "virgo3b"

/obj/effect/overmap/visitable/sector/virgo3b/generate_skybox()
	return overlay_image('maps/tether/icons/skybox/virgo3b.dmi', "small", null, RESET_COLOR)