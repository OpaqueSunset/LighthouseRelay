/obj/item/chems/food/redcurry
	name = "red curry"
	gender = PLURAL
	desc = "A bowl of creamy red curry with meat and rice. This one looks savory."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "redcurry"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#f73333"
	nutriment_amt = 4
	nutriment_desc = list("savory meat" = 4)
	bitesize = 3

/obj/item/chems/food/redcurry/Initialize()
	. = ..()
	add_to_reagents(/decl/material/solid/organic/meat, 7)
	add_to_reagents(/decl/material/liquid/nutriment/rice, 4)
	add_to_reagents(/decl/material/solid/spacespice, 2)

/obj/item/chems/food/greencurry
	name = "green curry"
	gender = PLURAL
	desc = "A bowl of creamy green curry with tofu, hot peppers and rice. This one looks spicy!"
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "greencurry"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#58b76c"
	nutriment_amt = 4
	nutriment_type = /decl/material/liquid/nutriment/rice
	bitesize = 3

/obj/item/chems/food/greencurry/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/plant_protein, 2)
	add_to_reagents(/decl/material/liquid/capsaicin, 2)
	add_to_reagents(/decl/material/solid/spacespice, 2)

/obj/item/chems/food/yellowcurry
	name = "yellow curry"
	gender = PLURAL
	desc = "A bowl of creamy yellow curry with potatoes, peanuts and rice. This one looks mild."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "yellowcurry"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#bc9509"
	nutriment_amt = 5
	nutriment_desc = list("potatoes" = 3, "peanuts" = 2)
	bitesize = 3

/obj/item/chems/food/yellowcurry/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/rice, 4)
	add_to_reagents(/decl/material/solid/spacespice, 2)

/obj/item/chems/food/bibimbap
	name = "bibimbap bowl"
	desc = "A traditional Korean meal of meat and mixed vegetables. It's served on a bed of rice, and topped with a fried egg."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "bibimbap"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#4f2100"
	nutriment_amt = 6
	nutriment_desc = list("rice" = 2, "mushroom" = 2, "carrot" = 2)
	bitesize = 4

/obj/item/chems/food/bibimbap/Initialize()
	. = ..()
	add_to_reagents(/decl/material/solid/organic/meat, 6)
	add_to_reagents(/decl/material/liquid/eyedrops, 2)
	add_to_reagents(/decl/material/solid/spacespice, 2)
	add_to_reagents(/decl/material/solid/organic/meat/egg, 3)

/obj/item/chems/food/friedrice
	name = "fried rice"
	gender = PLURAL
	desc = "A less-boring dish of less-boring rice!"
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "friedrice"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#fffbdb"
	nutriment_amt = 4
	nutriment_desc = list("soy" = 2, "cabbage" = 2)
	bitesize = 2

/obj/item/chems/food/friedrice/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/rice, 5)
	add_to_reagents(/decl/material/liquid/drink/juice/carrot, 3)
	add_to_reagents(/decl/material/liquid/eyedrops, 1)

/obj/item/chems/food/riceball
	name = "rice ball"
	desc = "A bundle of rice wrapped in seaweed. This one seems to have a fish flake filling inside."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "riceball"
	filling_color = "#a66829"
	center_of_mass = @'{"x":17,"y":16}'
	nutriment_amt = 1
	nutriment_desc = list("seaweed" = 1)

/obj/item/chems/food/riceball/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/rice, 1)
	add_to_reagents(/decl/material/liquid/nutriment/soysauce, 1)

/obj/item/chems/food/riceball/on_update_icon()
	var/percent = round((reagents?.total_volume / 3) * 100)
	switch(percent)
		if(0 to 90)
			icon_state = "riceball_90"
		if(91 to INFINITY)
			icon_state = "riceball"

/obj/item/chems/food/porkbowl
	name = "pork bowl"
	desc = "A bowl of fried rice with cuts of meat."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "porkbowl"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#fffbdb"
	bitesize = 2
	nutriment_amt = 6
	nutriment_type = /decl/material/liquid/nutriment/rice

/obj/item/chems/food/porkbowl/Initialize()
	. = ..()
	add_to_reagents(/decl/material/solid/organic/meat, 4)

/obj/item/chems/food/ricepudding
	name = "rice pudding"
	desc = "Where's the jam?"
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "rpudding"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#fffbdb"
	center_of_mass = @'{"x":17,"y":11}'
	nutriment_amt = 4
	nutriment_type = /decl/material/liquid/nutriment/rice
	bitesize = 2

/obj/item/chems/food/risotto
	name = "risotto"
	gender = PLURAL
	desc = "A creamy, savory rice dish from southern Europe, typically cooked slowly with wine and broth. This one has bits of mushroom."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "risotto"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#edd7d7"
	center_of_mass = @'{"x":15,"y":9}'
	nutriment_amt = 4
	nutriment_desc = list("creamy mushroom" = 4)
	bitesize = 2

/obj/item/chems/food/risotto/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/rice, 3)
	add_to_reagents(/decl/material/solid/spacespice, 2)

/obj/item/chems/food/risottoballs
	name = "risotto balls"
	gender = PLURAL
	desc = "Mushroom risotto that has been battered and deep fried. The best use of leftovers!"
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "risottoballs"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#edd7d7"
	center_of_mass = @'{"x":15,"y":9}'
	nutriment_amt = 2
	nutriment_desc = list("spices" = 2, "mushroom" = 2)
	bitesize = 3

/obj/item/chems/food/risottoballs/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/rice, 4)
	add_to_reagents(/decl/material/solid/sodiumchloride, 1)
	add_to_reagents(/decl/material/solid/blackpepper, 1)

/obj/item/chems/food/omurice
	name = "omelette rice"
	desc = "Just like your Japanese animes!"
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "omurice"
	plate = /obj/item/plate
	nutriment_amt = 8
	nutriment_desc = list("rice" = 4, "egg" = 4)
	bitesize = 1

/obj/item/chems/food/omurice/heart
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "omuriceheart"

/obj/item/chems/food/omurice/face
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "omuriceface"