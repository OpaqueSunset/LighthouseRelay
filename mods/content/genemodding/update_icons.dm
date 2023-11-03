/mob/living/carbon/human/get_tail_icon(var/obj/item/organ/external/tail/tail_organ)
	// No parent call. This is a replacement, not a side-override.
	var/decl/bodytype/root_bodytype = get_bodytype()
	if(!istype(tail_organ))
		return
	var/tail_anim = tail_organ.get_tail_animation() || tail_organ.get_tail_icon()
	var/blend_color = tail_organ.get_tail_colour() || ((root_bodytype.appearance_flags & HAS_SKIN_COLOR) ? skin_colour : FALSE)
	var/icon_key = "[ref(tail_anim)][tail_organ.get_tail()][blend_color][tail_organ.get_tail_blend()]_[tail_organ.get_tail_hair()][tail_organ.get_tail_hair_colour()][tail_organ.get_tail_hair_blend()]"
	var/icon/tail_icon = tail_icon_cache[icon_key]
	if(!tail_icon)
		//generate a new one
		tail_icon = icon(tail_anim)
		if(blend_color)
			tail_icon.Blend(blend_color, tail_organ.get_tail_blend())
		// The following will not work with animated tails.
		var/use_tail = tail_organ.get_tail_hair()
		if(use_tail)
			var/icon/hair_icon = icon(tail_organ.get_tail_icon(), "[tail_organ.get_tail()]_[use_tail]")
			if(tail_organ.get_tail_hair_colour())
				hair_icon.Blend(tail_organ.get_tail_hair_colour(), tail_organ.get_tail_hair_blend())
			tail_icon.Blend(hair_icon, ICON_OVERLAY)
		tail_icon_cache[icon_key] = tail_icon

	return tail_icon
