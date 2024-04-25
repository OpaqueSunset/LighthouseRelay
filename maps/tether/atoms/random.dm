/obj/random/loot_pile
	abstract_type = /obj/random/loot_pile

/obj/random/loot_pile/maintenance
	name = "random maintenance loot pile"
	desc = "This is a random maintenance loot pile."
	icon = 'mods/content/dungeon_loot/icons/obj/loot_piles.dmi'
	icon_state = "randompile"
	spawn_nothing_percentage = 20

/obj/random/loot_pile/maintenance/spawn_choices()
	var/static/list/spawnable_choices = list(
		/obj/structure/loot_pile/maint/junk      = 5,
		/obj/structure/loot_pile/maint/trash     = 4,
		/obj/structure/loot_pile/maint/boxfort   = 3,
		/obj/structure/loot_pile/maint/technical = 2
	)
	return spawnable_choices

/obj/random/medical/pillbottle
	name = "Random pill bottle"
	desc = "This is a random pill bottle item."
	icon = 'icons/obj/items/storage/pillbottle.dmi'
	icon_state = "pill_canister"

/obj/random/medical/pillbottle/spawn_choices()
	var/static/list/spawnable_choices = list(
		/obj/item/pill_bottle =                 4,
		/obj/item/pill_bottle/antibiotics =     4,
		/obj/item/pill_bottle/painkillers =     2,
		/obj/item/pill_bottle/antidepressants = 4,
		/obj/item/pill_bottle/oxygen =          2,
		/obj/item/pill_bottle/stabilizer =      2,
		/obj/item/pill_bottle/antitox =         4,
		/obj/item/pill_bottle/burn_meds =       2,
		/obj/item/pill_bottle/brute_meds =      2,
		/obj/item/pill_bottle/assorted =        1
	)
	return spawnable_choices