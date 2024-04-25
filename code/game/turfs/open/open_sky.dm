/turf/open/sky
	name = "sky"
	desc = "Hope you don't have a fear of heights..."
	icon = 'icons/turf/flooring/sky_static.dmi'
	icon_state = "0"
	z_flags = ZM_TERMINATOR

// No matter what, the sky will never be 'inside'.
/turf/open/sky/is_outside()
	return TRUE // you can't take the sky from meee

/turf/open/sky/north
	dir = NORTH

/turf/open/sky/south
	dir = SOUTH

/turf/open/sky/west
	dir = WEST

/turf/open/sky/east
	dir = EAST

/turf/open/sky/moving
	icon = 'icons/turf/flooring/sky_slow.dmi'

/turf/open/sky/moving/north
	dir = NORTH

/turf/open/sky/moving/south
	dir = SOUTH

/turf/open/sky/moving/west
	dir = WEST

/turf/open/sky/moving/east
	dir = EAST
