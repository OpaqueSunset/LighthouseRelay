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

/proc/cone(atom/center = usr, dir = NORTH, list/list = oview(center))
	for(var/atom/O in list) if(!O.InCone(center, dir)) list -= O
	return list

/mob/living/carbon/human/update_vision_cone()
	. = ..()
	var/delay = 10
	var/image/I = null
	for(I in src.client.hidden_atoms)
		I.override = 0
		spawn(delay)
			qdel(I)
		delay += 10
	src.client.hidden_atoms = list()
	src.client.hidden_mobs = list()
	src.fov.dir = src.dir
	if(fov.alpha != 0)
		var/mob/living/M
		for(M in cone(src, OPPOSITE_DIR(src.dir), view(10, src)))
			I = image("split", M)
			I.override = 1
			src.client.images += I
			src.client.hidden_atoms += I
			src.client.hidden_mobs += M
			if(src.grabbed_by == M)//If we're pulling them we don't want them to be invisible, too hard to play like that.
				I.override = 0

		var/obj/item/O
		for(O in cone(src, OPPOSITE_DIR(src.dir), oview(src)))
			I = image("split", O)
			I.override = 1
			src.client.images += I
			src.client.hidden_atoms += I
