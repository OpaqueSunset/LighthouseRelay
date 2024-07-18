/datum/preferences
	var/ooc_notes //OOC notes - this is here because making a modpack for it on it's own would be kinda dumb

/datum/category_item/player_setup_item/physical/ooc_notes
	name = "OOC Information"
	sort_order = 5

/datum/category_item/player_setup_item/physical/ooc_notes/load_character(datum/pref_record_reader/R)
	pref.ooc_notes = R.read("ooc_notes")

/datum/category_item/player_setup_item/physical/ooc_notes/save_character(datum/pref_record_writer/W)
	W.write("ooc_notes", pref.ooc_notes)

/datum/category_item/player_setup_item/physical/ooc_notes/sanitize_character()
	if(pref.ooc_notes)
		pref.ooc_notes = sanitize_text(pref.ooc_notes)

/datum/category_item/player_setup_item/physical/ooc_notes/content(var/mob/user)
	. += "<a href='?src=\ref[src];ooc_notes=1'>Set OOC Notes</a><br/>"

/datum/category_item/player_setup_item/physical/ooc_notes/OnTopic(var/href,var/list/href_list, var/mob/user)
	if(href_list["ooc_notes"])
		var/new_notes = input(user, "Input your OOC notes.", "OOC Notes", pref.ooc_notes) as message
		if(length_char(new_notes) >= (MAX_MESSAGE_LEN * 4))
			to_chat(user, SPAN_WARNING("Your OOC notes are too long!"))
			return TOPIC_REFRESH_UPDATE_PREVIEW
		pref.ooc_notes = sanitize_text(new_notes)

	return ..()

/datum/preferences/copy_to(mob/living/human/character, is_preview_copy = FALSE)
	..()
	if(is_preview_copy)
		return
	addtimer(CALLBACK(src, PROC_REF(copy_ooc_notes)), 2 SECONDS)

/datum/preferences/proc/copy_ooc_notes()
	for(var/datum/mind/M in SSticker.minds) //Need to iterate minds, unfortunately.
		if(ckey(M.key) == client_ckey)
			M.ooc_notes = ooc_notes