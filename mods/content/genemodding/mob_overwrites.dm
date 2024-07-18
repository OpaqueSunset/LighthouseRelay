/mob/living/human
	var/decl/sprite_accessory/ears/ear_style = null
	var/ear_color = "#1e1e1e"
	var/ear_color_extra = "#1e1e1e"
	var/decl/sprite_accessory/tail/tail_style = null // for bookkeeping in is_default_limb
	var/tail_color = "#1e1e1e"
	var/tail_color_extra = "#1e1e1e"

/mob/living/proc/get_ear_style()
	return

/mob/living/proc/get_ear_colour()
	return

/mob/living/proc/get_extra_ear_colour()
	return

/mob/living/human/get_ear_style()
	return ear_style

/mob/living/human/get_ear_colour()
	return ear_color

/mob/living/human/get_extra_ear_colour()
	return ear_color_extra