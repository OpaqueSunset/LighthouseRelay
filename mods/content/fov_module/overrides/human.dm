/datum/hud/human/FinalizeInstantiation()
	..()
	var/list/hud_elements = list()
	if(ishuman(mymob))
		var/mob/living/carbon/human/H = mymob
		H.fov = new /obj/screen()
		H.fov.icon = 'mods/content/fov_module/icons/mob/hide.dmi'
		H.fov.icon_state = "combat"
		H.fov.name = " "
		H.fov.screen_loc = "1,1"
		H.fov.mouse_opacity = 0
		H.fov.plane = VISION_CONE_PLANE
		hud_elements |= H.fov

		H.fov_mask = new /obj/screen()
		H.fov_mask.icon = 'mods/content/fov_module/icons/mob/hide.dmi'
		H.fov_mask.icon_state = "combat_mask"
		H.fov_mask.name = " "
		H.fov_mask.screen_loc = "1,1"
		H.fov_mask.mouse_opacity = 0
		H.fov_mask.plane = HIDDEN_SHIT_PLANE
		hud_elements |= H.fov_mask

		mymob.client.screen += hud_elements

/client
//	..()
	var/list/in_vision_cones = list()
	var/list/hidden_atoms = list()
	var/list/hidden_mobs = list()

/mob/living/Move()
	..()
	for(var/mob/M in oview(src))
		M.update_vision_cone()
	update_vision_cone()

/mob/living/set_dir()
	..()
	update_vision_cone()

/client/Move(n, direct)
	..()
	if(isturf(mob.loc))
		if(mob.grabbed_by)
			mob.dir = turn(mob.dir, 180)//Not needed, as it's already a thing, but just in case this gets screwed.
			mob.update_vision_cone()

	for(var/client/C in in_vision_cones)
		if(src in C.hidden_mobs)
			var/turf/T = get_turf(src)
			var/image/I = image('mods/content/fov_module/icons/mob/footstepsound.dmi', loc = T, icon_state = "default", layer = 18)
			C.images += I
			spawn(4)
				if(C)
					C.images -= I

		else
			in_vision_cones.Remove(C)
//	. = ..()

/mob/UpdateLyingBuckledAndVerbStatus()
	..()
	update_vision_cone()

/mob/living/carbon/human
	..()
	var/obj/screen/fov = null//The screen object because I can't figure out how the hell TG does their screen objects so I'm just using legacy code.
	var/obj/screen/fov_mask = null
	var/usefov = TRUE

/mob/living/carbon/human/update_equipment_vision()
	..()
	var/use_original_cone = TRUE

	var/obj/item/clothing/head/helmet = get_equipped_item(slot_head_str)
	if(istype(helmet))
		update_helmet_vision(helmet)
		use_original_cone = FALSE

	var/obj/item/clothing/mask/mask = get_equipped_item(slot_wear_mask_str)
	if(istype(mask))
		update_mask_vision(mask)
		use_original_cone = FALSE

	if(use_original_cone)
		fov_mask.icon_state = "combat_mask"
		fov.icon_state = "combat"

/mob/living/carbon/human/proc/update_helmet_vision(var/obj/item/clothing/head/H)
	if(H.helmet_vision)
		fov_mask.icon_state = "helmet_mask"
		fov.icon_state = "helmet"
	else
		fov_mask.icon_state = "combat_mask"
		fov.icon_state = "combat"

/mob/living/carbon/human/proc/update_mask_vision(var/obj/item/clothing/mask/M)
	if(M.helmet_vision)
		fov_mask.icon_state = "helmet_mask"
		fov.icon_state = "helmet"
	else
		fov_mask.icon_state = "combat_mask"
		fov.icon_state = "combat"

/obj/item/clothing
	var/helmet_vision = FALSE
