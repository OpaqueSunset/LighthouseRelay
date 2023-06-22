// STUBS DEFINED FOR FUTURE IMPLEMENTATION
// THESE NEED NAMES, ICONS, AND FUNCTIONALITY ADDED!
/turf/simulated/floor/asteroid/cave
	temperature = T20C
	initial_gas = list(
		/decl/material/gas/oxygen = MOLES_O2STANDARD,
		/decl/material/gas/nitrogen = MOLES_N2STANDARD
	)
/turf/simulated/floor/tiled/steel_dirty/virgo3b
	initial_gas = null
/turf/simulated/shuttle/wall
	var/hard_corner = FALSE
/turf/simulated/shuttle/wall/hard_corner
	hard_corner = TRUE
/turf/simulated/shuttle/floor/yellow/airless
	initial_gas = null
/turf/simulated/floor/reinforced/virgo3b
	initial_gas = null
/turf/simulated/floor/virgo3b_indoors
	initial_gas = null

/turf/exterior/sif_growth
	name = "growth"
	desc = "A natural moss that has adapted to the sheer cold climate."
	icon = 'maps/tether/icons/sif_grass.dmi'
	possible_states = 1

// Voidcraft Shuttle Walls
/turf/simulated/shuttle/wall/voidcraft
	name = "voidcraft wall"
	icon = 'maps/tether/icons/shuttle_void.dmi'
	icon_state = "void"
	var/stripe_color = null // If set, generates a colored stripe overlay.  Accepts #XXXXXX as input.

/turf/simulated/shuttle/wall/voidcraft/red
	stripe_color = "#FF0000"

/turf/simulated/shuttle/wall/voidcraft/blue
	stripe_color = "#0000FF"

/turf/simulated/shuttle/wall/voidcraft/green
	stripe_color = "#00FF00"

/turf/simulated/shuttle/wall/voidcraft/Initialize()
	. = ..()
	update_icon()

/turf/simulated/shuttle/wall/voidcraft/on_update_icon()
	. = ..()
	if(stripe_color)
		cut_overlays()
		var/image/I = image(icon = src.icon, icon_state = "o_[icon_state]")
		I.color = stripe_color
		add_overlay(I)

// override the default tiled floor icon to match the steel decals
/turf/simulated/floor/tiled
	name = "steel floor"
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_state = "steel"
	color = null

/decl/flooring/tiling
	name = "floor"
	desc = "A solid, heavy set of flooring plates."
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_base = "steel"
	color = null