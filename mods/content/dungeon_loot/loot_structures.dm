// Has large amounts of possible items, most of which may or may not be useful.
/obj/structure/loot_pile/maint/junk
	name = "pile of junk"
	desc = "Lots of junk lying around.  They say one man's trash is another man's treasure."
	icon_states_to_use = list("junk_pile1", "junk_pile2", "junk_pile3", "junk_pile4", "junk_pile5")

	common_loot = list(
		/obj/item/flashlight/flare,
		/obj/item/flashlight/flare/glowstick,
		/obj/item/flashlight/flare/glowstick/blue,
		/obj/item/flashlight/flare/glowstick/orange,
		/obj/item/flashlight/flare/glowstick/red,
		/obj/item/flashlight/flare/glowstick/yellow,
		/obj/item/flashlight/pen,
		/obj/item/cell,
		/obj/item/cell/device,
		/obj/item/clothing/mask/gas,
		/obj/item/clothing/mask/gas/half,
		/obj/item/clothing/mask/breath,
		/obj/item/chems/glass/rag,
		/obj/item/chems/food/liquidfood,
		/obj/item/storage/secure/briefcase,
		/obj/item/storage/briefcase,
		/obj/item/storage/backpack,
		/obj/item/storage/backpack/satchel,
		/obj/item/storage/backpack/dufflebag,
		/obj/item/storage/box,
		/obj/item/storage/wallet,
		/obj/item/clothing/shoes/galoshes,
		/obj/item/clothing/shoes/color/black,
		/obj/item/clothing/shoes/dress,
		/obj/item/clothing/shoes/dress/white,
		/obj/item/clothing/gloves/thick/botany,
		/obj/item/clothing/gloves/latex,
		/obj/item/clothing/gloves/color/white,
		/obj/item/clothing/gloves/rainbow,
		/obj/item/clothing/gloves/insulated/cheap,
		/obj/item/clothing/glasses/sunglasses,
		/obj/item/clothing/glasses/meson,
		/obj/item/clothing/glasses/meson/prescription,
		/obj/item/clothing/glasses/welding,
		/obj/item/clothing/head/bio_hood/general,
		/obj/item/clothing/head/hardhat,
		/obj/item/clothing/head/hardhat/red,
		/obj/item/clothing/head/ushanka,
		/obj/item/clothing/head/welding,
		/obj/item/clothing/suit/storage/hazardvest,
		/obj/item/clothing/suit/space/emergency,
		/obj/item/clothing/suit/storage/toggle/bomber,
		/obj/item/clothing/suit/bio_suit/general,
		/obj/item/clothing/suit/storage/toggle/hoodie/black,
		/*
		/obj/item/clothing/suit/storage/toggle/hoodie/blue,
		/obj/item/clothing/suit/storage/toggle/hoodie/red,
		/obj/item/clothing/suit/storage/toggle/hoodie/yellow,
		*/
		/obj/item/clothing/suit/storage/toggle/brown_jacket,
		/obj/item/clothing/suit/storage/leather_jacket,
		/obj/item/clothing/suit/apron,
		/obj/item/clothing/under/color/grey,
		/obj/item/clothing/under/syndicate/tacticool,
		/obj/item/clothing/pants/casual/camo,
		/obj/item/clothing/under/harness,
		/obj/item/clothing/accessory/storage,
		/obj/item/cash/c1,
		/obj/item/cash/c10,
		/obj/item/cash/c20,
		/obj/item/cash/c50,
		/obj/item/frame/camera/kit,
		/obj/item/caution,
		/obj/item/caution/cone,
		/obj/item/card/emag_broken,
		/obj/item/camera,
		/obj/item/modular_computer/pda,
		/obj/item/radio/headset,
		/obj/item/paicard,
	)

	uncommon_loot = list(
		/obj/item/clothing/shoes/syndigaloshes,
		/obj/item/clothing/gloves/insulated,
		/obj/item/clothing/under/tactical,
		/obj/item/beartrap,
		/obj/item/clothing/accessory/badge/press,
		/obj/item/knife/combat,
		/obj/item/knife/folding/combat/switchblade,
	)

	rare_loot = list(
		/obj/item/clothing/suit/armor/vest/heavy,
		/obj/item/clothing/shoes/jackboots/swat/combat,
	)

// Contains mostly useless garbage.
/obj/structure/loot_pile/maint/trash
	name = "pile of trash"
	desc = "Lots of garbage in one place.  Might be able to find something if you're in the mood for dumpster diving."
	icon_states_to_use = list("trash_pile1", "trash_pile2")

	common_loot = list(
		/obj/item/trash/candle,
		/obj/item/trash/candy,
		/obj/item/trash/candy/proteinbar,
		/obj/item/trash/cigbutt/spitgum,
		/obj/item/trash/cheesie,
		/obj/item/trash/chips,
		/obj/item/trash/stick,
		/obj/item/trash/liquidfood,
		/obj/item/trash/pistachios,
		/obj/item/trash/plate,
		/obj/item/trash/popcorn,
		/obj/item/trash/raisins,
		/obj/item/trash/semki,
		/obj/item/trash/snack_bowl,
		/obj/item/trash/sosjerky,
		/obj/item/trash/syndi_cakes,
		/obj/item/trash/tastybread,
		/obj/item/chems/drinks/sillycup,
		/obj/item/trash/tray,
		/obj/item/trash/driedfish,
		/obj/item/trash/waffles,
		/obj/item/trash/beef,
		/obj/item/trash/beans,
		/obj/item/trash/tomato,
		/obj/item/trash/spinach,
		/obj/item/chems/food/spider,
		/obj/item/chems/food/mysterysoup,
		/obj/item/chems/food/old/hotdog,
		/obj/item/chems/food/old/pizza,
		/obj/item/ammo_casing,
		/obj/item/stack/material/rods/ten,
		/obj/item/stack/material/sheet/mapped/steel/five,
		/obj/item/stack/material/cardstock/mapped/cardboard/five,
		/obj/item/poster,
		/obj/item/newspaper,
		/obj/item/paper/crumpled,
		/obj/item/paper/crumpled/bloody,
	)

	uncommon_loot = list(
		/obj/item/chems/syringe/steroid,
		/obj/item/storage/pill_bottle/zoom,
		/obj/item/storage/pill_bottle/happy,
		/obj/item/storage/pill_bottle/painkillers,
	)

// Contains loads of different types of boxes, which may have items inside!
/obj/structure/loot_pile/maint/boxfort
	name = "pile of boxes"
	desc = "A large pile of boxes sits here."
	density = TRUE
	icon_states_to_use = list("boxfort")

	common_loot = list(
		/obj/item/storage/box,
		/obj/item/storage/box/beakers,
		/obj/item/storage/box/botanydisk,
		/obj/item/storage/box/cups,
		/obj/item/storage/box/botanydisk,
		/obj/item/storage/box/donkpockets,
		/obj/item/storage/box/donut,
		/obj/item/storage/box/donut/empty,
		/obj/item/storage/box/evidence,
		/obj/item/storage/box/lights/mixed,
		/obj/item/storage/box/lights/tubes,
		/obj/item/storage/box/lights/bulbs,
		/obj/item/storage/box/autoinjectors,
		/obj/item/storage/box/masks,
		/obj/item/storage/box/ids,
		/obj/item/storage/box/mousetraps,
		/obj/item/storage/box/syringes,
		/obj/item/storage/box/survival,
		/obj/item/storage/box/gloves,
		/obj/item/storage/box/PDAs,
	)

	uncommon_loot = list(
		/obj/item/storage/box/sinpockets,
		/obj/item/storage/box/ammo/practiceshells,
		/obj/item/storage/box/ammo/blanks,
		/obj/item/storage/box/smokes,
		/obj/item/storage/box/metalfoam,
		/obj/item/storage/box/handcuffs,
		// TODO: Replace with box of Security NIFsofts? Or a box of USB sticks with programs on them?
		// /obj/item/storage/box/seccarts
	)

	rare_loot = list(
		/obj/item/storage/box/flashbangs,
		/obj/item/storage/box/empslite,
		/obj/item/storage/box/ammo/flashshells,
		/obj/item/storage/box/ammo/stunshells,
		/obj/item/storage/box/teargas,
	)

// One of the more useful maint piles, contains electrical components.
/obj/structure/loot_pile/maint/technical
	name = "broken machine"
	desc = "A destroyed machine with unknown purpose, and doesn't look like it can be fixed.  It might still have some functional components?"
	density = TRUE
	icon_states_to_use = list("technical_pile1", "technical_pile2", "technical_pile3")

	common_loot = list(
		/obj/item/stock_parts/network_receiver,
		/obj/item/stock_parts/radio/receiver,
		/obj/item/stock_parts/radio/transmitter,
		/obj/item/stock_parts/power/apc,
		/obj/item/stock_parts/power/terminal,
		/obj/item/stock_parts/power/battery,
		/obj/item/stock_parts/item_holder/card_reader,
		/obj/item/stock_parts/item_holder/disk_reader,
		/obj/item/stock_parts/console_screen,
		/obj/item/stock_parts/keyboard,
		/obj/item/stock_parts/capacitor,
		/obj/item/stock_parts/capacitor/adv,
		/obj/item/stock_parts/capacitor/super,
		/obj/item/stock_parts/manipulator,
		/obj/item/stock_parts/manipulator/nano,
		/obj/item/stock_parts/manipulator/pico,
		/obj/item/stock_parts/matter_bin,
		/obj/item/stock_parts/matter_bin/adv,
		/obj/item/stock_parts/matter_bin/super,
		/obj/item/stock_parts/scanning_module,
		/obj/item/stock_parts/scanning_module/adv,
		/obj/item/stock_parts/scanning_module/phasic,
		/obj/item/stock_parts/subspace/amplifier,
		/obj/item/stock_parts/subspace/analyzer,
		/obj/item/stock_parts/subspace/ansible,
		/obj/item/stock_parts/subspace/crystal,
		/obj/item/stock_parts/subspace/filter,
		/obj/item/stock_parts/subspace/transmitter,
		/obj/item/stock_parts/subspace/treatment,
		/obj/item/borg/upgrade/restart,
		/obj/item/cell,
		/obj/item/cell/high,
		/obj/item/cell/device,
		/obj/item/stock_parts/circuitboard/broken,
		/obj/item/stock_parts/circuitboard/arcade,
		/obj/item/stock_parts/circuitboard/autolathe,
		/obj/item/stock_parts/circuitboard/atmos_alert,
		/obj/item/stock_parts/circuitboard/air_alarm,
		/obj/item/stock_parts/circuitboard/fax_machine,
		/obj/item/stock_parts/circuitboard/jukebox,
		/obj/item/stock_parts/circuitboard/batteryrack,
		/obj/item/stock_parts/circuitboard/message_monitor,
		/obj/item/stock_parts/smes_coil,
		// todo: add a useful engineering- or machinery-related nifsoft disk here
		// also add some decent modular computer components
		/obj/item/scanner/gas,
		/obj/item/scanner/health,
		/obj/item/robotanalyzer,
		/obj/item/lightreplacer,
		/obj/item/radio,
		/obj/item/hailer,
		/obj/item/gps,
		/obj/item/geiger,
		/obj/item/scanner/spectrometer,
		/obj/item/wrench,
		/obj/item/screwdriver,
		/obj/item/wirecutters,
		/obj/item/scanner/mining,
		/obj/item/multitool,
		/obj/item/robot_parts/robot_component/binary_communication_device,
		/obj/item/robot_parts/robot_component/armour,
		/obj/item/robot_parts/robot_component/actuator,
		/obj/item/robot_parts/robot_component/camera,
		/obj/item/robot_parts/robot_component/diagnosis_unit,
		/obj/item/robot_parts/robot_component/radio,
	)

	uncommon_loot = list(
		/obj/item/cell/super,
		/obj/item/cell/gun,
		/obj/item/aiModule/reset,
		/obj/item/stock_parts/smes_coil/super_capacity,
		/obj/item/stock_parts/smes_coil/super_io,
		// todo: add some decent non-contraband NIFsoft disks here
		/obj/item/disk/integrated_circuit/upgrade/advanced,
		/obj/item/camera/tvcamera,
		/obj/item/universal_translator,
		/obj/item/aicard,
		/obj/item/borg/upgrade/jetpack,
		/obj/item/borg/upgrade/vtec,
		/obj/item/borg/upgrade/weaponcooler,
		/obj/item/rig_module/device/drill,
		/obj/item/rig_module/mounted/plasmacutter,
		/obj/item/rig_module/device/healthscanner,
		/obj/item/rig_module/device/orescanner,
		/obj/item/rig_module/device/anomaly_scanner,
		/obj/item/rig_module/datajack,
		/obj/item/rig_module/vision/medhud,
		/obj/item/rig_module/vision/meson,
		/obj/item/rig_module/vision/sechud,
	)

	rare_loot = list(
		/obj/item/cell/hyper,
		/obj/item/aiModule/freeform,
		/obj/item/aiModule/asimov,
		/obj/item/aiModule/paladin,
		/obj/item/aiModule/safeguard,
	)


// Surface base type
/obj/structure/loot_pile/surface
	// Surface loot piles are considerably harder and more dangerous to reach, so you're more likely to get rare things.
	chance_uncommon = 20
	chance_rare = 5
	loot_depletion = TRUE
	loot_left = 5 // This is to prevent people from asking the whole station to go down to some alien ruin to get massive amounts of phat lewt.

// Base type for alien piles.
/obj/structure/loot_pile/surface/alien
	name = "alien pod"
	desc = "A pod which looks bigger on the inside. Something quite shiny might be inside?"
	icon_state = "alien_pile1"

/obj/structure/loot_pile/surface/alien
	common_loot = list()

// May contain alien tools.
/obj/structure/loot_pile/surface/alien/engineering
	uncommon_loot = list()
	rare_loot = list()

// May contain alien surgery equipment or powerful medication.
/obj/structure/loot_pile/surface/alien/medical
	uncommon_loot = list()
	rare_loot = list()

// May contain powercells or alien weaponry.
/obj/structure/loot_pile/surface/alien/security
	uncommon_loot = list()
	rare_loot = list()

// The pile found at the very end, and as such has the best loot.
/obj/structure/loot_pile/surface/alien/end
	chance_uncommon = 30
	chance_rare = 10

	common_loot = list()
	uncommon_loot = list()

// Subtype for mecha and mecha accessories. These might not always be on the surface.
/obj/structure/loot_pile/mecha
	name = "pod wreckage"
	desc = "The ruins of some unfortunate pod. Perhaps something is salvageable."
	icon = 'icons/obj/mech_wrecks.dmi'
	icon_state = "engineering_pod-broken"
	density = TRUE
	anchored = FALSE // In case a dead mecha-mob dies in a bad spot.

	chance_uncommon = 20
	chance_rare = 10

	loot_depletion = TRUE
	loot_left = 9

	common_loot = list()

	uncommon_loot = list()

	rare_loot = list()

//Stuff you may find attached to a ripley.
/obj/structure/loot_pile/mecha/ripley
	name = "ripley wreckage"
	desc = "The ruins of some unfortunate ripley. Perhaps something is salvageable."
	icon_state = "ripley-broken"

	common_loot = list()

	uncommon_loot = list()

	rare_loot = list()

/obj/structure/loot_pile/mecha/ripley/firefighter
	icon_state = "firefighter-broken"

/obj/structure/loot_pile/mecha/ripley/random_sprite
	icon_states_to_use = list("ripley-broken", "firefighter-broken", "ripley-broken-old")

//Death-Ripley, same common, but more combat-exosuit-based
/obj/structure/loot_pile/mecha/deathripley
	name = "strange ripley wreckage"
	icon_state = "deathripley-broken"

	common_loot = list()

	uncommon_loot = list()

	rare_loot = list()

/obj/structure/loot_pile/mecha/odysseus
	name = "odysseus wreckage"
	desc = "The ruins of some unfortunate odysseus. Perhaps something is salvageable."
	icon_state = "odysseus-broken"

	common_loot = list()

	uncommon_loot = list()

	rare_loot = list()

/obj/structure/loot_pile/mecha/odysseus/murdysseus
	icon_state = "murdysseus-broken"

/obj/structure/loot_pile/mecha/hoverpod
	name = "hoverpod wreckage"
	desc = "The ruins of some unfortunate hoverpod. Perhaps something is salvageable."
	icon_state = "engineering_pod"

/obj/structure/loot_pile/mecha/gygax
	name = "gygax wreckage"
	desc = "The ruins of some unfortunate gygax. Perhaps something is salvageable."
	icon_state = "gygax-broken"

	common_loot = list()

	uncommon_loot = list()

	rare_loot = list()

/obj/structure/loot_pile/mecha/gygax/dark
	icon_state = "darkgygax-broken"

// Todo: Better loot.
/obj/structure/loot_pile/mecha/gygax/dark/adv
	icon_state = "darkgygax_adv-broken"
	icon_scale_x = 1.5
	icon_scale_y = 1.5
	pixel_y = 8

/obj/structure/loot_pile/mecha/gygax/medgax
	icon_state = "medgax-broken"

/obj/structure/loot_pile/mecha/durand
	name = "durand wreckage"
	desc = "The ruins of some unfortunate durand. Perhaps something is salvageable."
	icon_state = "durand-broken"

	common_loot = list()

	uncommon_loot = list()

	rare_loot = list()

/obj/structure/loot_pile/mecha/marauder
	name = "marauder wreckage"
	desc = "The ruins of some unfortunate marauder. Perhaps something is salvagable."
	icon_state = "marauder-broken"
	// Todo: Better loot.

/obj/structure/loot_pile/mecha/marauder/seraph
	name = "seraph wreckage"
	desc = "The ruins of some unfortunate seraph. Perhaps something is salvagable."
	icon_state = "seraph-broken"

/obj/structure/loot_pile/mecha/marauder/mauler
	name = "mauler wreckage"
	desc = "The ruins of some unfortunate mauler. Perhaps something is salvagable."
	icon_state = "mauler-broken"

/obj/structure/loot_pile/mecha/phazon
	name = "phazon wreckage"
	desc = "The ruins of some unfortunate phazon. Perhaps something is salvageable."
	icon_state = "phazon-broken"

	common_loot = list()

	uncommon_loot = list()

	rare_loot = list()

/obj/structure/loot_pile/surface/drone
	name = "drone wreckage"
	desc = "The ruins of some unfortunate drone. Perhaps something is salvageable."
	icon = 'icons/obj/mech_wrecks.dmi'
	icon_state = "drone_dead"

	common_loot = list()

	uncommon_loot = list()

	rare_loot = list()

// Contains old mediciation, most of it unidentified and has a good chance of being useless.
/obj/structure/loot_pile/surface/medicine_cabinet
	name = "abandoned medicine cabinet"
	desc = "An old cabinet, it might still have something of use inside."
	icon_state = "medicine_cabinet"
	density = FALSE
	chance_uncommon = 0
	chance_rare = 0

	common_loot = list()

// Like the above but has way better odds, in exchange for being in a place still inhabited (or was recently).
/obj/structure/loot_pile/surface/medicine_cabinet/fresh
	name = "medicine cabinet"
	desc = "A cabinet designed to hold medicine, it might still have something of use inside."
	icon_state = "medicine_cabinet"
	density = FALSE

	common_loot = list()
