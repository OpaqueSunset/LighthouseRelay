// originally /turf/simulated/floor/outdoors/rocks.
// todo: port polaris rock turf sprite
// pr this upstream
/turf/exterior/rocks
	name = "ground"
	icon = 'icons/turf/exterior/barren.dmi'
	icon_edge_layer = EXT_EDGE_BARREN

/turf/exterior/rocks/Initialize()
	if(prob(20))
		LAZYADD(decals, image('icons/turf/flooring/decals.dmi', "asteroid[rand(0,9)]"))
	. = ..()

/turf/exterior/open/sky/virgo3b
/turf/simulated/floor/carpet/bcarpet
/turf/simulated/floor/carpet/oracarpet
/turf/simulated/floor/carpet/purcarpet
/turf/simulated/floor/carpet/sblucarpet
/turf/simulated/floor/carpet/turcarpet
/turf/simulated/floor/looking_glass
/turf/simulated/floor/looking_glass/center
/turf/simulated/floor/looking_glass/optional
/turf/simulated/floor/maglev
/turf/simulated/floor/tiled/asteroid_steel/airless
/turf/simulated/floor/tiled/steel
/turf/simulated/floor/tiled/steel_dirty
/turf/simulated/floor/water/deep/indoors
/turf/simulated/floor/water/indoors
/turf/simulated/floor/wood/broken
/turf/simulated/shuttle/floor/airless
/turf/simulated/shuttle/floor/black
/turf/simulated/shuttle/floor/darkred
/turf/simulated/shuttle/floor/white
/turf/simulated/shuttle/floor/yellow
/turf/simulated/shuttle/plating/airless
/turf/simulated/shuttle/plating/airless/carry
/turf/simulated/shuttle/plating/carry
/turf/simulated/wall/shull
/turf/space/cracked_asteroid
/turf/unsimulated/wall/planetary/virgo3b
/turf/simulated/floor/wood/sif
/turf/simulated/shuttle/wall/dark
/turf/simulated/shuttle/wall/voidcraft/hard_corner
/turf/simulated/wall/durasteel
/turf/simulated/wall/r_lead