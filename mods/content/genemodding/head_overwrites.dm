var/global/list/ear_icon_cache = list() //key is "\ref[ear_style]", if colorable plus "[ear_color]" and potentially "[ear_color_extra]"
/obj/item/organ/external/head/get_hair_icon()
	var/image/res = ..()
	if(!owner.ear_style || (owner.head?.flags_inv & BLOCKHEADHAIR))
		return res
	var/icon_key
	if(owner.ear_style.do_colouration)
		if(owner.ear_style.extra_overlay)
			icon_key = "\ref[owner.ear_style][owner.ear_color][owner.ear_color_extra]"
		else
			icon_key = "\ref[owner.ear_style][owner.ear_color]"
	else
		icon_key = any2ref(owner.ear_style)
	var/icon/ears_icon = global.ear_icon_cache[icon_key]
	if(!ears_icon)
		ears_icon = icon(owner.ear_style.icon, owner.ear_style.icon_state)
		if(owner.ear_style.do_colouration)
			ears_icon.Blend(owner.ear_color, owner.ear_style.blend)
		if(owner.ear_style.extra_overlay)
			var/icon/overlay = icon(owner.ear_style.icon, owner.ear_style.extra_overlay)
			overlay.Blend(owner.ear_color_extra, owner.ear_style.blend)
			ears_icon.Blend(overlay, ICON_OVERLAY)
			qdel(overlay)
		global.ear_icon_cache[icon_key] = ears_icon
	res.overlays |= ears_icon
	return res