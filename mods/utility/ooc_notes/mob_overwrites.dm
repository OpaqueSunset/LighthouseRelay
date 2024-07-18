/decl/human_examination/ooc_notes

/decl/human_examination/ooc_notes/do_examine(var/user, var/distance, var/mob/living/human/source)
	if(source.mind && source.mind.ooc_notes)
		return "<br><span class = 'deptradio'>OOC Notes:</span> <a href='?src=\ref[source];ooc_notes=1'>\[View\]</a><br>"

/mob/living/human/OnTopic(mob/user, href_list)
	if(href_list["ooc_notes"])
		if(mind && mind.ooc_notes)
			to_chat(user, "[src]'s OOC Notes:")
			to_chat(user, mind.ooc_notes)
	. = ..()