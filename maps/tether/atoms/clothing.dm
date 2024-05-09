/obj/item/clothing/head/helmet/tactical/pilot
	name = "pilot helmet"
	desc = "A helmet commonly worn by shuttle and aircraft pilots."

/obj/item/clothing/glasses/goggles
	name = "goggles"
	desc = "Just some plain old goggles."
	icon = 'maps/tether/icons/obj/clothing/plain_goggles.dmi'
	body_parts_covered = SLOT_EYES
	item_flags = ITEM_FLAG_AIRTIGHT | ITEM_FLAG_NO_CONTAMINATION

/obj/item/clothing/under/bathrobe
	name = "bathrobe"
	desc = "A fluffy robe to keep you from showing off to the world."
	icon = 'maps/tether/icons/obj/clothing/under/bathrobe.dmi'

/obj/item/clothing/under/explorer
	name = "explorer's jumpsuit"
	desc = "A green uniform for operating in hazardous environments."
	icon = 'maps/tether/icons/obj/clothing/under/explorer.dmi'

/obj/item/clothing/mask/gas/explorer
	name = "explorer gas mask"
	desc = "A military-grade gas mask that can be connected to an air supply."
	icon = 'maps/tether/icons/obj/clothing/masks/gas_explorer.dmi'
	siemens_coefficient = 0.9

//Hazardous Softsuits
/obj/item/clothing/suit/toggle/explorer
	name = "explorer suit"
	desc = "An armoured suit for exploring harsh environments."
	icon = 'maps/tether/icons/obj/clothing/suits/explorer.dmi'
	item_flags = ITEM_FLAG_THICKMATERIAL
	body_parts_covered = SLOT_UPPER_BODY|SLOT_LOWER_BODY|SLOT_LEGS|SLOT_ARMS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	cold_protection = SLOT_UPPER_BODY|SLOT_LOWER_BODY|SLOT_LEGS|SLOT_ARMS
	hood = /obj/item/clothing/head/explorerhood
	siemens_coefficient = 0.9
	armor = list(ARMOR_MELEE = ARMOR_MELEE_RESISTANT, ARMOR_BULLET = ARMOR_BALLISTIC_SMALL, ARMOR_LASER = ARMOR_LASER_SMALL, ARMOR_ENERGY = ARMOR_ENERGY_SMALL, ARMOR_BOMB = ARMOR_BOMB_PADDED, ARMOR_BIO = ARMOR_BIO_STRONG, ARMOR_RAD = ARMOR_RAD_RESISTANT) // Inferior to sec vests in bullet/laser but better for environmental protection.
	allowed = list(
		/obj/item/flashlight, /obj/item/gun, /obj/item/ammo_magazine,
		/obj/item/knife, /obj/item/tool/machete, /obj/item/tank,
		/obj/item/radio, /obj/item/tool/pickaxe,  /obj/item/tool/shovel, /obj/item/gun/projectile/flare
	)

/obj/item/clothing/head/explorerhood
	name = "explorer hood"
	desc = "An armoured hood for exploring harsh environments."
	icon = 'maps/tether/icons/obj/clothing/suits/explorer_hood.dmi'
	item_flags = ITEM_FLAG_THICKMATERIAL
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.9
	armor = list(ARMOR_MELEE = ARMOR_MELEE_RESISTANT, ARMOR_BULLET = ARMOR_BALLISTIC_SMALL, ARMOR_LASER = ARMOR_LASER_SMALL, ARMOR_ENERGY = ARMOR_ENERGY_SMALL, ARMOR_BOMB = ARMOR_BOMB_PADDED, ARMOR_BIO = ARMOR_BIO_STRONG, ARMOR_RAD = ARMOR_RAD_RESISTANT)

/obj/item/clothing/shoes/winterboots/security
	name = "security winter boots"
	desc = "A pair of winter boots. These ones are lined with grey fur, and coloured an angry red."
	icon = 'maps/tether/icons/obj/clothing/shoes/winterboots_sec.dmi'
	armor = list(ARMOR_MELEE = ARMOR_MELEE_RESISTANT, ARMOR_BULLET = ARMOR_BALLISTIC_MINOR, ARMOR_LASER = ARMOR_LASER_MINOR, ARMOR_ENERGY = 15, ARMOR_BOMB = 20, ARMOR_BIO = 0, ARMOR_RAD = 0)

/obj/item/clothing/shoes/winterboots/science
	name = "science winter boots"
	desc = "A pair of winter boots. These ones are lined with white fur, and are trimmed with scientific advancement!"
	icon = 'maps/tether/icons/obj/clothing/shoes/winterboots_sci.dmi'

/obj/item/clothing/shoes/winterboots/command
	name = "\improper Facility Director winter boots"
	desc = "A pair of winter boots. They're lined with dark fur, and trimmed in the colours of superiority."
	icon = 'maps/tether/icons/obj/clothing/shoes/winterboots_cap.dmi'

/obj/item/clothing/shoes/winterboots/engineering
	name = "engineering winter boots"
	desc = "A pair of winter boots. These ones are lined with orange fur and are trimmed in the colours of disaster."
	icon = 'maps/tether/icons/obj/clothing/shoes/winterboots_eng.dmi'

/obj/item/clothing/shoes/winterboots/atmos
	name = "atmospherics winter boots"
	desc = "A pair of winter boots. These ones are lined with beige fur, and are trimmed in breath taking colours."
	icon = 'maps/tether/icons/obj/clothing/shoes/winterboots_atmos.dmi'

/obj/item/clothing/shoes/winterboots/medical
	name = "medical winter boots"
	desc = "A pair of winter boots. These ones are lined with white fur, and are trimmed like 30cc of dexalin."
	icon = 'maps/tether/icons/obj/clothing/shoes/winterboots_med.dmi'

/obj/item/clothing/shoes/winterboots/mining
	name = "mining winter boots"
	desc = "A pair of winter boots. These ones are lined with greyish fur, and their trim is golden!"
	icon = 'maps/tether/icons/obj/clothing/shoes/winterboots_mining.dmi'

/obj/item/clothing/shoes/winterboots/supply
	name = "supply winter boots"
	desc = "A pair of winter boots. These ones are lined with the galactic cargonia colors!"
	icon = 'maps/tether/icons/obj/clothing/shoes/winterboots_sup.dmi'

/obj/item/clothing/shoes/winterboots/hydro
	name = "hydroponics winter boots"
	desc = "A pair of winter boots. These ones are lined with brown fur, and their trim is ambrosia green."
	icon = 'maps/tether/icons/obj/clothing/shoes/winterboots_hydro.dmi'

/obj/item/clothing/shoes/winterboots/explorer
	name = "explorer winter boots"
	desc = "Steel-toed winter boots for mining or exploration in hazardous environments. Very good at keeping toes warm and uncrushed."
	icon = 'maps/tether/icons/obj/clothing/shoes/explorer.dmi'
	armor = list(ARMOR_MELEE = 30, ARMOR_BULLET = 10, ARMOR_LASER = 10, ARMOR_ENERGY = 15, ARMOR_BOMB = 20, ARMOR_BIO = 0, ARMOR_RAD = 0)

// voidsuits (nice to have)
//Captain (cit addition, the idea is to replace the "Facility Director armor" which doesnt function like a voidsuit
/obj/item/clothing/head/helmet/space/void/captain
	name = "\improper Facility Director voidsuit helmet"
	desc = "A shiny blue helmet, complete with far-too-big golden visor. It probably doesn't protects from bright flashes."
	icon = 'maps/tether/icons/obj/clothing/suits/void_cap_helmet.dmi'
	armor = list(ARMOR_MELEE = ARMOR_MELEE_VERY_HIGH, ARMOR_BULLET = ARMOR_BALLISTIC_PISTOL, ARMOR_LASER = ARMOR_LASER_MAJOR, ARMOR_ENERGY = ARMOR_ENERGY_SMALL, ARMOR_BOMB = ARMOR_BOMB_RESISTANT, ARMOR_BIO = ARMOR_BIO_SHIELDED, ARMOR_RAD = ARMOR_RAD_RESISTANT)

/obj/item/clothing/suit/space/void/captain
	name = "\improper Facility Director voidsuit"
	desc = "A sleek, blue and gold suit, fitted with spaceproofing and protective inserts. Fits like an oversized, shiny glove."
	icon = 'maps/tether/icons/obj/clothing/suits/void_cap.dmi'
	armor = list(ARMOR_MELEE = ARMOR_MELEE_VERY_HIGH, ARMOR_BULLET = ARMOR_BALLISTIC_PISTOL, ARMOR_LASER = ARMOR_LASER_MAJOR, ARMOR_ENERGY = ARMOR_ENERGY_SMALL, ARMOR_BOMB = ARMOR_BOMB_RESISTANT, ARMOR_BIO = ARMOR_BIO_SHIELDED, ARMOR_RAD = ARMOR_RAD_RESISTANT)
	allowed = list(/obj/item/flashlight,/obj/item/tank,/obj/item/suit_cooling_unit,/obj/item/gun)

/obj/item/clothing/suit/space/void/captain/Initialize()
	. = ..()
	LAZYSET(slowdown_per_slot, slot_wear_suit_str, 1.5)

//Head of Security - update to the snowflake suit
/obj/item/clothing/head/helmet/space/void/headofsecurity
	desc = "A customized security voidsuit helmet. Has additional composite armor."
	name = "head of security protosuit helmet"
	icon = 'maps/tether/icons/obj/clothing/suits/void_hos_helmet.dmi'
	armor = list(ARMOR_MELEE = 60, ARMOR_BULLET = 35, ARMOR_LASER = 35,ARMOR_ENERGY = 15, ARMOR_BOMB = 50, ARMOR_BIO = 100, ARMOR_RAD = 10)

/obj/item/clothing/suit/space/void/headofsecurity
	name = "head of security protosuit"
	desc = "A customized security voidsuit. Has additional composite armor."
	icon = 'maps/tether/icons/obj/clothing/suits/void_hos.dmi'
	armor = list(ARMOR_MELEE = 60, ARMOR_BULLET = 35, ARMOR_LASER = 35,ARMOR_ENERGY = 15, ARMOR_BOMB = 50, ARMOR_BIO = 100, ARMOR_RAD = 50)
	allowed = list(/obj/item/flashlight,/obj/item/tank,/obj/item/suit_cooling_unit,/obj/item/gun)

/obj/item/clothing/suit/space/void/headofsecurity/Initialize()
	. = ..()
	LAZYSET(slowdown_per_slot, slot_wear_suit_str, 1.5)

//Exploration
/obj/item/clothing/head/helmet/space/void/exploration
	name = "exploration voidsuit helmet"
	desc = "A radiation-resistant helmet made especially for exploring unknown planetary environments."
	icon = 'maps/tether/icons/obj/clothing/suits/void_explorer_helmet.dmi'
	armor = list(ARMOR_MELEE = 40, ARMOR_BULLET = 15, ARMOR_LASER = 25,ARMOR_ENERGY = 35, ARMOR_BOMB = 30, ARMOR_BIO = 100, ARMOR_RAD = 70)

/obj/item/clothing/suit/space/void/exploration
	name = "exploration voidsuit"
	desc = "A lightweight, radiation-resistant voidsuit, featuring the Explorer emblem on its chest plate. Designed for exploring unknown planetary environments."
	icon = 'maps/tether/icons/obj/clothing/suits/void_explorer.dmi'
	armor = list(ARMOR_MELEE = 40, ARMOR_BULLET = 15, ARMOR_LASER = 25,ARMOR_ENERGY = 35, ARMOR_BOMB = 30, ARMOR_BIO = 100, ARMOR_RAD = 70)
	allowed = list(
		/obj/item/flashlight, /obj/item/tank, /obj/item/suit_cooling_unit,
		/obj/item/stack/flag, /obj/item/scanner/health, /obj/item/gps,
		/obj/item/radio/beacon, /obj/item/tool/pickaxe,  /obj/item/tool/shovel, /obj/item/ammo_magazine, /obj/item/gun
	)

//Medical Biohazard Voidsuit
/obj/item/clothing/head/helmet/space/void/medical/bio
	name = "biohazard voidsuit helmet"
	desc = "A special helmet that protects against hazardous environments. Has minor radiation shielding."
	icon = 'maps/tether/icons/obj/clothing/suits/void_med_bio_helmet.dmi'
	armor = list(ARMOR_MELEE = 45, ARMOR_BULLET = 5, ARMOR_LASER = 20, ARMOR_ENERGY = 5, ARMOR_BOMB = 15, ARMOR_BIO = 100, ARMOR_RAD = 75)

/obj/item/clothing/suit/space/void/medical/bio
	name = "biohazard voidsuit"
	desc = "A special suit that protects against hazardous, environments. It feels heavier than the standard suit with extra protection around the joints."
	icon = 'maps/tether/icons/obj/clothing/suits/void_med_bio.dmi'
	armor = list(ARMOR_MELEE = 45, ARMOR_BULLET = 5, ARMOR_LASER = 20, ARMOR_ENERGY = 5, ARMOR_BOMB = 15, ARMOR_BIO = 100, ARMOR_RAD = 75)

//Medical EMT Voidsuit
/obj/item/clothing/head/helmet/space/void/medical/emt
	name = "emergency medical response voidsuit helmet"
	icon = 'maps/tether/icons/obj/clothing/suits/void_emt_helmet.dmi'

/obj/item/clothing/suit/space/void/medical/emt
	name = "emergency medical response voidsuit"
	icon = 'maps/tether/icons/obj/clothing/suits/void_emt.dmi'

/obj/item/belt/explorer
	name = "pathfinder's bandolier"
	desc = "A versatile bandolier fitted with eight pouches that can hold a wide variety of items such as tools, small melee weapons, batteries, ammunition, and more; ideal for any pathfinder who has too much stuff and not enough pockets."
	icon = 'icons/clothing/belt/swatbelt.dmi'
	use_alt_layer = TRUE
	storage = /datum/storage/belt/explorer

/datum/storage/belt/explorer
	storage_slots = 7
	max_storage_space = ITEM_SIZE_NORMAL * 7
	can_hold = list(
		/obj/item/grenade,
		/obj/item/crowbar,
		/obj/item/screwdriver,
		/obj/item/weldingtool,
		/obj/item/wirecutters,
		/obj/item/wrench,
		/obj/item/tool/pickaxe,
		/obj/item/tool/shovel,
		/obj/item/multitool,
		/obj/item/stack/cable_coil,
		/obj/item/t_scanner,
		/obj/item/scanner/gas,
		/obj/item/flashlight,
		/obj/item/cell/device,
		/obj/item/knife,
		/obj/item/tool/machete,
		/obj/item/energy_blade/sword,
		/obj/item/shield/energy,
		/obj/item/ammo_casing,
		/obj/item/ammo_magazine,
		/obj/item/box/ammo/beanbags,
		/obj/item/box/ammo/shotgunammo,
		/obj/item/box/ammo/shotgunshells,
		/obj/item/scanner/health,
		/obj/item/robotanalyzer,
		/obj/item/chems/glass/beaker,
		/obj/item/chems/glass/bottle,
		/obj/item/chems/syringe,
		/obj/item/chems/hypospray,
		/obj/item/pill_bottle,
		/obj/item/stack/medical,
		/obj/item/stack/flag,
		/obj/item/flashlight,
		/obj/item/chems/spray/extinguisher/mini,
		// /obj/item/quickdraw/syringe_case,
		/obj/item/photo,
		/obj/item/camera_film,
		/obj/item/camera,
		/obj/item/taperecorder,
		/obj/item/stack/tape_roll,
		/obj/item/geiger,
		/obj/item/gps,
		/obj/item/ano_scanner
		)