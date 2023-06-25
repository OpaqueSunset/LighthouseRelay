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

/obj/structure/closet/secure_closet/guncabinet/excursion
	name = "expedition weaponry cabinet"
	req_access = list(list(access_explorer),list(access_armory))

/obj/structure/closet/secure_closet/guncabinet/excursion/New()
	..()
	for(var/i = 1 to 4)
		new /obj/item/gun/energy/frontier/locked(src)
	for(var/i = 1 to 4)
		new /obj/item/gun/energy/frontier/locked/holdout(src)

// Used at centcomm for the elevator
/obj/machinery/cryopod/robot/door/dorms
	// spawnpoint_type = /datum/spawnpoint/tram

/obj/machinery/camera/network/crescent
	preset_channels = list(CAMERA_CHANNEL_CRESCENT)

#define CAMERA_CHANNEL_TETHER "Tether"
#define CAMERA_CHANNEL_TCOMMS "Telecomms"
#define CAMERA_CHANNEL_OUTSIDE "Outside"
#define CAMERA_CHANNEL_EXPLORATION "Exploration"
#define CAMERA_CHANNEL_XENOBIO "Xenobiology"

//Tether-unique network cameras
/obj/machinery/camera/network/tether
	preset_channels =  list(CAMERA_CHANNEL_TETHER)

/obj/machinery/camera/network/telecom
	preset_channels =  list(CAMERA_CHANNEL_TCOMMS)

/obj/machinery/camera/network/outside
	preset_channels =  list(CAMERA_CHANNEL_OUTSIDE)

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

/obj/structure/closet/wardrobe/grey/viva/WillContain()
	return list(
		/obj/structure/barricade/cutout/viva,
		/obj/item/clothing/under/color/grey = 3,
		/obj/item/clothing/shoes/black = 3,
		/obj/item/clothing/head/soft/grey = 3,
		/obj/item/clothing/mask/gas/wwii = 3,
		/obj/item/storage/toolbox/mechanical = 3,
		/obj/item/clothing/gloves/insulated/cheap = 3,
		/obj/item/card/id/captains_spare/fakespare = 3,
		/obj/item/soap/syndie = 3,
		/obj/item/storage/box/mousetraps = 3)

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