//Atmosphere properties
#define VIRGO3B_ONE_ATMOSPHERE	82.4 //kPa
#define VIRGO3B_AVG_TEMP	-39.15 CELSIUS

#define VIRGO3B_PER_N2		0.16 //percent
#define VIRGO3B_PER_O2		0.00
#define VIRGO3B_PER_N2O		0.00
#define VIRGO3B_PER_CO2		0.12
#define VIRGO3B_PER_PHORON	0.72

//Math only beyond this point
#define VIRGO3B_MOL_PER_TURF	(VIRGO3B_ONE_ATMOSPHERE*CELL_VOLUME/(VIRGO3B_AVG_TEMP*R_IDEAL_GAS_EQUATION))
#define VIRGO3B_MOL_N2			(VIRGO3B_MOL_PER_TURF * VIRGO3B_PER_N2)
#define VIRGO3B_MOL_O2			(VIRGO3B_MOL_PER_TURF * VIRGO3B_PER_O2)
#define VIRGO3B_MOL_N2O			(VIRGO3B_MOL_PER_TURF * VIRGO3B_PER_N2O)
#define VIRGO3B_MOL_CO2			(VIRGO3B_MOL_PER_TURF * VIRGO3B_PER_CO2)
#define VIRGO3B_MOL_PHORON		(VIRGO3B_MOL_PER_TURF * VIRGO3B_PER_PHORON)

/datum/random_map/noise/virgo3b
	descriptor = "Virgo 3B plains (roundstart)"
	smoothing_iterations = 3
	target_turf_type = /turf/unsimulated/mask
	smooth_single_tiles = TRUE

/datum/random_map/noise/virgo3b/cleanup()
	..()
	// Round down to 1-9.
	for(var/x = 1, x <= limit_x, x++)
		for(var/y = 1, y <= limit_y, y++)
			var/current_cell = TRANSLATE_COORD(x,y)
			var/current_val = map[current_cell]
			map[current_cell] = min(9,max(0,round((current_val/cell_range)*10)))

/datum/random_map/noise/virgo3b/get_appropriate_path(var/value)
	switch(value)
		if(0)
			return /turf/floor/natural/mud
		if(1 to 2)
			return /turf/floor/natural/dirt
		if(3 to 5)
			return /turf/floor/natural/sif_growth
		if(6 to 8)
			return /turf/floor/natural/sif_growth/thick
		if(9)
			return /turf/floor/natural/snow

/datum/random_map/noise/virgo3b/get_additional_spawns(var/value, var/turf/T)
	if(prob(45) || T.density)
		return
	switch(value)
		if(1 to 2)
			if(prob(1))
				new /obj/structure/flora/sif/eyes(T)
		if(3 to 4)
			if(prob(1))
				new /obj/structure/flora/sif/eyes(T)
			else if(prob(1))
				new /obj/structure/flora/sif/tendrils(T)
		if(5 to 6)
			if(prob(1))
				new /obj/structure/flora/tree/sif(T)
			else if(prob(1))
				new /obj/structure/flora/sif/tendrils(T)
			else if (prob(1))
				new /obj/structure/flora/sif/eyes(T)
		if(7 to 8)
			if(prob(5))
				new /obj/structure/flora/tree/sif(T)
			else if(prob(1))
				new /obj/structure/flora/sif/eyes(T)
			else if(prob(1))
				new /obj/structure/flora/sif/tendrils(T)

/datum/random_map/noise/virgo3b/decorator
	target_turf_type = /turf/floor/natural/sif_growth

/datum/random_map/noise/virgo3b/forest
	descriptor = "Virgo 3B forest (roundstart)"

/datum/random_map/noise/virgo3b/forest/decorator
	target_turf_type = /turf/floor/natural/sif_growth

/datum/random_map/noise/virgo3b/forest/get_appropriate_path(var/value)
	switch(value)
		if(0 to 3)
			return /turf/floor/natural/sif_growth
		if(4 to 6)
			return /turf/floor/natural/sif_growth/thick
		if(7 to 9)
			return /turf/floor/natural/snow

/datum/random_map/noise/virgo3b/forest/get_additional_spawns(var/value, var/turf/T)
	if(prob(25) || T.density)
		return
	switch(value)
		if(0 to 5)
			if(value >= 3 && prob(5))
				new /obj/structure/flora/tree/sif(T)
				return
			if(prob(1))
				new /obj/structure/flora/sif/eyes(T)
			else if(prob(1))
				new /obj/structure/flora/sif/tendrils(T)
		if(6 to 9)
			if(prob((value <= 7) ? 15 : 35))
				new /obj/structure/flora/tree/sif(T)
				return
			if(prob(1))
				new /obj/structure/flora/sif/eyes(T)
			else if(prob(1))
				new /obj/structure/flora/sif/tendrils(T)

/datum/level_data/virgo3b
	abstract_type = /datum/level_data/virgo3b // use the main or player subtypes instead please
	base_area = /area/tether/surfacebase/outside/outside1
	base_turf = /turf/open
	transition_turf_type = /turf/mimic_edge/transition
	use_global_exterior_ambience = FALSE
	exterior_atmosphere = list(
		/decl/material/gas/nitrogen       = VIRGO3B_MOL_N2,
		/decl/material/gas/oxygen         = VIRGO3B_MOL_O2,
		/decl/material/gas/nitrous_oxide  = VIRGO3B_MOL_N2O,
		/decl/material/gas/carbon_dioxide = VIRGO3B_MOL_CO2,
		/decl/material/solid/phoron       = VIRGO3B_MOL_PHORON,
	)
	UT_turf_exceptions_by_door_type = list(
		/obj/machinery/door/firedoor/glass = list(
			/turf/open
		)
	)

// cached typepaths to ensure different levels are consistent with each other
// todo: consider giving virgo3b planetoid data instead??
var/global/decl/strata/virgo3b_stratum
var/global/decl/material/virgo3b_stratum_base_material
/datum/level_data/virgo3b/setup_strata()
	if(global.virgo3b_stratum)
		strata = global.virgo3b_stratum
		strata_base_material = global.virgo3b_stratum_base_material
	. = ..()
	if(!global.virgo3b_stratum)
		global.virgo3b_stratum = .
		global.virgo3b_stratum_base_material = strata_base_material

/datum/level_data/virgo3b/main
	level_flags = (ZLEVEL_STATION|ZLEVEL_CONTACT|ZLEVEL_PLAYER)

/datum/level_data/virgo3b/main/lowest
	base_turf = /turf/floor/natural/rocks
	level_id = "virgo3bsurface1"
	connected_levels = list(
		"virgo3bsolars" = WEST,
		"virgo3bmining" = NORTH
	)
	level_generators = list(
		/datum/random_map/noise/virgo3b/forest/decorator
	)

/datum/level_data/virgo3b/main/mid
	level_id = "virgo3bsurface2"

/datum/level_data/virgo3b/main/top
	level_id = "virgo3bsurface3"
	exterior_atmos_temp = VIRGO3B_AVG_TEMP
	daycycle_type = /datum/daycycle/tether
	daycycle_id = "daycycle_tether"

/datum/level_data/virgo3b/main/top/after_generate_level()
	. = ..()
	SSweather.setup_weather_system(src)

/datum/level_data/virgo3b/main/space
	base_turf = /turf/space
	exterior_atmosphere = null // vacuum
	border_filler = null // space
	use_global_exterior_ambience = TRUE

/datum/level_data/virgo3b/player
	level_flags = (ZLEVEL_CONTACT|ZLEVEL_PLAYER)

/datum/level_data/virgo3b/player/transit
	daycycle_type = /datum/daycycle/tether
	daycycle_id = "daycycle_tether"

/datum/level_data/virgo3b/player/solars
	level_id = "virgo3bsolars"
	transition_turf_type = /turf/mimic_edge/transition
	connected_levels = list(
		"virgo3bsurface1" = EAST
	)
	daycycle_type = /datum/daycycle/tether
	daycycle_id = "daycycle_tether"
	level_generators = list(
		/datum/random_map/automata/cave_system,
		/datum/random_map/noise/ore,
		/datum/random_map/noise/virgo3b/forest/decorator
	)

/datum/level_data/virgo3b/player/solars/after_generate_level()
	. = ..()
	SSweather.setup_weather_system(src)

/datum/level_data/mining_level/virgo3b
	level_id = "virgo3bmining"
	transition_turf_type = /turf/mimic_edge/transition
	connected_levels = list(
		"virgo3bsurface1" = SOUTH
	)
	exterior_atmos_temp = VIRGO3B_AVG_TEMP
	exterior_atmosphere = list(
		/decl/material/gas/nitrogen       = VIRGO3B_MOL_N2,
		/decl/material/gas/oxygen         = VIRGO3B_MOL_O2,
		/decl/material/gas/nitrous_oxide  = VIRGO3B_MOL_N2O,
		/decl/material/gas/carbon_dioxide = VIRGO3B_MOL_CO2,
		/decl/material/solid/phoron       = VIRGO3B_MOL_PHORON,
	)
	level_generators = list(
		/datum/random_map/automata/cave_system,
		/datum/random_map/noise/ore,
		/datum/random_map/noise/virgo3b/forest/decorator
	)
	use_global_exterior_ambience = FALSE
	daycycle_type = /datum/daycycle/tether
	daycycle_id = "daycycle_tether"
	exterior_atmos_temp = VIRGO3B_AVG_TEMP

/datum/level_data/mining_level/virgo3b/after_generate_level()
	. = ..()
	SSweather.setup_weather_system(src)

// AWFUL AWFUL AWFUL code duplication. Please remove this when mining_level is unified with generic level_data.
/datum/level_data/mining_level/virgo3b/setup_strata()
	if(global.virgo3b_stratum)
		strata = global.virgo3b_stratum
		strata_base_material = global.virgo3b_stratum_base_material
	. = ..()
	if(!global.virgo3b_stratum)
		global.virgo3b_stratum = .
		global.virgo3b_stratum_base_material = strata_base_material

/obj/abstract/level_data_spawner/virgo3b/main
	abstract_type = /obj/abstract/level_data_spawner/virgo3b/main
	level_data_type = /datum/level_data/virgo3b/main

/obj/abstract/level_data_spawner/virgo3b/main/lowest
	level_data_type = /datum/level_data/virgo3b/main/lowest

/obj/abstract/level_data_spawner/virgo3b/main/mid
	level_data_type = /datum/level_data/virgo3b/main/mid

/obj/abstract/level_data_spawner/virgo3b/main/top
	level_data_type = /datum/level_data/virgo3b/main/top

/obj/abstract/level_data_spawner/virgo3b/main/space
	level_data_type = /datum/level_data/virgo3b/main/space

/obj/abstract/level_data_spawner/virgo3b/player
	abstract_type = /obj/abstract/level_data_spawner/virgo3b/player
	level_data_type = /datum/level_data/virgo3b/player

/obj/abstract/level_data_spawner/virgo3b/player/transit
	level_data_type = /datum/level_data/virgo3b/player/transit

/obj/abstract/level_data_spawner/virgo3b/player/solars
	level_data_type = /datum/level_data/virgo3b/player/solars

/obj/abstract/level_data_spawner/virgo3b/mining
	level_data_type = /datum/level_data/mining_level/virgo3b

// Placeholder for more customised values.
/datum/daycycle/tether
	cycle_duration = 2 HOURS

/datum/daycycle/tether/New(_cycle_id)
	time_in_cycle = rand(0, cycle_duration)
	. = ..()