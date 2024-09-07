// resleeving and transcore
/obj/item/book/fluff/resleeving
	fluff_text = "<em>todo: write resleeving guide</em>"
/obj/item/implanter/backup
/obj/item/implant/backup

/obj/machinery/transhuman
	abstract_type = /obj/machinery/transhuman
	construct_state = /decl/machine_construction/default/panel_closed
/obj/machinery/computer/transhuman
	abstract_type = /obj/machinery/computer/transhuman

/obj/machinery/computer/transhuman/designer
/obj/item/stock_parts/circuitboard/body_designer
	build_path = /obj/machinery/computer/transhuman/designer
	origin_tech = "{'biotech':2}"
/datum/fabricator_recipe/imprinter/circuit/body_designer
	path = /obj/item/stock_parts/circuitboard/body_designer

/obj/machinery/computer/transhuman/resleeving
/obj/item/stock_parts/circuitboard/resleeving_control
	build_path = /obj/machinery/computer/transhuman/resleeving
	origin_tech = "{'biotech':2}"
/datum/fabricator_recipe/imprinter/circuit/resleeving_control
	path = /obj/item/stock_parts/circuitboard/resleeving_control

/obj/machinery/transhuman/resleever
/obj/item/stock_parts/circuitboard/transhuman_resleever
	board_type = "machine"
	build_path = /obj/machinery/transhuman/resleever
	origin_tech = "{'biotech':2}"
/datum/fabricator_recipe/imprinter/circuit/transhuman_resleever
	path = /obj/item/stock_parts/circuitboard/transhuman_resleever

/obj/machinery/transhuman_clonepod
	construct_state = /decl/machine_construction/default/panel_closed
/obj/machinery/transhuman_clonepod/full
	base_type = /obj/machinery/transhuman_clonepod
/obj/item/stock_parts/circuitboard/transhuman_clonepod
	board_type = "machine"
	build_path = /obj/machinery/transhuman_clonepod
	origin_tech = "{'biotech':2}"
/datum/fabricator_recipe/imprinter/circuit/transhuman_clonepod
	path = /obj/item/stock_parts/circuitboard/transhuman_clonepod

/obj/machinery/transhuman/synthprinter
/obj/item/stock_parts/circuitboard/transhuman_synthprinter
	board_type = "machine"
	build_path = /obj/machinery/transhuman/synthprinter
	origin_tech = "{'biotech':2}"
/datum/fabricator_recipe/imprinter/circuit/transhuman_synthprinter
	path = /obj/item/stock_parts/circuitboard/transhuman_synthprinter

/obj/item/cmo_disk_holder
	material = /decl/material/solid/organic/paper //it's a manila envelope you tear open
/obj/item/chems/glass/bottle/biomass
/obj/item/box/backup_kit
// note: cryo is technically part of resleeving now
/obj/machinery/atmospherics/unary/cryo_cell
/obj/item/chems/glass/beaker/cryoxadone

// medical QOL
/obj/item/glasses_kit
	material = /decl/material/solid/organic/cardboard // it's basically a box.
/obj/item/bag/chemistry
/obj/item/pill_bottle/iron
/obj/item/pill_bottle/nutriment

// OBJECTS
/obj/item/baton/slime/loaded
/obj/item/radio/intercom/department/security
/obj/item/radio/intercom/locked/ai_private
/obj/item/bag/circuits/basic
/obj/item/box/firingpins
/obj/item/box/nifsofts_engineering
// todo: maybe readd trash/unajerky? we'd need lore first...
/obj/item/box/nifsofts_mining
/obj/item/box/nifsofts_security

// Toys
/obj/item/toy/eightball/conch
/obj/item/toy/plushie/teshari // todo: refluff to neo-avian
/obj/item/toy/stickhorse

/obj/item/universal_translator
	material = /decl/material/solid/organic/plastic

/obj/machinery/button/remote/emitter
/obj/machinery/camera/motion/security
/obj/machinery/camera/network/research_outpost
/obj/machinery/camera/network/thunder

/obj/machinery/cash_register
	construct_state = /decl/machine_construction/default/panel_closed
	base_type = /obj/machinery/cash_register
/obj/item/stock_parts/circuitboard/cash_register
	board_type = "machine"
	build_path = /obj/machinery/cash_register
	origin_tech = "{'programming':1}"
/datum/fabricator_recipe/imprinter/circuit/cash_register
	path = /obj/item/stock_parts/circuitboard/cash_register
/obj/machinery/cash_register/civilian

/obj/machinery/computer/cryopod
	base_type = /obj/machinery/computer/cryopod
/obj/machinery/computer/cryopod/dorms
/obj/machinery/computer/cryopod/gateway
/obj/machinery/computer/holodeck_control
	base_type = /obj/machinery/computer/holodeck_control
/obj/machinery/computer/holodeck_control/holodorm
/obj/machinery/computer/holodeck_control/holodorm/five
/obj/machinery/computer/holodeck_control/holodorm/one
/obj/machinery/computer/holodeck_control/holodorm/seven
/obj/machinery/computer/holodeck_control/holodorm/three
/obj/machinery/computer/holodeck_control/holosurgery


/obj/machinery/door/airlock/double/metal
/obj/machinery/door/airlock/double/metal/mait
/obj/machinery/door/airlock/silver
/obj/machinery/door/airlock/voidcraft
/obj/machinery/door/airlock/voidcraft/vertical
/obj/machinery/door/firedoor/border_only
/obj/machinery/door/firedoor/glass
/obj/machinery/door/firedoor/glass/hidden/steel
/obj/machinery/door/firedoor/multi_tile

/obj/machinery/gear_painter

// Our libraries are different
/obj/machinery/librarycomp
/obj/machinery/librarypubliccomp
/obj/machinery/libraryscanner
/obj/item/scanner/barcode

// Atmospherics
/obj/machinery/airlock_sensor/airlock_exterior
/obj/machinery/airlock_sensor/airlock_exterior/shuttle
/obj/machinery/airlock_sensor/airlock_interior
/obj/machinery/atmospherics/binary/algae_farm/filled
/obj/machinery/atmospherics/pipe/vent
/obj/machinery/atmospherics/pipe/vent/high_volume
/obj/machinery/atmospherics/unary/vent_pump/high_volume/wall_mounted
/obj/machinery/portable_atmospherics/powered/pump/huge/stationary/purge
/obj/machinery/portable_atmospherics/powered/scrubber/huge/stationary/tram

// Power
/obj/machinery/power/grid_checker

/obj/machinery/power/thermoregulator
/obj/structure/cable/heavyduty

// Medical
/obj/machinery/oxygen_pump/anesthetic

/obj/machinery/light/flicker
/obj/machinery/navbeacon/delivery/south
/obj/machinery/network/requests_console/preset
	base_type = /obj/machinery/network/requests_console
/obj/machinery/network/requests_console/preset/engineering
	department = "Engineering"

/obj/machinery/porta_turret/ai_defense
/obj/machinery/seed_storage/brig

/obj/machinery/suit_cycler/director
/obj/machinery/suit_cycler/exploration
/obj/machinery/vending/fishing
/obj/machinery/vending/giftvendor
/obj/machinery/vending/hydronutrients/brig
/obj/machinery/vending/phoronresearch
/obj/random/unidentified_medicine

// Closets (mothballed)
/obj/structure/closet/secure_closet/nanotrasen_commander
/obj/structure/closet/secure_closet/nanotrasen_security
/obj/structure/closet/secure_closet/nanotrasen_warden
/obj/structure/closet/secure_closet/pathfinder
/obj/structure/closet/secure_closet/sar
/obj/structure/closet/wardrobe/ert

/obj/structure/flight_left
/obj/structure/flight_right
/obj/structure/ladder/up
/obj/structure/rack/shelf/steel
/obj/structure/rack/steel
/obj/structure/reagent_dispensers/coolanttank

// planet decoration and flora
/obj/structure/fence
/obj/structure/fence/door
/obj/structure/fence/post

// COOKING
/obj/item/chems/condiment/spacespice
/obj/structure/reagent_dispensers/cookingoil
/obj/machinery/appliance/grill
/obj/machinery/appliance/cooker/fryer
/obj/machinery/appliance/cooker/stove
/obj/machinery/appliance/cooker/oven
/obj/machinery/appliance/mixer/candy
/obj/machinery/appliance/mixer/cereal
/obj/item/box/wings
/obj/item/food/roastbeef
/obj/item/food/kitsuneudon
/obj/item/food/lasagna
/obj/item/chems/drinks/bottle/lemonjuice
/obj/item/chems/drinks/metaglass

// TELESCI
/obj/machinery/computer/telescience
/obj/item/stock_parts/circuitboard/telesci_computer
	build_path = /obj/machinery/computer/telescience
	origin_tech = "{'programming':3}"
/datum/fabricator_recipe/imprinter/circuit/telesci_computer
	path = /obj/item/stock_parts/circuitboard/telesci_computer
/obj/item/stock_parts/circuitboard/telesci_pad
	origin_tech = "{'materials':2,'magnets':3,'wormholes':3}"
/datum/fabricator_recipe/imprinter/circuit/telesci_pad
	path = /obj/item/stock_parts/circuitboard/telesci_pad

// VIROLOGY
/obj/item/chems/syringe/antiviral
/obj/item/scanner/antibody
/obj/item/virusdish
	material = /decl/material/solid/organic/plastic
/obj/item/virusdish/random
/obj/item/stock_parts/circuitboard/virocentrifuge
	build_path = /obj/machinery/computer/centrifuge
	origin_tech = "{'biotech':2}"
/datum/fabricator_recipe/imprinter/circuit/virocentrifuge
	path = /obj/item/stock_parts/circuitboard/virocentrifuge
/obj/item/stock_parts/circuitboard/diseasesplicer
	build_path = /obj/machinery/computer/diseasesplicer
	origin_tech = "{'biotech':2}"
/datum/fabricator_recipe/imprinter/circuit/diseasesplicer
	path = /obj/item/stock_parts/circuitboard/diseasesplicer
/obj/item/stock_parts/circuitboard/diseaseanalyser
	board_type = "machine"
	build_path = /obj/machinery/disease2/diseaseanalyser
	origin_tech = "{'biotech':2}"
/datum/fabricator_recipe/imprinter/circuit/diseaseanalyzer
	path = /obj/item/stock_parts/circuitboard/diseaseanalyser
/obj/item/stock_parts/circuitboard/viroincubator
	board_type = "machine"
	build_path = /obj/machinery/disease2/incubator
	origin_tech = "{'biotech':2}"
/datum/fabricator_recipe/imprinter/circuit/viroincubator
	path = /obj/item/stock_parts/circuitboard/viroincubator
/obj/item/stock_parts/circuitboard/viroisolator
	board_type = "machine"
	build_path = /obj/machinery/disease2/isolator
	origin_tech = "{'biotech':2}"
/datum/fabricator_recipe/imprinter/circuit/viroisolator
	path = /obj/item/stock_parts/circuitboard/viroisolator
/obj/machinery/computer/centrifuge
/obj/machinery/computer/diseasesplicer
/obj/machinery/disease2/diseaseanalyser
	construct_state = /decl/machine_construction/default/panel_closed
/obj/machinery/disease2/incubator
	construct_state = /decl/machine_construction/default/panel_closed
/obj/machinery/disease2/isolator
	construct_state = /decl/machine_construction/default/panel_closed
/obj/machinery/smartfridge/chemistry/virology
/obj/machinery/smartfridge/secure/virology
/obj/structure/reagent_dispensers/virusfood

/*
// MOBS (MOTHBALLED)
/mob/living/simple_animal/bird/black_bird
/mob/living/simple_animal/corgi/pug/SirPogsley // TODO: add /dog/ parent type
/mob/living/simple_animal/fish/bass
/mob/living/simple_animal/fish/koi/poisonous
/mob/living/simple_animal/fish/rockfish
/mob/living/simple_animal/fish/solarfish
/mob/living/simple_animal/fish/trout
/mob/living/simple_animal/fox/renault
/mob/living/simple_animal/gaslamp
/mob/living/simple_animal/sif/fluffy
/mob/living/simple_animal/slime/rainbow/kendrick

// OBJECTS (MOTHBALLED)
// double bed items
/obj/item/bedsheet/bluedouble
/obj/item/bedsheet/browndouble
/obj/item/bedsheet/captaindouble
/obj/item/bedsheet/double
/obj/item/bedsheet/iandouble
/obj/item/bedsheet/mimedouble
/obj/item/bedsheet/orangedouble
/obj/item/bedsheet/purpledouble
/obj/item/bedsheet/rddouble
/obj/item/bedsheet/reddouble
/obj/item/bedsheet/yellowdouble
/obj/structure/bed/double/padded
/obj/item/closet_painter // will get rolled into paint sprayer eventually
/obj/item/communicator // needs to be made a type of modular computer
// all these defibs need to be redone and i don't have time for that
/obj/item/defib_kit/compact/combat/loaded
/obj/item/defib_kit/compact/loaded
/obj/item/defib_kit/jumper_kit
/obj/item/defib_kit/loaded
// fluff
/obj/item/bone/ribs
/obj/item/bone/skull/unathi
/obj/item/flame/candle/candelabra
/obj/item/flame/candle/candelabra/everburn
/obj/item/flame/fuelled/lighter/zippo/gonzo
/obj/item/folder/blue_captain
/obj/item/folder/blue_hop
/obj/item/folder/red_hos
/obj/item/folder/white
/obj/item/folder/white_cmo
/obj/item/folder/white_rd
/obj/item/folder/yellow_ce
/obj/item/soap/deluxe // currently soaps don't handle special decals like this very well :(
/obj/item/soap/nanotrasen
/obj/item/soap/syndie
// probably unnecessary?
/obj/item/gps/internal
/obj/item/gps/internal/base
// i'm too lazy to deal with this
/obj/item/stack/material/ore/bluespace_crystal
/obj/item/stack/material/ore/bluespace_crystal/artificial
/obj/machinery/bomb_tester

// we don't need t2 or t3 medical stuff at this point in development
/obj/item/roller/adv
/obj/item/scanner/health/advanced
/obj/item/scanner/health/improved
// mothballed: polaris/virgo mining features
/obj/item/stack/marker_beacon/thirty
/obj/machinery/mineral/equipment_vendor
/obj/machinery/mineral/equipment_vendor/survey
// mothballed: exercise
/obj/machinery/fitness/punchingbag/clown
// also mothballed: weird polaris research stuff
/obj/machinery/particle_smasher
*/