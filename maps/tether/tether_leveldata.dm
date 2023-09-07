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

/datum/level_data/virgo3b
	abstract_type = /datum/level_data/virgo3b // use the main or player subtypes instead please
	base_area = /area/tether/surfacebase/outside/outside1
	base_turf = /turf/exterior/open
	use_global_exterior_ambience = FALSE
	ambient_light_level = 0.5
	ambient_light_color = COLOR_WHITE
	exterior_atmos_temp = VIRGO3B_AVG_TEMP
	exterior_atmosphere = list(
		/decl/material/gas/nitrogen       = VIRGO3B_MOL_N2,
		/decl/material/gas/oxygen         = VIRGO3B_MOL_O2,
		/decl/material/gas/nitrous_oxide  = VIRGO3B_MOL_N2O,
		/decl/material/gas/carbon_dioxide = VIRGO3B_MOL_CO2,
		/decl/material/solid/phoron       = VIRGO3B_MOL_PHORON,
	)
	UT_turf_exceptions_by_door_type = list(
		/obj/machinery/door/firedoor/glass = list(
			/turf/simulated/open
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
	base_turf = /turf/exterior/rocks

/datum/level_data/virgo3b/main/space
	base_turf = /turf/space
	exterior_atmosphere = null // vacuum

/datum/level_data/virgo3b/player
	level_flags = (ZLEVEL_CONTACT|ZLEVEL_PLAYER)

/datum/level_data/mining_level/virgo3b
	exterior_atmos_temp = VIRGO3B_AVG_TEMP
	exterior_atmosphere = list(
		/decl/material/gas/nitrogen       = VIRGO3B_MOL_N2,
		/decl/material/gas/oxygen         = VIRGO3B_MOL_O2,
		/decl/material/gas/nitrous_oxide  = VIRGO3B_MOL_N2O,
		/decl/material/gas/carbon_dioxide = VIRGO3B_MOL_CO2,
		/decl/material/solid/phoron       = VIRGO3B_MOL_PHORON,
	)

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
	level_data_type = /datum/level_data/virgo3b/main

/obj/abstract/level_data_spawner/virgo3b/main/lowest
	level_data_type = /datum/level_data/virgo3b/main/lowest

/obj/abstract/level_data_spawner/virgo3b/main/space
	level_data_type = /datum/level_data/virgo3b/main/space

/obj/abstract/level_data_spawner/virgo3b/player
	level_data_type = /datum/level_data/virgo3b/player

/obj/abstract/level_data_spawner/virgo3b/mining
	level_data_type = /datum/level_data/mining_level/virgo3b
