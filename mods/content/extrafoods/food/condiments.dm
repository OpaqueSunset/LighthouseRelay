/decl/condiment_appearance/spacespice
	condiment_type = /decl/material/solid/spacespice
	condiment_name = "\improper Space-Spice! bottle"
	condiment_desc = "Space-Spice! brand Space-Spice!, manufactured by Space-Spice! Ltd., is a proprietary blend of spices claimed to taste better in space. This claim has not been evaluated by any scientific research and does not purport to treat or cure any disease, real or fictional. Any resemblance to other seasonings alive or dead is entirely coincidental."
	condiment_icon = 'mods/content/extrafoods/icons/obj/spacespice.dmi'
	condiment_key  = "small"
	condiment_center_of_mass = @'{"x":16,"y":9}'

#define MAPPED_CONDIMENT_TYPE(ID, TYPE) \
/obj/item/chems/condiment/small/##ID {  \
	initial_condiment_type = TYPE;      \
	morphic_container = FALSE;          \
	name = TYPE::condiment_name;        \
	desc = TYPE::condiment_desc;        \
	icon = TYPE::condiment_icon;        \
}

MAPPED_CONDIMENT_TYPE(spacespice, /decl/condiment_appearance/spacespice)
// Override the max volume and stuff
/obj/item/chems/condiment/small/spacespice
	volume = 40
	possible_transfer_amounts = @"[1,2,5,8,10,20,40]"

#undef MAPPED_CONDIMENT_TYPE
