// Elevator areas.
/area/turbolift/t_surface/level1
	name = "surface (level 1)"
	lift_floor_label = "Surface 1"
	lift_floor_name = "Tram, Dorms, Mining, Surf. EVA"
	lift_announce_str = "Arriving at Base Level 1."
	base_turf = /turf/simulated/floor/plating

/area/turbolift/t_surface/level2
	name = "surface (level 2)"
	lift_floor_label = "Surface 2"
	lift_floor_name = "Atmos, Chapel, Maintenance"
	lift_announce_str = "Arriving at Base Level 2."

/area/turbolift/t_surface/level3
	name = "surface (level 3)"
	lift_floor_label = "Surface 3"
	lift_floor_name = "Bridge, Science, Bar, Pool"
	lift_announce_str = "Arriving at Base Level 3."

/area/turbolift/tether/transit
	name = "lighthouse (midway)"
	lift_floor_label = "Lighthouse Midpoint"
	lift_floor_name = "Midpoint"
	lift_announce_str = "Arriving at the Lighthouse midway point."
	delay_time = 5 SECONDS

/area/turbolift/t_station/level1
	name = "asteroid (level 1)"
	lift_floor_label = "Asteroid 1"
	lift_floor_name = "Eng, Secondary Bridge, Park, Cryo, Visitor Offices"
	lift_announce_str = "Arriving at Station Level 1."

/area/turbolift/t_station/level2
	name = "asteroid (level 2)"
	lift_floor_label = "Asteroid 2"
	lift_floor_name = "Exploration, AI Core, EVA Gear"
	lift_announce_str = "Arriving at Station Level 2."

/area/turbolift/t_station/level3
	name = "asteroid (level 3)"
	lift_floor_label = "Asteroid 3"
	lift_floor_name = "Medical, Security, Cargo"
	lift_announce_str = "Arriving at Station Level 3."

/area/tether/transit
	name = "\improper Lighthouse Transit"
	area_flags = AREA_FLAG_EXTERNAL | AREA_FLAG_IS_NOT_PERSISTENT | AREA_FLAG_IS_BACKGROUND | AREA_FLAG_HIDE_FROM_HOLOMAP
	is_outside = OUTSIDE_YES