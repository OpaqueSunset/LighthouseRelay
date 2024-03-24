//Unsimulated
/turf/unsimulated/wall/planetary/virgo3b
	name = "facility wall"
	desc = "An eight-meter tall carbyne wall. For when the wildlife on your planet is mostly militant megacorps."
	alpha = 0xFF

/turf/unsimulated/mineral/virgo3b
	blocks_air = TRUE

/turf/unsimulated/floor/steel
	icon = 'icons/turf/flooring/tiles_vr.dmi'
	icon_state = "steel"


/turf/unsimulated/wall
	blocks_air = 1

/turf/unsimulated/wall/planetary
	blocks_air = 0

// Some turfs to make floors look better in centcom tram station.



/turf/unsimulated/floor/techfloor_grid
	name = "floor"
	icon = 'icons/turf/flooring/techfloor_vr.dmi'
	icon_state = "techfloor_grid"

/turf/unsimulated/floor/maglev
	name = "maglev track"
	desc = "Magnetic levitation tram tracks. Caution! Electrified!"
	icon = 'icons/turf/flooring/maglevs.dmi'
	icon_state = "maglevup"

/turf/unsimulated/wall/transit
	icon = 'icons/turf/transit_vr.dmi'

/turf/unsimulated/floor/transit
	icon = 'icons/turf/transit_vr.dmi'

/obj/effect/floor_decal/transit/orange
	icon = 'icons/turf/transit_vr.dmi'
	icon_state = "transit_techfloororange_edges"

/obj/effect/transit/light
	icon = 'icons/turf/transit_128.dmi'
	icon_state = "tube1-2"

// Bluespace jump turf!
/turf/space/bluespace
	name = "bluespace"
	icon = 'icons/turf/space_vr.dmi'
	icon_state = "bluespace"
/turf/space/bluespace/Initialize()
	..()
	icon = 'icons/turf/space_vr.dmi'
	icon_state = "bluespace"

// Desert jump turf!
/turf/space/sandyscroll
	name = "sand transit"
	icon = 'icons/turf/transit_vr.dmi'
	icon_state = "desert_ns"
/turf/space/sandyscroll/Initialize()
	..()
	icon_state = "desert_ns"

//Sky stuff!
// A simple turf to fake the appearance of flying.
/turf/sky/virgo3b
	color = "#ffbbbb"

/turf/sky/virgo3b/Initialize()
	SSplanets.addTurf(src)
	set_light(2, 2, "#ffbbbb")

/turf/sky/virgo3b/north
	dir = NORTH
/turf/sky/virgo3b/south
	dir = SOUTH
/turf/sky/virgo3b/east
	dir = EAST
/turf/sky/virgo3b/west
	dir = WEST

/turf/sky/virgo3b/moving
	icon_state = "sky_fast"
/turf/sky/virgo3b/moving/north
	dir = NORTH
/turf/sky/virgo3b/moving/south
	dir = SOUTH
/turf/sky/virgo3b/moving/east
	dir = EAST
/turf/sky/virgo3b/moving/west
	dir = WEST
