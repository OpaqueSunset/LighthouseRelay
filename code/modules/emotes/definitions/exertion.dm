/decl/emote/exertion
	abstract_type = /decl/emote/exertion

/decl/emote/exertion/biological
	key = "esweat"
	emote_range = 4
	emote_message_1p = "You are sweating heavily."
	emote_message_3p = "$USER$ sweats heavily."

/decl/emote/exertion/biological/mob_can_use(mob/living/user, assume_available = FALSE)
	if(istype(user) && !user.isSynthetic())
		return ..()
	return FALSE

/decl/emote/exertion/biological/breath
	key = "ebreath"
	emote_message_1p = "You feel out of breath."
	emote_message_3p = "$USER$ looks out of breath."

/decl/emote/exertion/biological/pant
	key = "epant"
	emote_range = 3
	message_type = AUDIBLE_MESSAGE
	emote_message_1p = "You pant to catch your breath."
	emote_message_3p = "$USER$ pants for air."
	emote_message_impaired = "You can see $USER$ breathing heavily."

/decl/emote/exertion/synthetic
	key = "ewhine"
	emote_range = 3
	message_type = AUDIBLE_MESSAGE
	emote_message_1p = "You overstress your actuators."
	emote_message_3p = "$USER$'s actuators whine with strain."

/decl/emote/exertion/synthetic/mob_can_use(mob/living/user, assume_available = FALSE)
	if(istype(user) && user.isSynthetic())
		return ..()
	return FALSE

/decl/emote/exertion/synthetic/creak
	key = "ecreak"
	emote_message_1p = "Your chassis stress indicators spike."
	emote_message_3p = "$USER$'s joints creak with stress."
