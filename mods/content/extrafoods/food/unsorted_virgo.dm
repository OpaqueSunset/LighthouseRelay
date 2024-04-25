/obj/item/chems/food/benedict
	name = "eggs benedict"
	desc = "Hey, there's only one egg in this!"
	filling_color = "#ffdf78"
	icon_state = "benedict"
	nutriment_type = /decl/material/liquid/nutriment/bread
	nutriment_amt = 2
	nutriment_desc = list("sauce-soaked bread" = 2)
	bitesize = 2

/obj/item/chems/food/benedict/Initialize()
	. = ..()
	add_to_reagents(/decl/material/solid/organic/meat, 2, list("bacon" = 2))
	add_to_reagents(/decl/material/solid/organic/meat/egg, 2, list("creamy eggs" = 2))

/obj/item/chems/food/beans
	name = "baked beans"
	desc = "Musical fruit in a slightly less musical container."
	filling_color = "#fc6f28"
	icon_state = "bakedbeans"
	bitesize = 2

/obj/item/chems/food/sugarcookie
	name = "sugar cookie"
	desc = "Just like your little sister used to make."
	filling_color = "#dbc94f"
	icon_state = "sugarcookie"
	nutriment_type = /decl/material/liquid/nutriment/bread
	nutriment_amt = 2
	nutriment_desc = list("cookie" = 2)
	bitesize = 2

/obj/item/chems/food/sugarcookie/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/sugar, 2, list("sweetness" = 2))

/obj/item/chems/food/fruitsalad
	name = "fruit salad"
	desc = "Your standard fruit salad."
	icon_state = "fruitsalad"
	filling_color = "#ff3867"
	nutriment_amt = 10
	nutriment_desc = list("fruit" = 10)
	bitesize = 4

/obj/item/chems/food/eggbowl
	name = "egg bowl"
	desc = "A bowl of fried rice with egg mixed in."
	icon_state = "eggbowl"
	trash = /obj/item/trash/snack_bowl
	filling_color = "#fffbdb"
	nutriment_type = /decl/material/liquid/nutriment/rice
	nutriment_amt = 6
	nutriment_desc = list("rice" = 6)
	bitesize = 2

/obj/item/chems/food/eggbowl/Initialize()
	. = ..()
	add_to_reagents(/decl/material/solid/organic/meat/egg, 4, list("scrambled eggs" = 4))

/obj/item/chems/food/curryrice
	name = "curry rice"
	desc = "That's some dangerously spicy rice."
	icon_state = "curryrice"
	nutriment_type = /decl/material/liquid/nutriment/rice
	nutriment_amt = 5
	nutriment_desc = list("spicy rice" = 5)
	bitesize = 2

/obj/item/chems/food/curryrice/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/capsaicin, 4)
	add_to_reagents(/decl/material/solid/sodiumchloride, 1)

/obj/item/chems/food/piginblanket
	name = "pig in a blanket"
	desc = "A sausage embedded in a soft, fluffy pastry. Free this pig from its blanket prison by eating it."
	icon_state = "piginblanket"
	nutriment_type = /decl/material/liquid/nutriment/bread
	nutriment_amt = 3
	nutriment_desc = list("savory pastry" = 3)
	bitesize = 3

/obj/item/chems/food/piginblanket/Initialize()
	. = ..()
	add_to_reagents(/decl/material/solid/organic/meat, 4, list("sausage" = 3))

/obj/item/chems/food/macncheese
	name = "macaroni and cheese"
	desc = "The perfect combination of noodles and dairy."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "macncheese"
	trash = /obj/item/trash/snack_bowl
	nutriment_amt = 9
	nutriment_desc = list("cheese" = 5, "pasta" = 4, "happiness" = 1)
	bitesize = 3
