// TODO: REWRITE TO USE SPRITE ACCESSORY SYSTEM PROPERLY!
/mob/living/carbon/human/get_tail_icon_for_organ(var/obj/item/organ/external/tail/tail_organ)
	// No parent call. This is a replacement, not a side-override.
	if(!istype(tail_organ))
		return

	var/tail_state = tail_organ.get_tail()
	var/tail_icon  = tail_organ.get_tail_icon()
	if(!tail_state || !tail_icon)
		return // No tail data!

	// These values may be null and are generally optional.
	var/hair_colour     = GET_HAIR_COLOUR(src)
	var/tail_hair       = tail_organ.get_tail_hair()
	var/tail_blend      = tail_organ.get_tail_blend()
	var/tail_hair_blend = tail_organ.get_tail_hair_blend()
	var/tail_color      = tail_organ.get_tail_colour() // GENEMODDING EDIT

	var/icon_key = "[tail_state][tail_icon][tail_blend][tail_color][tail_hair][tail_hair_blend][hair_colour]"
	var/icon/blended_tail_icon = global.tail_icon_cache[icon_key]
	if(!blended_tail_icon)
		//generate a new one
		blended_tail_icon = icon(tail_icon, tail_state)
		// START LIGHTHOUSE EDIT
		if(tail_color && !isnull(tail_blend)) // 0 is a valid blend mode
			blended_tail_icon.Blend(tail_color, tail_blend)
		// END LIGHTHOUSE EDIT
		// The following will not work with animated tails.
		if(tail_hair)
			var/tail_hair_state = "[tail_state]_[tail_hair]"
			if(check_state_in_icon(tail_hair_state, tail_icon))
				var/icon/hair_icon = icon(tail_icon, tail_hair_state)
				if(hair_colour && !isnull(tail_hair_blend)) // 0 is a valid blend mode
					hair_icon.Blend(hair_colour, tail_hair_blend)
				blended_tail_icon.Blend(hair_icon, ICON_OVERLAY)
		global.tail_icon_cache[icon_key] = blended_tail_icon
	return blended_tail_icon