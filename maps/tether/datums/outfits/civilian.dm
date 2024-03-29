/decl/hierarchy/outfit/job/service
	l_ear = /obj/item/radio/headset/headset_service
	abstract_type = /decl/hierarchy/outfit/job/service

/decl/hierarchy/outfit/job/service/bartender
	name = "Job - Bartender"
	uniform = /obj/item/clothing/under/bartender
	id_type = /obj/item/card/id/civilian
	pda_type = /obj/item/modular_computer/pda
	backpack_contents = list(/obj/item/clothing/accessory/permit/gun/bar = 1)

/decl/hierarchy/outfit/job/service/bartender/post_equip(mob/living/carbon/human/H)
	. = ..()
	var/obj/item/storage/backpack = H.get_equipped_item(slot_back_str)
	if(!istype(backpack))
		return
	for(var/obj/item/clothing/accessory/permit/gun/bar/permit in backpack.get_contained_external_atoms())
		permit.set_owner(H.real_name)

/decl/hierarchy/outfit/job/service/bartender/barista
	name = "Job - Barista"
	backpack_contents = null

/decl/hierarchy/outfit/job/service/chef
	name = "Job - Chef"
	uniform = /obj/item/clothing/under/chef
	suit = /obj/item/clothing/suit/chef
	head = /obj/item/clothing/head/chefhat
	id_type = /obj/item/card/id/civilian
	pda_type = /obj/item/modular_computer/pda

/decl/hierarchy/outfit/job/service/server
	name = "Job - Server"
	uniform = /obj/item/clothing/under/waiter

/decl/hierarchy/outfit/job/service/gardener
	name = "Job - Gardener"
	uniform = /obj/item/clothing/under/hydroponics
	suit = /obj/item/clothing/suit/apron
	gloves = /obj/item/clothing/gloves/thick/botany
	r_pocket = /obj/item/scanner/plant
	id_type = /obj/item/card/id/civilian
	pda_type = /obj/item/modular_computer/pda

/decl/hierarchy/outfit/job/service/gardener/Initialize()
	. = ..()
	backpack_overrides[/decl/backpack_outfit/backpack]      = /obj/item/storage/backpack/hydroponics
	backpack_overrides[/decl/backpack_outfit/satchel]       = /obj/item/storage/backpack/satchel/hyd
	backpack_overrides[/decl/backpack_outfit/messenger_bag] = /obj/item/storage/backpack/messenger/hyd

/decl/hierarchy/outfit/job/service/janitor
	name = "Job - Janitor"
	uniform = /obj/item/clothing/under/janitor
	id_type = /obj/item/card/id/civilian
	pda_type = /obj/item/modular_computer/pda

/decl/hierarchy/outfit/job/librarian
	name = "Job - Librarian"
	uniform = /obj/item/clothing/under/suit_jacket/red
	id_type = /obj/item/card/id/civilian
	pda_type = /obj/item/modular_computer/pda

/obj/item/radio/headset/heads/ia
	name = "internal affairs headset"

/obj/item/modular_computer/pda/heads/paperpusher
	stored_pen = /obj/item/pen/fancy

/decl/hierarchy/outfit/job/internal_affairs_agent
	name = "Job - Internal affairs agent"
	l_ear = /obj/item/radio/headset/heads/ia
	uniform = /obj/item/clothing/under/internalaffairs
	suit = /obj/item/clothing/suit/storage/toggle/suit/black
	shoes = /obj/item/clothing/shoes/color/brown
	glasses = /obj/item/clothing/glasses/sunglasses/big
	hands = list(/obj/item/storage/briefcase)
	id_type = /obj/item/card/id/civilian/internal_affairs_agent
	pda_type = /obj/item/modular_computer/pda/heads/paperpusher

/decl/hierarchy/outfit/job/chaplain
	name = "Job - Chaplain"
	uniform = /obj/item/clothing/under/chaplain
	hands = list(/obj/item/storage/bible)
	id_type = /obj/item/card/id/civilian
	pda_type = /obj/item/modular_computer/pda/medical

/decl/hierarchy/outfit/job/cargo
	l_ear = /obj/item/radio/headset/headset_cargo
	abstract_type = /decl/hierarchy/outfit/job/cargo

/decl/hierarchy/outfit/job/cargo/qm
	name = "Job - Cargo"
	uniform = /obj/item/clothing/under/cargo
	shoes = /obj/item/clothing/shoes/color/brown
	glasses = /obj/item/clothing/glasses/sunglasses
	hands = list(/obj/item/clipboard)
	id_type = /obj/item/card/id/cargo/head
	pda_type = /obj/item/modular_computer/pda/cargo

/obj/item/card/id/cargo/head
	name = "identification card"
	desc = "A card which represents service and planning."
	extra_details = list("goldstripe")

/decl/hierarchy/outfit/job/cargo/cargo_tech
	name = "Job - Cargo technician"
	uniform = /obj/item/clothing/under/cargotech
	id_type = /obj/item/card/id/cargo
	pda_type = /obj/item/modular_computer/pda/cargo

/decl/hierarchy/outfit/job/cargo/mining
	name = "Job - Shaft miner"
	uniform = /obj/item/clothing/under/miner
	id_type = /obj/item/card/id/cargo
	pda_type = /obj/item/modular_computer/pda/science
	backpack_contents = list(/obj/item/crowbar = 1, /obj/item/storage/ore = 1)
	outfit_flags = OUTFIT_HAS_BACKPACK | OUTFIT_EXTENDED_SURVIVAL | OUTFIT_HAS_VITALS_SENSOR

/decl/hierarchy/outfit/job/cargo/mining/Initialize()
	. = ..()
	BACKPACK_OVERRIDE_ENGINEERING

/decl/hierarchy/outfit/job/cargo/assistant
	name = "Job - Jr. Cargo Technician"
	uniform = /obj/item/clothing/under/cargotech
	id_type = /obj/item/card/id/cargo
	pda_type = /obj/item/modular_computer/pda/cargo