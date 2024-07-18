/obj/screen/fov
	requires_ui_style = FALSE

/datum/hud/human/FinalizeInstantiation()
	. = ..()
	var/list/hud_elements = list()
	if(ishuman(mymob))
		var/mob/living/human/H = mymob
		H.fov = new /obj/screen/fov(null, mymob)
		H.fov.icon = 'mods/content/fov_module/icons/mob/hide.dmi'
		H.fov.icon_state = "combat"
		H.fov.name = " "
		H.fov.screen_loc = "LEFT+50%,BOTTOM+50%"
		H.fov.mouse_opacity = MOUSE_OPACITY_UNCLICKABLE
		H.fov.plane = VISION_CONE_PLANE
		hud_elements |= H.fov

		H.fov_mask = new /obj/screen/fov(null, mymob)
		H.fov_mask.icon = 'mods/content/fov_module/icons/mob/hide.dmi'
		H.fov_mask.icon_state = "combat_mask"
		H.fov_mask.name = " "
		H.fov_mask.screen_loc = "LEFT+50%,BOTTOM+50%"
		H.fov_mask.mouse_opacity = MOUSE_OPACITY_UNCLICKABLE
		H.fov_mask.plane = HIDDEN_SHIT_PLANE
		hud_elements |= H.fov_mask

		mymob.client.screen += hud_elements

/client
	var/list/hidden_atoms = list()
	var/list/hidden_mobs = list()

/mob/living
	var/list/in_vision_cones = list()

/mob/living/Move()
	. = ..()
	for(var/mob/M in oview(src))
		M.update_vision_cone()
	update_vision_cone()

/mob/living/Move(var/client/C)
	. = ..()
	for(C in in_vision_cones)
		if(src in C.hidden_mobs)
			var/turf/T = get_turf(src)
			var/image/I = image('mods/content/fov_module/icons/mob/footstepsound.dmi', loc = T, icon_state = "default", layer = 18)
			C.images += I
			spawn(4)
				if(C)
					C.images -= I
		else
			in_vision_cones.Remove(C)

/mob/living/set_dir()
	. = ..()
	update_vision_cone()

/client/Move(n, direct)
	. = ..()
	if(isturf(mob.loc))
		if(mob.grabbed_by)
			mob.dir = turn(mob.dir, 180)
			mob.update_vision_cone()

/mob/update_posture(force_update)
	. = ..()
	update_vision_cone()

/mob/living/human
	var/obj/screen/fov = null
	var/obj/screen/fov_mask = null
	var/usefov = TRUE

/mob/living/human/update_equipment_vision()
	. = ..()
	if(!client)
		return
	var/obj/item/clothing/headwear = get_equipped_item(slot_head_str)
	var/obj/item/clothing/maskwear = get_equipped_item(slot_wear_mask_str)
	var/obj/item/clothing/eyeswear = get_equipped_item(slot_glasses_str)
	var/use_original_cone = TRUE
	if(istype(headwear) && headwear.helmet_vision \
	|| istype(maskwear) && maskwear.helmet_vision \
	|| istype(eyeswear) && eyeswear.helmet_vision)
		use_original_cone = FALSE

	if(use_original_cone)
		fov_mask.icon_state = "combat_mask"
		fov.icon_state = "combat"
	else
		fov_mask.icon_state = "helmet_mask"
		fov.icon_state = "helmet"

/obj/item/clothing
	var/helmet_vision = FALSE

/obj/item/clothing/needs_vision_update()
	return ..() || helmet_vision