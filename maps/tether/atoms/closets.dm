// Crates
/obj/structure/closet/crate/secure/science
	name = "secure science crate"
	desc = "A crate with a lock on it, painted in the scheme of the station's scientists."
	closet_appearance = /decl/closet_appearance/crate/secure/hazard

// Closets

/decl/closet_appearance/bio/medical
	extra_decals = list(
		"lower_half_solid" = COLOR_BABY_BLUE,
		"biohazard" = COLOR_OFF_WHITE,
		"lower_side_vent"
	)

/decl/closet_appearance/secure_closet/expedition
	color = COLOR_BLUE_GRAY
	decals = list(
		"lower_side_vent"
	)
	extra_decals = list(
		"stripe_vertical_mid_full" = COLOR_PURPLE,
		"exped" = COLOR_PURPLE
	)

//SC Exploration Secure Closets Port
/obj/structure/closet/secure_closet/explorer
	name = "explorer locker"
	closet_appearance = /decl/closet_appearance/secure_closet/expedition
	req_access = list(access_explorer)

/obj/structure/closet/secure_closet/explorer/WillContain()
	. = list(
		/obj/item/clothing/under/explorer,
		/obj/item/clothing/suit/storage/toggle/explorer,
		/obj/item/clothing/mask/gas/explorer,
		/obj/item/clothing/shoes/winterboots/explorer,
		/obj/item/clothing/gloves/color/black,
		// /obj/item/gun/energy/frontier/locked/holdout, // todo: frontier weapons with extra simplemob damage
		// /obj/item/radio/headset/explorer,
		/obj/item/flashlight,
		/obj/item/gps/explorer,
		// /obj/item/storage/box/flare, // will be added upstream shortly
		/obj/item/geiger,
		/obj/item/cell/device,
		/obj/item/radio,
		/obj/item/stack/flag = 3,
		/obj/item/hatchet/machete,
		/obj/item/clothing/accessory/storage/holster/machete,
		/obj/item/chems/food/liquidfood,
		// /obj/item/chems/food/liquidprotein, // does not exist, no real interest in porting
		/obj/item/cataloguer)
	if(prob(50))
		. += /obj/item/storage/backpack
	else
		. += /obj/item/storage/backpack/satchel/grey