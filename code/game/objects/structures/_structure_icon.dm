var/global/list/default_blend_typecache = zebra_typecacheof(list(/obj/machinery/door = TRUE, /turf/wall = TRUE, /obj/machinery/door/window = FALSE, /obj/machinery/door/firedoor = FALSE, /obj/machinery/door/blast = FALSE))

/obj/structure
	var/handle_generic_blending

/obj/structure/on_update_icon()
	..()
	if(material_alteration & MAT_FLAG_ALTERATION_COLOR)
		update_material_colour()
	cut_overlays()

/obj/structure/proc/can_visually_connect()
	return anchored && handle_generic_blending

/obj/structure/proc/can_visually_connect_to(var/obj/structure/S)
	return istype(S, src)

/obj/structure/proc/clear_connections()
	return

/obj/structure/proc/set_connections(dirs, other_dirs)
	return

/obj/structure/proc/find_blendable_obj_in_turf(var/turf/T, var/propagate)
	if(global.default_blend_typecache[T.type])
		if(propagate && istype(T, /turf/wall))
			for(var/turf/wall/W in RANGE_TURFS(T, 1))
				W.wall_connections = null
				W.other_connections = null
				W.queue_icon_update()
		return TRUE
	for(var/obj/O in T)
		if(global.default_blend_typecache[O.type])
			return TRUE
	return FALSE

/obj/structure/proc/update_connections(propagate = 0)

	if(!can_visually_connect())
		clear_connections()
		return FALSE

	var/list/dirs
	var/list/other_dirs
	for(var/direction in global.alldirs)
		var/turf/T = get_step(src, direction)
		if(T)
			for(var/obj/structure/S in T)
				if(can_visually_connect_to(S) && S.can_visually_connect())
					if(propagate)
						S.update_connections()
						S.queue_icon_update()
					LAZYADD(dirs, direction)
			if((direction in global.cardinal) && find_blendable_obj_in_turf(T, propagate))
				LAZYDISTINCTADD(dirs, direction)
				LAZYADD(other_dirs, direction)

	set_connections(dirs, other_dirs)
	return TRUE