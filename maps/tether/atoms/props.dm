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
	products = list(/obj/item/med_pouch/toxin = 4, /obj/item/chems/pill/painkillers = 4, /obj/item/scanner/health = 1)
	contraband = list(/obj/item/chems/pill/tox = 2)
	markup = 0

/obj/item/chems/pill/tox
	name = "toxins pill"
	desc = "Highly toxic."
	icon_state = "pill4"

/obj/item/chems/pill/tox/populate_reagents()
	. = ..()
	add_to_reagents(/decl/material/liquid/bromide, 15)

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
/turf/floor/maglev
	name = "maglev track"
	desc = "Magnetic levitation tram tracks. Caution! Electrified!"
	icon = 'maps/tether/icons/maglevs.dmi'
	icon_state = "maglevup"

	var/area/shock_area = /area/tether/surfacebase/tram

/turf/floor/maglev/Initialize()
	. = ..()
	shock_area = locate(shock_area)

// Walking on maglev tracks will shock you! Horray!
/turf/floor/maglev/Entered(var/atom/movable/AM, var/atom/old_loc)
	..()
	if(isliving(AM) && prob(50))
		track_zap(AM)

/turf/floor/maglev/attack_hand(var/mob/user)
	if(prob(75))
		track_zap(user)

/turf/floor/maglev/proc/track_zap(var/mob/living/user)
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

/obj/item/t_scanner/advanced
	name = "Advanced T-ray Scanner"
	desc = "An advanced version of the terahertz-ray emitter and scanner used to detect underfloor objects such as cables and pipes."
	material = /decl/material/solid/metal/aluminium
	matter = list(
		/decl/material/solid/phoron = MATTER_AMOUNT_TRACE * 2,
		/decl/material/solid/metal/silver = MATTER_AMOUNT_TRACE
	)
	origin_tech = "{'magnets':7,'engineering':7,'materials':6}"
	scan_range = 7

// RADIO
/obj/item/radio/intercom/locked/confessional
	name = "confessional intercom"
	locked_frequency = 1480

// Pre-installed and pre-charged SMES hidden from the station, for use in submaps.
/obj/machinery/power/smes/buildable/preset/hidden
	_fully_charged = TRUE
	_input_on = TRUE
	_input_maxed = TRUE
	_output_maxed = TRUE
	RCon = FALSE

// HEAVY DUTY CABLES
/obj/item/stack/cable_coil/heavyduty
	name = "heavy cable coil"
	icon = 'maps/tether/icons/obj/power_cond_heavy.dmi'
	stack_merge_type = /obj/item/stack/cable_coil/heavyduty
	cable_type = /obj/structure/cable/heavyduty
	color = null
	can_have_color = FALSE

/obj/structure/cable/heavyduty
	icon = 'maps/tether/icons/obj/power_cond_heavy.dmi'
	name = "large power cable"
	desc = "This cable is tough. It cannot be cut with simple hand tools."
	cable_type = /obj/item/stack/cable_coil/heavyduty
	color = null
	can_have_color = FALSE

#define IS_TOOL_WITH_QUALITY(A, T, Q)     (isatom(A) && A.get_tool_quality(T) >= Q)
/obj/structure/cable/heavyduty/attackby(obj/item/item, mob/user)
	if(IS_WIRECUTTER(item))
		// Must be cut with power tools like the hydraulic clamp.
		if(IS_TOOL_WITH_QUALITY(item, TOOL_WIRECUTTERS, TOOL_QUALITY_GOOD))
			cut_wire(item, user)
		else
			to_chat(user, SPAN_WARNING("\The [item] isn't strong enough to cut \the [src]."))
		return TRUE
	if(istype(item, /obj/item/stack/cable_coil) && !istype(item, /obj/item/stack/cable_coil/heavyduty))
		to_chat(user, SPAN_WARNING("\The [item] isn't heavy enough to connect to \the [src]."))
		return TRUE
	..()

#undef IS_TOOL_WITH_QUALITY

// No diagonals or Z-cables for this subtype.
/obj/item/stack/cable_coil/heavyduty/put_cable(turf/F, mob/user, d1, d2)
	if((d1 & (UP|DOWN)) || (d2 & (UP|DOWN)))
		to_chat(user, SPAN_WARNING("\The [src] is too heavy to connect vertically!"))
		return FALSE
	if((d1 & (d1 - 1)) || (d2 & (d2 - 1)))
		to_chat(user, SPAN_WARNING("\The [src] can't connect at that angle!"))
		return FALSE
	return ..(F, user, d1, d2)