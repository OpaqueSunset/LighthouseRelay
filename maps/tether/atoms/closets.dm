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
		/obj/item/clothing/suit/toggle/explorer,
		/obj/item/clothing/mask/gas/explorer,
		/obj/item/clothing/shoes/winterboots/explorer,
		/obj/item/clothing/gloves/black,
		// /obj/item/gun/energy/frontier/locked/holdout, // todo: frontier weapons with extra simplemob damage // or maybe not
		// /obj/item/radio/headset/explorer,
		/obj/item/flashlight,
		/obj/item/gps/explorer,
		/obj/item/box/flares,
		/obj/item/geiger,
		/obj/item/cell/device,
		/obj/item/radio,
		/obj/item/stack/flag = 3,
		/obj/item/tool/machete,
		/obj/item/clothing/webbing/holster/machete,
		/obj/item/chems/food/liquidfood,
		// /obj/item/chems/food/liquidprotein, // does not exist, no real interest in porting
		/obj/item/cataloguer)
	if(prob(50))
		. += /obj/item/backpack
	else
		. += /obj/item/backpack/satchel/grey

/obj/structure/closet/secure_closet/guncabinet/phase
	name = "explorer weapon cabinet"
	req_access = list(list(access_explorer),list(access_brig))

/obj/structure/closet/secure_closet/guncabinet/phase/WillContain()
	return list(
		/obj/item/gun/energy/gun/small/reloadable = 2,
		/obj/item/cell/gun = 2,
		/obj/item/clothing/permit/gun/planetside
	)

/obj/structure/closet/secure_closet/guncabinet/phase/mining
	name = "mining weapon cabinet"
	req_access = list(list(access_mining),list(access_brig))

/obj/structure/closet/secure_closet/guncabinet/phase/mining/WillContain()
	return list(
		/obj/item/gun/energy/gun/small/reloadable = 2,
		/obj/item/cell/gun = 2,
		/obj/item/clothing/permit/gun/planetside
	)

/obj/structure/closet/secure_closet/anesthetics
	name = "anesthetics closet"
	desc = "Used to knock people out."
	closet_appearance = /decl/closet_appearance/secure_closet/medical/alt
	req_access = list(access_surgery)

/obj/structure/closet/secure_closet/medical2/WillContain()
	return list(
		/obj/item/tank/anesthetic = 3,
		/obj/item/clothing/mask/breath/medical = 3
	)

/obj/structure/closet/secure_closet/medical_wall/anesthetics
	name = "anesthetics wall closet"
	desc = "Used to knock people out."
	req_access = list(access_surgery)

/obj/structure/closet/secure_closet/medical_wall/anesthetics/WillContain()
	return list(
		/obj/item/tank/anesthetic = 3,
		/obj/item/clothing/mask/breath/medical = 3
	)

/obj/structure/closet/secure_closet/medical_wall/anesthetics/robotics
	name = "robotics anesthetics wall closet"
	desc = "Used to knock people out... but in the Robotics lab."
	req_access = list(access_robotics)

/obj/structure/closet/wardrobe/captain
	name = "\improper Facility Director's wardrobe"
	closet_appearance = /decl/closet_appearance/cabinet

/obj/structure/closet/wardrobe/captain/WillContain()
	return list(
		/obj/item/clothing/glasses/sunglasses,
		/obj/item/clothing/glasses/sunglasses/prescription,
		/obj/item/clothing/head/caphat,
		/obj/item/clothing/head/caphat/cap,
		/obj/item/clothing/head/caphat/formal,
		// /obj/item/clothing/head/beret/centcom/captain,
		/obj/item/clothing/shirt/tunic/captain,
		/obj/item/clothing/suit/jacket/captain,
		// /obj/item/clothing/suit/parade_coat,
		// /obj/item/clothing/suit/parade_coat/fem,
		/obj/item/clothing/suit/jacket/winter/captain,
		/obj/item/clothing/jumpsuit/captain,
		// /obj/item/clothing/jumpsuit/captain/skirt_pleated,
		/obj/item/clothing/dress/cap,
		/obj/item/clothing/jumpsuit/captainformal,
		/obj/item/clothing/under/gimmick/rank/captain/suit,
		// /obj/item/clothing/under/gimmick/rank/captain/suit/skirt,
		// /obj/item/clothing/under/bodysuit/bodysuitcommand,
		/obj/item/clothing/gloves/captain,
		/obj/item/clothing/shoes/color/brown,
		/obj/item/clothing/shoes/winterboots/command,
		/obj/item/backpack/satchel/cap,
		/obj/item/backpack/captain
	)

//Pathfinder
/obj/structure/closet/secure_closet/pathfinder
	name = "pathfinder locker"
	closet_appearance = /decl/closet_appearance/secure_closet/expedition/pathfinder
	req_access = list(access_gateway)

/obj/structure/closet/secure_closet/pathfinder/WillContain()
	. = list(
		/obj/item/clothing/under/explorer,
		/obj/item/clothing/suit/toggle/explorer,
		/obj/item/clothing/mask/gas/explorer,
		/obj/item/clothing/shoes/winterboots/explorer,
		/obj/item/clothing/gloves/black,
		// /obj/item/radio/headset/pathfinder,
		// /obj/item/radio/headset/pathfinder/alt,
		// /obj/item/clothing/armor_attachment/helmetcamera/exploration,
		// /obj/item/clothing/armor_attachment/helmetcamera/exploration/body,
		/obj/item/flashlight,
		/obj/item/gps/explorer,
		/obj/item/belt/explorer,
		/obj/item/box/flares,
		// /obj/item/box/explorerkeys,
		/obj/item/geiger,
		/obj/item/cell/device,
		/obj/item/radio,
		/obj/item/stack/flag = 3,
		// /obj/item/box/survival_knife,
		/obj/item/tool/machete/deluxe,
		// /obj/item/gun/energy/frontier/locked/carbine,
		// /obj/item/gun/ballistic/ntles/pathfinder,
		// /obj/item/ammo_magazine/m57x28mm/ntles,
		// /obj/item/ammo_magazine/m57x28mm/ntles,
		/obj/item/clothing/webbing/holster/machete,
		/obj/item/clothing/webbing/holster/thigh,
		/obj/item/chems/food/liquidfood,
		// /obj/item/chems/food/liquidfood/protein,
		/obj/item/disk/survey,
		/obj/item/cataloguer
	)
	if(prob(50))
		. += /obj/item/backpack
	else
		. += /obj/item/backpack/satchel/grey