/datum/map_template/ruin/antag_spawn/ninja
	name = "Ninja Base"
	mappaths = list(
		"mods/gamemodes/ninja/maps/ninja_base.dmm"
	)
	modify_tag_vars = FALSE
	shuttles_to_initialise = list(/datum/shuttle/autodock/multi/antag/ninja)
	apc_test_exempt_areas = list(
		/area/map_template/ninja_dojo = NO_SCRUBBER|NO_VENT|NO_APC
	)

/datum/shuttle/autodock/multi/antag/ninja
	name = "Ninja"
	defer_initialisation = TRUE
	warmup_time = 0
	destination_tags = list(
		"nav_ninja_start"
	)
	shuttle_area = /area/map_template/ninja_dojo/start
	current_location = "nav_ninja_start"
	announcer = "Proximity Sensor Array"
	arrival_message = "Attention, anomalous sensor reading detected entering vessel proximity."
	departure_message = "Attention, anomalous sensor reading detected leaving vessel proximity."

/obj/effect/shuttle_landmark/ninja/start
	name = "Clan Dojo"
	landmark_tag = "nav_ninja_start"

// Areas
/area/map_template/ninja_dojo
	name = "\improper Ninja Base"
	icon_state = "green"
	requires_power = 0
	dynamic_lighting = TRUE
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED
	req_access = list(access_ninja)

/area/map_template/ninja_dojo/dojo
	name = "\improper Clan Dojo"
	dynamic_lighting = FALSE

/area/map_template/ninja_dojo/start
	name = "\improper Clan Dojo"
	icon_state = "shuttlered"
	base_turf = /turf/floor/plating