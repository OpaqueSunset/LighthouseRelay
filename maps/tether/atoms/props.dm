//Dance pole
/obj/structure/dancepole
	name = "dance pole"
	desc = "Engineered for your entertainment."
	icon = 'icons/obj/objects.dmi'
	icon_state = "dancepole" // DOES NOT EXIST CURRENTLY
	density = FALSE
	anchored = TRUE
	obj_flags = OBJ_FLAG_ANCHORABLE

//Airlock antitox vendor
/obj/machinery/vending/wallmed1/airlock
	name = "Airlock NanoMed"
	desc = "A wall-mounted medical equipment dispenser. This limited-use free version is designed for use in phoron contamination incidents from surface EVA."
	base_type = /obj/machinery/vending/wallmed1/airlock
	products = list(/obj/item/storage/med_pouch/toxin = 4, /obj/item/chems/pill/painkillers = 4, /obj/item/scanner/health = 1)
	contraband = list(/obj/item/chems/pill/tox = 2)
	markup = 0

/obj/item/chems/pill/tox
	name = "toxins pill"
	desc = "Highly toxic."
	icon_state = "pill4"

/obj/item/chems/pill/tox/populate_reagents()
	reagents.add_reagent(/decl/material/liquid/bromide, 15)

//"Red" Armory Door
/obj/machinery/door/airlock/security/armory
	name = "Red Armory"
	//color = ""

/obj/machinery/door/airlock/security/armory/allowed(mob/user)
	var/decl/security_state/security_state = GET_DECL(global.using_map.security_state)
	var/decl/security_level/security_level = security_state.high_security_level
	if(security_level && security_state.current_security_level_is_lower_than(security_level))
		return FALSE
	return ..(user)

/obj/machinery/camera/network/crescent
	preset_channels = list(CAMERA_CHANNEL_CRESCENT)

#define CAMERA_CHANNEL_TETHER "Tether"
#define CAMERA_CHANNEL_TCOMMS "Telecomms"
#define CAMERA_CHANNEL_OUTSIDE "Outside"
#define CAMERA_CHANNEL_EXPLORATION "Exploration"
#define CAMERA_CHANNEL_XENOBIO "Xenobiology"
#define CAMERA_CHANNEL_COMMAND "Command"
#define CAMERA_CHANNEL_ENGINE  "Engine"

//Tether-unique network cameras
/obj/machinery/camera/network/tether
	preset_channels =  list(CAMERA_CHANNEL_TETHER)

/obj/machinery/camera/network/engine
	preset_channels = list(CAMERA_CHANNEL_ENGINE)
	initial_access = list(access_engine)

/obj/machinery/camera/network/telecom
	preset_channels =  list(CAMERA_CHANNEL_TCOMMS)

/obj/machinery/camera/network/cargo
	preset_channels = list(CAMERA_CHANNEL_SECURITY)

/obj/machinery/camera/network/civilian
	preset_channels = list(CAMERA_CHANNEL_SECURITY)

/obj/machinery/camera/network/command
	preset_channels = list(CAMERA_CHANNEL_COMMAND)
	initial_access = list(access_heads)

/obj/machinery/camera/network/exploration
	preset_channels =  list(CAMERA_CHANNEL_EXPLORATION)

/obj/machinery/camera/network/research/xenobio
	preset_channels =  list(CAMERA_CHANNEL_RESEARCH, CAMERA_CHANNEL_XENOBIO)


/obj/abstract/turbolift_spawner/tether
	name = "Lighthouse Climber"
	depth = 7
	lift_size_x = 3
	lift_size_y = 3
	icon = 'icons/obj/turbolift_preview_nowalls_4x4.dmi'
	wall_type = null // Don't make walls

	areas_to_use = list(
		/area/turbolift/t_surface/level1,
		/area/turbolift/t_surface/level2,
		/area/turbolift/t_surface/level3,
		/area/turbolift/tether/transit,
		/area/turbolift/t_station/level1,
		/area/turbolift/t_station/level2,
		/area/turbolift/t_station/level3,
		)

/obj/item/storage/box/beakers/measuring
	name = "box of measuring cups"

/obj/item/storage/box/beakers/measuring/WillContain()
	return list(/obj/item/chems/glass/beaker/measuring_cup = 7)

/obj/machinery/light/fixture
	icon_state = "tube-construct-stage1"

/obj/machinery/light/fixture/Initialize(mapload, d, populate_parts)
	. = ..(mapload, d, populate_parts = FALSE)
	construct_state.post_construct(src)

/obj/machinery/light/small/fixture
	icon_state = "bulb-construct-stage1"

/obj/machinery/light/small/fixture/Initialize(mapload, d, populate_parts)
	. = ..(mapload, d, populate_parts = FALSE)
	construct_state.post_construct(src)

/obj/item/card/id/captains_spare/fakespare/Initialize()
	. = ..()
	access = null

//
// TRAM STATION
//

// The tram's electrified maglev tracks
/turf/simulated/floor/maglev
	name = "maglev track"
	desc = "Magnetic levitation tram tracks. Caution! Electrified!"
	icon = 'maps/tether/icons/maglevs.dmi'
	icon_state = "maglevup"

	var/area/shock_area = /area/tether/surfacebase/tram

/turf/simulated/floor/maglev/Initialize()
	. = ..()
	shock_area = locate(shock_area)

// Walking on maglev tracks will shock you! Horray!
/turf/simulated/floor/maglev/Entered(var/atom/movable/AM, var/atom/old_loc)
	..()
	if(isliving(AM) && prob(50))
		track_zap(AM)

/turf/simulated/floor/maglev/attack_hand(var/mob/user)
	if(prob(75))
		track_zap(user)

/turf/simulated/floor/maglev/proc/track_zap(var/mob/living/user)
	if (!istype(user)) return
	if (electrocute_mob(user, shock_area, src))
		spark_at(src, 5, TRUE, src)

// Tram air scrubbers for keeping arrivals clean - they work even with no area power
/obj/machinery/portable_atmospherics/powered/scrubber/huge/stationary/tram
	name = "\improper Tram Air Scrubber"
	icon_state = "scrubber:1"
	use_power = POWER_USE_ACTIVE

/obj/machinery/portable_atmospherics/powered/scrubber/huge/stationary/tram/powered()
	return TRUE // Always be powered

//Chemistry 'chemavator'
/obj/machinery/smartfridge/chemistry/chemvator
	name = "\improper Smart Chemavator - Upper"
	desc = "A refrigerated storage unit for medicine and chemical storage. Now sporting a fancy system of pulleys to lift bottles up and down."
	var/obj/machinery/smartfridge/chemistry/chemvator/attached

/obj/machinery/smartfridge/chemistry/chemvator/down/Destroy()
	attached = null
	return ..()

/obj/machinery/smartfridge/chemistry/chemvator/down
	name = "\improper Smart Chemavator - Lower"

/obj/machinery/smartfridge/chemistry/chemvator/down/Initialize()
	. = ..()
	var/obj/machinery/smartfridge/chemistry/chemvator/above = locate(/obj/machinery/smartfridge/chemistry/chemvator,get_zstep(src,UP))
	if(istype(above))
		above.attached = src
		attached = above
		item_records = attached.item_records
	else
		to_chat(world,"<span class='danger'>[src] at [x],[y],[z] cannot find the unit above it!</span>")