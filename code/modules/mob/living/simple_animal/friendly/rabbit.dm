/mob/living/simple_animal/rabbit
	name = "white rabbit"
	desc = "A hopping mammal with long ears and a love for carrots."
	icon = 'icons/mob/simple_animal/rabbit_white.dmi'
	max_health = 40
	natural_weapon = /obj/item/natural_weapon/bite/weak
	speak_emote = list("chitters")
	emote_hear = list("chitters")
	emote_see = list("hops","lifts its head","sniffs the air","wiggles its tail")
	mob_size = MOB_SIZE_SMALL
	butchery_data = /decl/butchery_data/animal/rabbit
	speak_chance = 0.5

/mob/living/simple_animal/rabbit/brown
	name = "brown rabbit"
	icon = 'icons/mob/simple_animal/rabbit_brown.dmi'
	butchery_data = /decl/butchery_data/animal/rabbit/brown

/mob/living/simple_animal/rabbit/black
	name = "black rabbit"
	icon = 'icons/mob/simple_animal/rabbit_black.dmi'
	butchery_data = /decl/butchery_data/animal/rabbit/black
