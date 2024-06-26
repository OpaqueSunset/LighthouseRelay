// -- Datums -- //

/datum/shuttle_destination/excursion/debrisfield
	name = "Debris Field"
	my_area = /area/shuttle/excursion/debrisfield
	preferred_interim_area = /area/shuttle/excursion/space_moving
	skip_me = TRUE

	routes_to_make = list(
		/datum/shuttle_destination/excursion/virgo3b_orbit = 30 SECONDS
	)

// -- Objs -- //

/obj/shuttle_connector/debrisfield
	name = "shuttle connector - debrisfield"
	shuttle_name = "Excursion Shuttle"
	destinations = list(/datum/shuttle_destination/excursion/debrisfield)

/obj/effect/step_trigger/teleporter/debrisfield_loop/north/Initialize()
	. = ..()
	teleport_x = x
	teleport_y = 2
	teleport_z = z

/obj/effect/step_trigger/teleporter/debrisfield_loop/south/Initialize()
	. = ..()
	teleport_x = x
	teleport_y = world.maxy - 1
	teleport_z = z

/obj/effect/step_trigger/teleporter/debrisfield_loop/west/Initialize()
	. = ..()
	teleport_x = world.maxx - 1
	teleport_y = y
	teleport_z = z

/obj/effect/step_trigger/teleporter/debrisfield_loop/east/Initialize()
	. = ..()
	teleport_x = 2
	teleport_y = y
	teleport_z = z

//This does nothing right now, but is framework if we do POIs for this place
/obj/away_mission_init/debrisfield
	name = "away mission initializer - debrisfield"

/obj/away_mission_init/debrisfield/Initialize()
	return INITIALIZE_HINT_QDEL

//And some special areas, including our shuttle landing spot (must be unique)
/area/shuttle/excursion/debrisfield
	name = "\improper Excursion Shuttle - Debris Field"

/area/tether_away/debrisfield
	name = "Away Mission - Debris Field"
	icon = 'maps/tether/icons/areas_vr.dmi'
	icon_state = "dark"

/area/tether_away/debrisfield/explored
	icon_state = "debrisexplored"

/area/tether_away/debrisfield/unexplored
	icon_state = "debrisunexplored"

/area/tether_away/debrisfield/derelict
	icon_state = "debrisexplored"
	forced_ambience = list('sound/ambience/tension/tension.ogg', 'sound/ambience/tension/horror.ogg')