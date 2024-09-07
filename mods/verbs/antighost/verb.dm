var/global/list/speech_toppings = list("|" = "i", "+" = "b", "_" = "u")

/mob/verb/subtle(message as message)
	set name = "Subtle"
	set category = "IC"
	set desc = "Emote silently to people around you. Toggle 'Show Subtle Messages To Observers' to stop observers from seeing it."
	if(!filter_block_message(usr, message))
		usr.custom_emote_subtle(message = message)

/proc/log_subtle(text)
	if (get_config_value(/decl/config/toggle/log_say))
		game_log("SUBTLE", text)

/mob/proc/custom_emote_subtle(var/m_type=VISIBLE_MESSAGE, var/message = null) //This would normally go in emote.dm
	if(!can_emote(m_type))
		return

	var/muzzled = is_silenced()
	if(m_type == AUDIBLE_MESSAGE && muzzled) return

	var/input
	if(!message)
		input = sanitize_or_reflect(input(src,"Choose an emote to display.") as text|null, src)
	else
		input = message

	if(input)
		log_subtle(message)
		message = "<span class='emote_subtle'><B>[src]</B> <I>[input]</I></span>"
	else
		return

	if (message)
		var/undisplayed_message = "<span class='emote'><B>[src]</B> <I>does something too subtle for you to see.</I></span>"
		message = encode_html_emphasis(message)

		var/list/vis_mobs = list()
		var/list/vis_objs = list()
		get_mobs_and_objs_in_view_fast(get_turf(src),1,vis_mobs,vis_objs) //ok so the implementation on bay/neb directly mutates lists

		for(var/mob/vismob as anything in vis_mobs)
			if(isobserver(vismob) && (get_preference_value(/datum/client_preference/show_subtle) == PREF_HIDE) && !vismob.client?.holder)
				vismob.show_message(undisplayed_message, AUDIBLE_MESSAGE)
			else
				vismob.show_message(message, AUDIBLE_MESSAGE)

		for(var/obj/visobj as anything in vis_objs)
			visobj.show_message(message, AUDIBLE_MESSAGE)


#define MAX_HUGE_MESSAGE_LEN 8192
#define POST_DELIMITER_STR "\<\>"
/proc/sanitize_or_reflect(message,user)
	//Way too long to send
	if(length(message) > MAX_HUGE_MESSAGE_LEN)
		fail_to_chat(user)
		return

	message = sanitize(message, max_length = MAX_HUGE_MESSAGE_LEN)

	//Came back still too long to send
	if(length(message) > MAX_MESSAGE_LEN)
		fail_to_chat(user,message)
		return null
	else
		return message

// returns true if it failed
/proc/reflect_if_needed(message, user)
	if(length(message) > MAX_HUGE_MESSAGE_LEN)
		fail_to_chat(user)
		return TRUE
	return FALSE

/proc/fail_to_chat(user,message)
	if(!message)
		to_chat(user, SPAN_DANGER("Your message was NOT SENT, either because it was FAR too long, or sanitized to nothing at all."))
		return

	var/length = length(message)
	var/posts = ceil(length/MAX_MESSAGE_LEN)
	to_chat(user,message)
	to_chat(user, SPAN_DANGER("^ This message was NOT SENT ^ -- It was [length] characters, and the limit is [MAX_MESSAGE_LEN]. It would fit in [posts] separate messages."))

/proc/encode_html_emphasis(message)
	var/tagged_message = message
	for(var/delimiter in speech_toppings)
		var/regex/R = new("\\[delimiter](.+?)\\[delimiter]","g")
		var/tag = speech_toppings[delimiter]
		tagged_message = R.Replace(tagged_message,"<[tag]>$1</[tag]>")

	return tagged_message

#undef MAX_HUGE_MESSAGE_LEN
#undef POST_DELIMITER_STR