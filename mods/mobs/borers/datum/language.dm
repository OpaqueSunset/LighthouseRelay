/decl/language/corticalborer
	name = "Cortical Link"
	desc = "Cortical borers possess a strange link between their tiny minds."
	speech_verb = "sings"
	ask_verb = "sings"
	exclaim_verb = "sings"
	colour = "alien"
	key = "z"
	flags = LANG_FLAG_RESTRICTED | LANG_FLAG_HIVEMIND
	shorthand = "N/A"
	hidden_from_codex = TRUE

#define isborer(X) istype(X, /mob/living/simple_animal/borer)
/decl/language/corticalborer/broadcast(var/mob/living/speaker,var/message,var/speaker_mask)
	var/mob/living/simple_animal/borer/B = isborer(speaker) ? speaker : speaker.has_brain_worms()
	if(B)
		if(B.host)
			if(B.host.nutrition < 50 || B.host.stat)
				to_chat(speaker, SPAN_WARNING("Your host is too weak to relay your broadcast."))
				return FALSE
			B.host.adjust_nutrition(-(rand(1, 3)))
		speaker_mask = B.truename
	..(speaker,message,speaker_mask)
