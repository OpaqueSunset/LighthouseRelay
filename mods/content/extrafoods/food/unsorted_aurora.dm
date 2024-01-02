/obj/item/chems/food/meatbun
	name = "meat bun"
	desc = "A soft, fluffy flour bun also known as baozi. This one is filled with a spiced meat filling."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "meatbun"
	filling_color = "#edd7d7"
	nutriment_amt = 5
	nutriment_desc = list("spice" = 3, "dumpling" = 2)
	bitesize = 5

/obj/item/chems/food/meatbun/Initialize()
	. = ..()
	reagents.add_reagent(/decl/material/liquid/nutriment/protein, 3)

/obj/item/chems/food/custardbun
	name = "custard bun"
	desc = "A soft, fluffy flour bun also known as baozi. This one is filled with an egg custard."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "meatbun"
	nutriment_amt = 6
	nutriment_desc = list("egg custard" = 6)
	filling_color = "#ebedc2"
	bitesize = 6

/obj/item/chems/food/custardbun/Initialize()
	. = ..()
	reagents.add_reagent(/decl/material/liquid/nutriment/protein, 2)

/obj/item/chems/food/chickenmomo
	name = "chicken momo"
	gender = PLURAL
	desc = "A plate of spiced and steamed chicken dumplings. The style originates from south Asia."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "momo"
	trash = /obj/item/trash/snacktray
	filling_color = "#edd7d7"
	nutriment_amt = 5
	nutriment_desc = list("spice" = 3, "dumpling" = 2)
	bitesize = 3

/obj/item/chems/food/chickenmomo/Initialize()
	. = ..()
	reagents.add_reagent(/decl/material/liquid/nutriment/protein, 6)

/obj/item/chems/food/veggiemomo
	name = "veggie momo"
	gender = PLURAL
	desc = "A plate of spiced and steamed vegetable dumplings. The style originates from south Asia."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "momo"
	trash = /obj/item/trash/snacktray
	filling_color = "#edd7d7"
	nutriment_amt = 10
	nutriment_desc = list("spice" = 3, "dumpling" = 2, "vegetables" = 5)
	bitesize = 3

/obj/item/chems/food/honeytoast
	name = "piece of honeyed toast"
	desc = "For those who like their breakfast sweet."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "honeytoast"
	trash = /obj/item/trash/plate
	filling_color = "#ede5ad"
	nutriment_amt = 1
	nutriment_desc = list("sweet, crunchy bread" = 1)
	bitesize = 4

/obj/item/chems/food/spreads
	name = "nutri-spread"
	desc = "A stick of plant-based nutriments in a semi-solid form. I can't believe it's not margarine!"
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "marge"
	bitesize = 2
	nutriment_desc = list("margarine" = 5)
	nutriment_amt = 20

/obj/item/chems/food/spreads/butter
	name = "butter"
	desc = "A stick of pure butterfat made from milk products."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "butter"
	bitesize = 2
	nutriment_amt = 5
	nutriment_desc = list("butter" = 5)

/obj/item/chems/food/spreads/butter/Initialize()
	. = ..()
	reagents.add_reagent(/decl/material/liquid/nutriment/triglyceride, 15)
	reagents.add_reagent(/decl/material/solid/sodiumchloride, 1)

/obj/item/chems/food/cheese_cracker
	name = "supreme cheese toast"
	desc = "A piece of toast lathered with butter, cheese, spices, and herbs."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "cheese_cracker"
	nutriment_desc = list("cheese toast" = 8)
	nutriment_amt = 8

/obj/item/chems/food/truffle
	name = "chocolate truffle"
	desc = "Rich bite-sized chocolate."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "truffle"
	bitesize = 4

/obj/item/chems/food/truffle/Initialize()
	. = ..()
	reagents.add_reagent(/decl/material/liquid/nutriment/coco, 6)

/obj/item/chems/food/truffle/random
	name = "mystery chocolate truffle"
	desc = "Rich bite-sized chocolate with a mystery filling!"
	var/list/mystery_reagents = list(
		/decl/material/liquid/drink/milk/cream,
		/decl/material/liquid/nutriment/cherryjelly,
		/decl/material/liquid/drink/syrup/mint,
		/decl/material/liquid/frostoil,
		/decl/material/liquid/capsaicin,
		/decl/material/liquid/drink/coffee,
		/decl/material/liquid/drink/milkshake
	)

/obj/item/chems/food/truffle/random/Initialize()
	. = ..()
	reagents.add_reagent(pick(mystery_reagents), 4)

/obj/item/chems/food/mashedpotato
	name = "mashed potato"
	desc = "Pillowy mounds of mashed potato."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "mashedpotato"
	trash = /obj/item/trash/plate
	filling_color = "#eddd00"
	nutriment_amt = 4
	nutriment_desc = list("mashed potatoes" = 4)
	bitesize = 2

/obj/item/chems/food/icecreamsandwich
	name = "ice cream sandwich"
	desc = "Portable ice cream in its own packaging."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "icecreamsandwich"
	filling_color = "#343834"
	nutriment_amt = 4
	nutriment_desc = list("ice cream" = 4)

/obj/item/chems/food/banana_split
	name = "banana split"
	desc = "A dessert made with icecream and a banana."
	icon_state = "banana_split"
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	bitesize = 2
	trash = /obj/item/trash/snack_bowl
	nutriment_amt = 5
	nutriment_desc = list("icecream" = 5)

/obj/item/chems/food/banana_split/Initialize()
	. = ..()
	reagents.add_reagent(/decl/material/liquid/drink/juice/banana, 3)
