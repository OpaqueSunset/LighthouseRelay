// Define a place to save appearance in character setup
/datum/preferences
	var/ear_style					// Type of selected ear style
	var/ear_color = "#1e1e1e"		// Ear color.
	var/ear_color_extra = "#1e1e1e"// Ear extra color.
	var/tail_style					// Type of selected tail style
	var/tail_color = "#1e1e1e"		// Tail color
	var/tail_color_extra = "#1e1e1e"// Tail overlay color

// Definition of the stuff for Ears
/datum/category_item/player_setup_item/physical/cosmetics
	name = "Cosmetics"
	sort_order = 5

/datum/category_item/player_setup_item/physical/cosmetics/load_character(datum/pref_record_reader/R)
	var/ear_style_uid = R.read("ear_style")
	if(ear_style_uid)
		pref.ear_style = decls_repository.get_decl_by_id(ear_style_uid)?.type
	else
		pref.ear_style = null
	pref.ear_color = R.read("ear_color")
	pref.ear_color_extra = R.read("ear_color_extra")
	var/tail_style_uid = R.read("tail_style")
	if(tail_style_uid)
		pref.tail_style = decls_repository.get_decl_by_id(tail_style_uid)?.type
	else
		pref.tail_style = null
	pref.tail_color = R.read("tail_color")
	pref.tail_color_extra = R.read("tail_color_extra")

/datum/category_item/player_setup_item/physical/cosmetics/save_character(datum/pref_record_writer/W)
	var/decl/sprite_accessory/ears/ear = GET_DECL(pref.ear_style)
	W.write("ear_style", ear?.uid)
	W.write("ear_color", pref.ear_color)
	W.write("ear_color_extra", pref.ear_color_extra)
	var/decl/sprite_accessory/tail/tail = GET_DECL(pref.tail_style)
	W.write("tail_style", tail?.uid)
	W.write("tail_color", pref.tail_color)
	W.write("tail_color_extra", pref.tail_color_extra)


/datum/category_item/player_setup_item/physical/cosmetics/sanitize_character()
	pref.ear_color =		pref.ear_color			|| COLOR_BLACK
	pref.ear_color_extra =	pref.ear_color_extra	|| COLOR_BLACK
	pref.tail_color =		pref.tail_color			|| COLOR_BLACK
	pref.tail_color_extra =	pref.tail_color_extra	|| COLOR_BLACK

/mob/living/human/proc/sync_tail_to_style(update_icon = TRUE)
	var/obj/item/organ/external/tail/tail_organ = get_organ(BP_TAIL)
	var/decl/bodytype/root_bodytype = get_bodytype()
	var/datum/mob_snapshot/mob_appearance = new(src)
	if(!tail_style)
		if(!tail_organ || root_bodytype.is_default_limb(tail_organ))
			return
		remove_organ(tail_organ, FALSE, FALSE, TRUE, TRUE, FALSE, TRUE)
		qdel(tail_organ)
		var/list/tail_data = LAZYACCESS(root_bodytype?.has_limbs, BP_TAIL)
		var/tail_path = LAZYACCESS(tail_data, "path")
		if(!tail_path)
			return
		tail_organ = new tail_path(src, null, mob_appearance)
		add_organ(tail_organ, TRUE, TRUE, FALSE, TRUE)
		return
	if(!tail_organ)
		tail_organ = new(src, null, mob_appearance)
		add_organ(tail_organ)
		// everything with adding the tail organ will be handled in its Initialize
	tail_organ.tail_icon = tail_style.icon
	tail_organ.tail = tail_style.icon_state
	if(isnull(tail_style.color_blend))
		tail_organ.tail_colour = null
		tail_organ.tail_hair_colour = null
		tail_organ.tail_blend = null
		tail_organ.tail_hair_blend = null
	else
		tail_organ.tail_colour = tail_color
		tail_organ.tail_hair_colour = tail_color_extra
		tail_organ.tail_blend = tail_style.color_blend
		tail_organ.tail_hair_blend = tail_style.color_blend
	if(tail_style.extra_overlay)
		tail_organ.tail_hair = tail_style.extra_overlay
	else
		tail_organ.tail_hair = null
	update_tail_showing(update_icon)

/datum/preferences/copy_to(mob/living/human/character, is_preview_copy = FALSE)
	. = ..() // must be after species and such are set
	var/list/ear_styles = decls_repository.get_decls_of_subtype(/decl/sprite_accessory/ears)
	var/list/tail_styles = decls_repository.get_decls_of_subtype(/decl/sprite_accessory/tail)
	character.ear_style = ear_styles[ear_style]
	character.ear_color = ear_color
	character.ear_color_extra = ear_color_extra
	character.update_hair(update_icons = FALSE)
	character.tail_style = tail_styles[tail_style]
	character.tail_color = tail_color
	character.tail_color_extra = tail_color_extra
	character.sync_tail_to_style(update_icon = TRUE)

/decl/bodytype/create_missing_organs(mob/living/human/H, fully_replace)
	. = ..()
	H.sync_tail_to_style(update_icon = TRUE)