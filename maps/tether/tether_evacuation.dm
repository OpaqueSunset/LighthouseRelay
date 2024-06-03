/datum/map/tether
	evac_controller_type = /datum/evacuation_controller/shuttle/tram

/datum/evacuation_controller/shuttle/tram
	name = "departures tram controller"
	evacuation_options = list(
		EVAC_OPT_CALL_SHUTTLE = new /datum/evacuation_option/call_shuttle/tram,
		EVAC_OPT_RECALL_SHUTTLE = new /datum/evacuation_option/recall_shuttle/tram
	)

/datum/evacuation_option/call_shuttle/tram
	option_text = "Call emergency tram"
	option_desc = "call the emergency tram"

/datum/evacuation_option/recall_shuttle/tram
	option_text = "Cancel tram call"
	option_desc = "recall the emergency tram"

/datum/shuttle/autodock/ferry/emergency/escape_shuttle
	name = "Escape Shuttle"
	warmup_time = 10
	location = 1
	shuttle_area = /area/shuttle/escape/centcom
	waypoint_offsite = "nav_tram_start"
	waypoint_station = "nav_tram_station"
	landmark_transition = "nav_tram_transit"

/obj/effect/shuttle_landmark/escape_shuttle/start
	landmark_tag = "nav_tram_start"

/obj/effect/shuttle_landmark/escape_shuttle/transit
	landmark_tag = "nav_tram_transit"

/obj/effect/shuttle_landmark/escape_shuttle/station
	landmark_tag = "nav_tram_station"