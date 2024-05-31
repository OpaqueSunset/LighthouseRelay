//Debug areas
/area/tether/surfacebase
	name = "Tether Debug Surface"

/area/tether/transit
	name = "Tether Debug Transit"
	requires_power = 0

/area/tether/space
	name = "Tether Debug Space"
	requires_power = 0

/area/maintenance/bar/catwalk
	name = "Bar Maintenance Catwalk"
	icon_state = "maint_bar"

// Tether Areas itself
/area/tether/surfacebase/tether
	icon = 'maps/tether/icons/areas_vr.dmi'
	icon_state = "tether1"
/area/tether/transit/tether
	icon = 'maps/tether/icons/areas_vr.dmi'
	icon_state = "tether2"
/area/tether/space/tether
	icon = 'maps/tether/icons/areas_vr.dmi'
	icon_state = "tether3"

// Elevator areas.
/area/turbolift
	delay_time = 2 SECONDS
	forced_ambience = list('sound/music/elevator.ogg')
	dynamic_lighting = FALSE //Temporary fix for elevator lighting

	requires_power = FALSE
