/obj/item/organ/external/head/get_mob_overlays()
	. = ..()
	if(!owner)
		return
	var/ear_style = owner.get_ear_style()
	if(ear_style)
		var/decl/sprite_accessory/ears/ears = resolve_accessory_to_decl(ear_style)
		if(ears?.accessory_is_available(owner, species, bodytype))
			LAZYADD(., image(ears.get_cached_accessory_icon(src, owner.get_ear_colour(), owner.get_extra_ear_colour())))
