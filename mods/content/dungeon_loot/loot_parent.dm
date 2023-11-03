/obj/structure/loot_pile
	abstract_type = /obj/structure/loot_pile
	name = "base loot pile"
	desc = "If you can read me, this is bugged."
	icon = 'mods/content/dungeon_loot/icons/obj/loot_piles.dmi'
	icon_state = "randompile"
	density = FALSE
	anchored = TRUE

	var/list/icon_states_to_use = list() // List of icon states the pile can choose from on initialization. If empty or null, it will stay the initial icon_state.

	var/list/searched_by = list()	// Keys that have searched this loot pile, with values of searched time.
	var/allow_multiple_looting = FALSE	// If true, the same person can loot multiple times.  Mostly for debugging.
	var/busy = FALSE				// Used so you can't spamclick to loot.

	var/chance_nothing = 0			// Unlucky people might need to loot multiple spots to find things.

	var/chance_uncommon = 10		// Probability of pulling from the uncommon_loot list.
	var/chance_rare = 1				// Ditto, but for rare_loot list.
	var/loot_depletion = FALSE		// If true, loot piles can be 'depleted' after a certain number of searches by different players, where no more loot can be obtained.
	var/loot_left = 0				// When this reaches zero, and loot_depleted is true, you can't obtain anymore loot.
	var/delete_on_depletion = FALSE	// If true, and if the loot gets depleted as above, the pile is deleted.

	var/list/common_loot = list()	// Common is generally less-than-useful junk and filler, at least for maint loot piles.
	var/list/uncommon_loot = list()	// Uncommon is actually maybe some useful items, usually the reason someone bothers looking inside.
	var/list/rare_loot = list()		// Rare is really powerful, or at least unique items.

/obj/structure/loot_pile/attack_ai(var/mob/user)
	if(isrobot(user) && Adjacent(user))
		return attack_hand(user)

/obj/structure/loot_pile/attack_hand(mob/user)
	//Human mob
	if(isliving(user))
		var/mob/living/L = user

		if(busy)
			to_chat(L, SPAN_WARNING("\The [src] is already being searched."))
			return

		L.visible_message("\The [user] searches through \the [src].", SPAN_NOTICE("You search through \the [src]."), SPAN_NOTICE("You hear some rustling."))

		//Do the searching
		busy = TRUE
		if(do_after(user,rand(4 SECONDS,6 SECONDS),src))
			// The loot's all gone.
			if(loot_depletion && loot_left <= 0)
				to_chat(L, SPAN_WARNING("\The [src] has been picked clean."))
				busy = FALSE
				return

			//You already searched this one
			if( (user.ckey in searched_by) && !allow_multiple_looting)
				to_chat(L, SPAN_WARNING("You can't find anything else vaguely useful in \the [src].  Another set of eyes might, however."))
				busy = FALSE
				return

			// You got unlucky.
			if(chance_nothing && prob(chance_nothing))
				to_chat(L, SPAN_WARNING("Nothing in this pile really catches your eye..."))
				searched_by |= user.ckey
				busy = FALSE
				return

			// You found something!
			var/obj/item/loot = null
			var/span = "notice" // Blue

			if(prob(chance_rare) && rare_loot.len) // You won THE GRAND PRIZE!
				loot = produce_rare_item()
				span = "cult" // Purple and bold.

			else if(prob(chance_uncommon) && uncommon_loot.len) // Otherwise you might still get something good.
				loot = produce_uncommon_item()
				span = "alium" // Green

			else // Welp.
				loot = produce_common_item()

			if(loot)
				searched_by |= user.ckey
				loot.forceMove(get_turf(src))
				to_chat(L, SPAN_CLASS(span, "You found \a [loot]!"))
				if(loot_depletion)
					loot_left--
					if(loot_left <= 0)
						to_chat(L, SPAN_WARNING("You seem to have gotten the last of the spoils inside \the [src]."))
						if(delete_on_depletion)
							qdel(src)

		busy = FALSE
	else
		return ..()

/obj/structure/loot_pile/proc/produce_common_item()
	var/path = pick(common_loot)
	return new path(src)

/obj/structure/loot_pile/proc/produce_uncommon_item()
	var/path = pick(uncommon_loot)
	return new path(src)

/obj/structure/loot_pile/proc/produce_rare_item()
	var/path = pick(rare_loot)
	return new path(src)

/obj/structure/loot_pile/Initialize()
	if(icon_states_to_use && icon_states_to_use.len)
		icon_state = pick(icon_states_to_use)
	. = ..()
