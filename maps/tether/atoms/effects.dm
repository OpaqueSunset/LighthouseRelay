#define Z_LEVEL_SURFACE_LOW					1
#define Z_LEVEL_SURFACE_MID					2
#define Z_LEVEL_SURFACE_HIGH				3
#define Z_LEVEL_TRANSIT						4
#define Z_LEVEL_SPACE_LOW					5
#define Z_LEVEL_SPACE_MID					6
#define Z_LEVEL_SPACE_HIGH					7
#define Z_LEVEL_SURFACE_MINE				8
#define Z_LEVEL_SOLARS						9
#define Z_LEVEL_CENTCOM						10
#define Z_LEVEL_MISC						11
#define Z_LEVEL_SHIPS						12
#define Z_LEVEL_UNDERDARK					13
#define Z_LEVEL_ALIENSHIP					14
#define Z_LEVEL_BEACH						15
#define Z_LEVEL_BEACH_CAVE					16
#define Z_LEVEL_AEROSTAT					17
#define Z_LEVEL_AEROSTAT_SURFACE			18
#define Z_LEVEL_ROGUEMINE_1					19
#define Z_LEVEL_ROGUEMINE_2					20
#define Z_LEVEL_ROGUEMINE_3					21
#define Z_LEVEL_ROGUEMINE_4					22

/obj/effect/step_trigger/teleporter/to_mining/Initialize()
	. = ..()
	teleport_x = src.x
	teleport_y = 2
	teleport_z = Z_LEVEL_SURFACE_MINE

/obj/effect/step_trigger/teleporter/from_mining/Initialize()
	. = ..()
	teleport_x = src.x
	teleport_y = world.maxy - 1
	teleport_z = Z_LEVEL_SURFACE_LOW

/obj/effect/step_trigger/teleporter/to_solars/Initialize()
	. = ..()
	teleport_x = world.maxx - 1
	teleport_y = src.y
	teleport_z = Z_LEVEL_SOLARS

/obj/effect/step_trigger/teleporter/from_solars/Initialize()
	. = ..()
	teleport_x = 2
	teleport_y = src.y
	teleport_z = Z_LEVEL_SURFACE_LOW

/obj/effect/step_trigger/teleporter/wild/Initialize()
	. = ..()

	//If starting on east/west edges.
	if (src.x == 1)
		teleport_x = world.maxx - 1
	else if (src.x == world.maxx)
		teleport_x = 2
	else
		teleport_x = src.x
	//If starting on north/south edges.
	if (src.y == 1)
		teleport_y = world.maxy - 1
	else if (src.y == world.maxy)
		teleport_y = 2
	else
		teleport_y = src.y

/obj/effect/step_trigger/teleporter/to_underdark
	icon = 'icons/obj/stairs.dmi'
	icon_state = "stairs"
	invisibility = 0
/obj/effect/step_trigger/teleporter/to_underdark/Initialize()
	. = ..()
	teleport_x = x
	teleport_y = y
	var/datum/level_data/underdark_data = SSmapping.levels_by_id["Underdark"]
	teleport_z = underdark_data?.level_z
	if(!teleport_z)
		return INITIALIZE_HINT_QDEL

/obj/effect/step_trigger/teleporter/from_underdark
	icon = 'icons/obj/stairs.dmi'
	icon_state = "stairs"
	invisibility = 0
/obj/effect/step_trigger/teleporter/from_underdark/Initialize()
	. = ..()
	teleport_x = x
	teleport_y = y
	var/datum/level_data/outpost_data = SSmapping.levels_by_id["Mining Outpost"]
	teleport_z = outpost_data?.level_z
	if(!teleport_z)
		return INITIALIZE_HINT_QDEL

/obj/effect/step_trigger/lost_in_space
	var/deathmessage = "You drift off into space, floating alone in the void until your life support runs out."

/obj/effect/step_trigger/lost_in_space/Trigger(var/atom/movable/A) //replacement for shuttle dump zones because there's no empty space levels to dump to
	if(ismob(A))
		to_chat(A, "<span class='danger'>[deathmessage]</span>")
	qdel(A)

/obj/effect/step_trigger/lost_in_space/bluespace
	deathmessage = "Everything goes blue as your component particles are scattered throughout the known and unknown universe."
	var/last_sound = 0

/obj/effect/step_trigger/lost_in_space/bluespace/Trigger(A)
	if(world.time - last_sound > 5 SECONDS)
		last_sound = world.time
		playsound(get_turf(src), 'sound/effects/supermatter.ogg', 75, 1)
	if(ismob(A) && prob(5))//lucky day
		var/obj/effect/overmap/visitable/our_sector = global.overmap_sectors["[z]"]
		var/dest_z
		if(istype(our_sector))
			dest_z = pick(our_sector.map_z)
		else // Fallback: just take them to the main station levels, if possible
			dest_z = pick(SSmapping.station_levels)
		if(!dest_z) // Still nowhere to go? Then perish
			return ..()
		var/datum/level_data/dest_level_data = SSmapping.levels_by_z[dest_z]
		var/destturf = locate(
			rand(dest_level_data.level_inner_min_x, dest_level_data.level_inner_max_x),
			rand(dest_level_data.level_inner_min_y, dest_level_data.level_inner_max_y),
			dest_level_data.level_z
		)
		do_teleport(A, destturf, 0)
	else
		return ..()

/obj/effect/step_trigger/lost_in_space/tram
	deathmessage = "You fly down the tunnel of the tram at high speed for a few moments before impact kills you with sheer concussive force."

// For mappers to make invisible borders. For best results, place out of view of the map edge.
/obj/effect/blocker
	desc = "You can't go there!"
	icon = 'maps/tether/icons/wall_masks.dmi'
	icon_state = "rdebug"
	anchored = TRUE
	opacity = FALSE
	density = TRUE

/obj/effect/blocker/Initialize(mapload) // For non-gateway maps.
	. = ..()
	icon = null
	icon_state = null