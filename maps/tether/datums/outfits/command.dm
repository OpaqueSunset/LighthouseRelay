/decl/outfit/job/captain
	name = "Job - Captain"
	head = /obj/item/clothing/head/caphat
	glasses = /obj/item/clothing/glasses/sunglasses
	uniform = /obj/item/clothing/jumpsuit/captain
	l_ear = /obj/item/radio/headset/heads/captain
	shoes = /obj/item/clothing/shoes/color/brown
	id_type = /obj/item/card/id/gold
	pda_type = /obj/item/modular_computer/pda/heads/captain
	backpack_contents = list(/obj/item/box/ids = 1)

/decl/outfit/job/captain/Initialize()
	. = ..()
	backpack_overrides[/decl/backpack_outfit/backpack]      = /obj/item/backpack/captain
	backpack_overrides[/decl/backpack_outfit/satchel]       = /obj/item/backpack/satchel/cap
	backpack_overrides[/decl/backpack_outfit/messenger_bag] = /obj/item/backpack/messenger/com

/decl/outfit/job/captain/post_equip(var/mob/living/human/H)
	..()
	if(H.get_age() > 49)
		// Since we can have something other than the default uniform at this
		// point, check if we can actually attach the medal
		var/obj/item/clothing/uniform = H.get_equipped_item(slot_w_uniform_str)
		if(uniform)
			var/obj/item/clothing/medal/nanotrasen/gold/medal = new()
			if(uniform.can_attach_accessory(medal))
				uniform.attach_accessory(null, medal)
			else
				qdel(medal)

/decl/outfit/job/hop
	name = "Job - Head of Personnel"
	uniform = /obj/item/clothing/jumpsuit/head_of_personnel
	l_ear = /obj/item/radio/headset/heads/hop
	shoes = /obj/item/clothing/shoes/color/brown
	id_type = /obj/item/card/id/silver
	pda_type = /obj/item/modular_computer/pda/heads/hop
	backpack_contents = list(/obj/item/box/ids = 1)

/decl/outfit/job/secretary
	name = "Job - Command Secretary"
	l_ear = /obj/item/radio/headset/headset_adj
	uniform = /obj/item/clothing/pants/slacks/black/outfit
	shoes = /obj/item/clothing/shoes/color/brown
	id_type = /obj/item/card/id/silver
	pda_type = /obj/item/modular_computer/pda/heads/hop
	hands = list(/obj/item/clipboard)

/obj/item/encryptionkey/headset_adj //Command Secretary's Headset Key
	name = "secretary radio encryption key"
	icon_state = "com_cypherkey"
	can_decrypt = list(access_bridge, access_bar)

/obj/item/radio/headset/headset_adj // Secretary headset with Service and Command.
	name = "secretary radio headset"
	desc = "A headset for those who serve the Command staff."
	icon_state = "com_headset"
	encryption_keys = list(/obj/item/encryptionkey/headset_adj)