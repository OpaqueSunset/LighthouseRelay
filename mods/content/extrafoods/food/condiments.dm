/obj/item/chems/condiment/small/spacespice
	name = "\improper Space-Spice! bottle"
	desc = "Space-Spice! brand Space-Spice!, manufactured by Space-Spice! Ltd., is a proprietary blend of spices claimed to taste better in space. This claim has not been evaluated by any scientific research and does not purport to treat or cure any disease, real or fictional. Any resemblance to other seasonings alive or dead is entirely coincidental."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "spacespicebottle"
	possible_transfer_amounts = @"[1,40]"
	volume = 40
	var/static/has_done_jank = FALSE

/obj/item/chems/condiment/small/spacespice/Initialize()
	. = ..()
	if(!has_done_jank && !(/decl/material/solid/spacespice in special_bottles))
		special_bottles[/decl/material/solid/spacespice] = /obj/item/chems/condiment/small/spacespice
		has_done_jank = TRUE // remove all this when condiment bottles are moved to be on materials

/obj/item/chems/condiment/small/spacespice/populate_reagents()
	add_to_reagents(/decl/material/solid/spacespice, reagents.maximum_volume)