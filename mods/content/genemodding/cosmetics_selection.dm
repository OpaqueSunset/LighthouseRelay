/datum/category_item/player_setup_item/physical/cosmetics/content(var/mob/user)
	. += "<h2>Genemod Selection</h2>"

	var/ear_display = "Normal"
	var/list/ear_styles = decls_repository.get_decls_of_subtype(/decl/sprite_accessory/ears)
	var/list/tail_styles = decls_repository.get_decls_of_subtype(/decl/sprite_accessory/tail)
	var/decl/sprite_accessory/ears/ear = (pref.ear_style in ear_styles) ? ear_styles[pref.ear_style] : null
	if(ear)
		ear_display = ear.name
	else if(pref.ear_style)
		ear_display = "REQUIRES UPDATE"
	. += "<b>Ears</b><br>"
	. += " Style: <a href='?src=\ref[src];ear_style=1'>[ear_display]</a><br>"
	if (!isnull(ear.color_blend))
		. += "<a href='?src=\ref[src];ear_color=1'>Change Color</a> [COLORED_SQUARE(pref.ear_color)]<br>"
		if (ear.extra_overlay)
			. += "<a href='?src=\ref[src];ear_color2=1'>Change Secondary Color</a> [COLORED_SQUARE(pref.ear_color_extra)]<br>"

	var/tail_display = "Normal"
	var/decl/sprite_accessory/tail/tails = (pref.tail_style in tail_styles) ? tail_styles[pref.tail_style] : null
	if(tails)
		tail_display = tails.name
	else if(pref.tail_style)
		tail_display = "REQUIRES UPDATE"
	. += "<b>Tail</b><br>"
	. += " Style: <a href='?src=\ref[src];tail_style=1'>[tail_display]</a><br>"

	if (!isnull(tails?.color_blend))
		. += "<a href='?src=\ref[src];tail_color=1'>Change Color</a> [COLORED_SQUARE(pref.tail_color)]<br>"
		if (tails.extra_overlay) // only show the secondary color prompt if we can change color to begin with
			. += "<a href='?src=\ref[src];tail_color2=1'>Change Secondary Color</a> [COLORED_SQUARE(pref.tail_color_extra)]<br>"


/datum/category_item/player_setup_item/physical/cosmetics/OnTopic(var/href,var/list/href_list, var/mob/user)
	if(!CanUseTopic(user))
		return TOPIC_NOACTION

	var/list/ear_styles = decls_repository.get_decls_of_subtype(/decl/sprite_accessory/ears)
	var/list/tail_styles = decls_repository.get_decls_of_subtype(/decl/sprite_accessory/tail)

	if(href_list["ear_style"])
		// Construct the list of names allowed for this user.
		var/list/pretty_ear_styles = list("Normal" = null)
		for(var/path in ear_styles)
			var/decl/sprite_accessory/ears/instance = ear_styles[path]
			pretty_ear_styles[instance.name] = path

		// Present choice to user
		var/new_ear_style = input(user, "Pick ears", "Character Preference", pref.ear_style) as null|anything in pretty_ear_styles
		if(new_ear_style)
			pref.ear_style = pretty_ear_styles[new_ear_style]
		return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["ear_color"])
		var/new_earc = input(user, "Choose your character's ear colour:", "Character Preference",
			pref.ear_color) as color|null
		if(new_earc)
			pref.ear_color = new_earc
		return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["ear_color2"])
		var/new_earc2 = input(user, "Choose your character's ear colour:", "Character Preference",
			pref.ear_color_extra) as color|null
		if(new_earc2)
			pref.ear_color_extra = new_earc2
		return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["tail_style"])
		// Construct the list of names allowed for this user.
		var/list/pretty_tail_styles = list("Normal" = null)
		for(var/path in tail_styles)
			var/decl/sprite_accessory/tail/instance = tail_styles[path]
			pretty_tail_styles[instance.name] = path

		// Present choice to user
		var/new_tail_style = input(user, "Pick tails", "Character Preference", pref.tail_style) as null|anything in pretty_tail_styles
		if(new_tail_style)
			pref.tail_style = pretty_tail_styles[new_tail_style]
		return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["tail_color"])
		var/new_tailc = input(user, "Choose your character's tail colour:", "Character Preference",
			pref.tail_color) as color|null
		if(new_tailc)
			pref.tail_color = new_tailc
			return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["tail_color2"])
		var/new_tailc2 = input(user, "Choose your character's secondary tail colour:", "Character Preference",
			pref.tail_color_extra) as color|null
		if(new_tailc2)
			pref.tail_color_extra = new_tailc2
		return TOPIC_REFRESH_UPDATE_PREVIEW
	return ..()