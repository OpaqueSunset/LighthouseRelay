// STUBS DEFINED FOR FUTURE IMPLEMENTATION
// THESE NEED NAMES, ICONS, AND FUNCTIONALITY ADDED!
/turf/simulated/floor/asteroid/cave
	temperature = T20C
	initial_gas = list(
		/decl/material/gas/oxygen = MOLES_O2STANDARD,
		/decl/material/gas/nitrogen = MOLES_N2STANDARD
	)
/turf/simulated/floor/carpet/bcarpet
/turf/simulated/floor/carpet/oracarpet
/turf/simulated/floor/carpet/purcarpet
/turf/simulated/floor/carpet/sblucarpet
/turf/simulated/floor/carpet/turcarpet
/turf/simulated/floor/looking_glass
/turf/simulated/floor/looking_glass/center
/turf/simulated/floor/looking_glass/optional
/turf/simulated/floor/maglev
/turf/simulated/floor/outdoors/dirt/virgo3b
/turf/simulated/floor/outdoors/grass/forest
/turf/simulated/floor/outdoors/grass/sif/virgo3b
/turf/simulated/floor/outdoors/rocks/virgo3b
/turf/simulated/floor/plating/eris/under
/turf/simulated/floor/tiled/asteroid_steel/airless
/turf/simulated/floor/tiled/eris/cafe
/turf/simulated/floor/tiled/eris/dark/bluecorner
/turf/simulated/floor/tiled/eris/dark/golden
/turf/simulated/floor/tiled/eris/steel/bar_dance
/turf/simulated/floor/tiled/eris/steel/bar_light
/turf/simulated/floor/tiled/eris/steel/danger
/turf/simulated/floor/tiled/eris/steel/techfloor_grid
/turf/simulated/floor/tiled/eris/techmaint_panels
/turf/simulated/floor/tiled/eris/white/orangecorner
/turf/simulated/floor/tiled/steel
/turf/simulated/floor/tiled/steel_dirty
/turf/simulated/floor/tiled/steel_dirty/virgo3b
	initial_gas = null
/turf/simulated/floor/water/deep/indoors
/turf/simulated/floor/water/deep/pool
/turf/simulated/floor/water/indoors
/turf/simulated/floor/wood/broken
/turf/simulated/shuttle/floor/black
/turf/simulated/shuttle/floor/yellow
/turf/simulated/shuttle/plating/airless
/turf/simulated/shuttle/plating/airless/carry
/turf/simulated/shuttle/plating/carry
/turf/simulated/shuttle/wall
	var/hard_corner = FALSE
/turf/simulated/shuttle/wall/hard_corner
	hard_corner = TRUE
/turf/exterior/open/sky/virgo3b
/turf/simulated/wall/shull
/turf/space/cracked_asteroid
/turf/unsimulated/wall/planetary/virgo3b
/turf/simulated/floor/tiled/eris/dark/danger
/turf/simulated/floor/tiled/eris/dark/gray_perforated
/turf/simulated/floor/tiled/eris/dark/techfloor
/turf/simulated/floor/tiled/eris/dark/violetcorener
/turf/simulated/floor/tiled/eris/steel/cyancorner
/turf/simulated/floor/tiled/eris/steel/gray_perforated
/turf/simulated/floor/tiled/eris/techmaint
/turf/simulated/floor/tiled/eris/techmaint_cargo
/turf/simulated/floor/tiled/eris/techmaint_perforated
/turf/simulated/floor/tiled/eris/white/bluecorner
/turf/simulated/shuttle/floor/yellow/airless
/turf/simulated/floor/reinforced/virgo3b
/turf/simulated/floor/virgo3b_indoors

/turf/simulated/floor/outdoors/grass/sif/virgo3b

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