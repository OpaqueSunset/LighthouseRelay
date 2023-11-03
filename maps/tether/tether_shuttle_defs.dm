//////////////////////////////////////////////////////////////
// Escape shuttle and pods
/datum/shuttle/autodock/ferry/emergency/escape
	name = "Escape"
	location = 1 // At offsite
	warmup_time = 10
	// waypoint_station
	// waypoint_offsite
	docking_controller_tag = "escape_shuttle"
	dock_target_station = "escape_dock"
	dock_target_offsite = "centcom_dock"
	move_time = SHUTTLE_TRANSIT_DURATION_RETURN

//////////////////////////////////////////////////////////////
/datum/shuttle/autodock/ferry/escape_pod/large_escape_pod1
	name = "Large Escape Pod 1"
	location = 0
	warmup_time = 0
	// waypoint_station
	// waypoint_offsite
	docking_controller_tag = "large_escape_pod_1"
	dock_target_station = "large_escape_pod_1_berth"
	dock_target_offsite = "large_escape_pod_1_recovery"
	move_time = SHUTTLE_TRANSIT_DURATION_RETURN

//////////////////////////////////////////////////////////////
// Supply shuttle
/datum/shuttle/autodock/ferry/supply/cargo
	name = "Supply"
	location = 1
	warmup_time = 10
	// waypoint_station
	// waypoint_offsite
	docking_controller_tag = "supply_shuttle"
	dock_target_station = "cargo_bay"
	flags = SHUTTLE_FLAGS_PROCESS|SHUTTLE_FLAGS_SUPPLY

//////////////////////////////////////////////////////////////
// Trade Ship
/datum/shuttle/autodock/ferry/trade
	name = "Trade"
	location = 1
	warmup_time = 10	//want some warmup time so people can cancel.
	// waypoint_station
	// waypoint_offsite
	docking_controller_tag = "trade_shuttle"
	dock_target_station = "trade_shuttle_dock_airlock"
	dock_target_offsite = "trade_shuttle_bay"

//////////////////////////////////////////////////////////////
// Tether Shuttle
/datum/shuttle/autodock/ferry/tether_backup
	name = "Tether Backup"
	location = 1 // At offsite
	warmup_time = 5
	move_time = 45
	// waypoint_station
	// waypoint_offsite
	// waypoint_transition
	crash_areas = list(/area/shuttle/tether/crash1, /area/shuttle/tether/crash2)
	docking_controller_tag = "tether_shuttle"
	dock_target_station = "tether_dock_airlock"
	dock_target_offsite = "tether_pad_airlock"

//////////////////////////////////////////////////////////////
// Special Ops ERT Shuttle
/datum/shuttle/autodock/ferry/multidock/specops/ert
	name = "Special Operations"
	location = 0
	warmup_time = 10
	// waypoint_station
	// waypoint_offsite
	docking_controller_tag = "specops_shuttle_port"
	docking_controller_tag_station = "specops_shuttle_port"
	docking_controller_tag_offsite = "specops_shuttle_fore"
	dock_target_station = "specops_centcom_dock"
	dock_target_offsite = "specops_dock_airlock"


//////////////////////////////////////////////////////////////
// RogueMiner "Belter: Shuttle
// TODO - Not implemented yet on new map

/datum/shuttle/autodock/ferry/belter
	name = "Belter"
	location = 0
	warmup_time = 6
	move_time = 30
	// waypoint_station
	// waypoint_offsite
	// waypoint_transition
	docking_controller_tag = "belter_dock"
	dock_target_station = "belter_nodocking" //Fake tags to prevent the shuttle from opening doors.
	dock_target_offsite = "belter_nodocking"

/datum/shuttle/autodock/ferry/belter/New()
	move_time = move_time + rand(-10, 20) //50sec max, 20sec min.
	..()
