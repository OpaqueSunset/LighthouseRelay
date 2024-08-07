/datum/phenomena/exude_blood
	name = "Exhude Blood"
	desc = "Take pity on a follower, converting a pitance of your power into blood. Don't let them forget your mercy."
	cost = 20
	flags = PHENOMENA_FOLLOWER
	expected_type = /mob/living/human

/datum/phenomena/exude_blood/can_activate(var/mob/living/human/H)
	if(!..())
		return 0

	if(!H.should_have_organ(BP_HEART) || H.vessel.total_volume == H.species.blood_volume)
		to_chat(linked, SPAN_WARNING("\The [H] doesn't require anymore blood."))
		return 0
	return 1

/datum/phenomena/exude_blood/activate(var/mob/living/human/H, var/mob/living/deity/user)
	H.adjust_blood(30)
	to_chat(H,SPAN_NOTICE("You feel a rush as new blood enters your system."))


/datum/phenomena/hellscape
	name = "Reveal Hellscape"
	desc = "Show a non-follower what awaits their souls after you are through with them."
	cost = 60
	cooldown = 450
	flags = PHENOMENA_NONFOLLOWER
	expected_type = /mob/living
	var/static/list/creepy_notes = list("Your knees give out as an unnatural screaming rings your ears.",
										"You breathe in ash and decay, your lungs gasping for air as your body gives way to the floor.",
										"An extreme pressure comes over you, as if an unknown force has marked you.")

/datum/phenomena/hellscape/activate(var/mob/living/L)
	to_chat(L, "<font size='3'><span class='cult'>[pick(creepy_notes)]</span></font>")
	L.damageoverlaytemp = 100
	sound_to(L, 'sound/hallucinations/far_noise.ogg')
	SET_STATUS_MAX(L, STAT_WEAK, 2)