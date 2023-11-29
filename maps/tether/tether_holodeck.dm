/datum/map/tether
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