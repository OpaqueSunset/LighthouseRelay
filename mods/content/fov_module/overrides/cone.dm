/atom/proc/InCone(atom/center = usr, dir = NORTH)
	if(get_dist(center, src) == 0 || src == center) return 0
	var/d = get_dir(center, src)

	if(!d || d == dir) return 1
	if(dir & (dir-1))
		return (d & ~dir) ? 0 : 1
	if(!(d & dir)) return 0
	var/dx = abs(x - center.x)
	var/dy = abs(y - center.y)
	if(dx == dy) return 1
	if(dy > dx)
		return (dir & (NORTH|SOUTH)) ? 1 : 0
	return (dir & (EAST|WEST)) ? 1 : 0

/mob/dead/InCone(mob/center = usr, dir = NORTH)
	return

/mob/living/InCone(mob/center = usr, dir = NORTH)
	. = ..()
	for(var/obj/item/grab/G in center)
		if(src == G.affecting)
			return 0
		else
			return .

/proc/mobs_in_cone(atom/center = usr, dir = NORTH, radius)
	. = list()
	for(var/mob/living/candidate_mob in oview(center, radius))
		if(candidate_mob.InCone(center, dir))
			. += candidate_mob

/proc/items_in_cone(atom/center = usr, dir = NORTH, radius)
	. = list()
	for(var/obj/item/candidate_item in oview(center, radius))
		if(candidate_item.InCone(center, dir))
			. += candidate_item

/proc/cone(atom/center = usr, dir = NORTH, list/list = oview(center))
	for(var/atom/O in list) if(!O.InCone(center, dir)) list -= O
	return list

/mob/living/human/update_vision_cone()
	. = ..()
	if(!src.client) //Same as in module. Hate to look for this twice, but it's needed, short of mashing everything together.
		return
	for(var/image/I in src.client.hidden_atoms)
		I.override = 0
		qdel(I)

	src.client.hidden_atoms.Cut()
	src.client.hidden_mobs.Cut()
	src.fov.dir = src.dir

	if(fov.alpha != 0)

		for(var/mob/living/M as anything in mobs_in_cone(src, global.flip_dir[dir], 10))
			var/image/I = image("split", M)
			I.mouse_opacity = MOUSE_OPACITY_UNCLICKABLE
			I.override = 1
			src.client.images += I
			src.client.hidden_atoms += I
			src.client.hidden_mobs += M
			if(LAZYISIN(M.grabbed_by, src))//If we're pulling them we don't want them to be invisible.
				I.override = 0

			M.in_vision_cones[src.client] = 1

		for(var/obj/item/O in items_in_cone(src, global.flip_dir[dir], 10))
			var/image/I = image("split", O)
			I.mouse_opacity = MOUSE_OPACITY_UNCLICKABLE
			I.override = 1
			src.client.images += I
			src.client.hidden_atoms += I
