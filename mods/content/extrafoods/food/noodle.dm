/obj/item/chems/food/lomein
	name = "lo mein"
	desc = "A popular Chinese noodle dish. Chopsticks optional."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "lomein"
	trash = /obj/item/trash/plate
	filling_color = "#fcee81"
	nutriment_amt = 4
	nutriment_desc = list("mushroom" = 2, "cabbage" = 2)
	bitesize = 2

/obj/item/chems/food/lomein/Initialize()
	. = ..()
	reagents.add_reagent(/decl/material/liquid/nutriment/rice, 4)
	reagents.add_reagent(/decl/material/liquid/nutriment/protein, 2)
	reagents.add_reagent(/decl/material/liquid/drink/juice/carrot, 3)
	reagents.add_reagent(/decl/material/liquid/eyedrops, 1)

/obj/item/chems/food/kitsuneudon
	name = "kitsune udon"
	desc = "A purported favorite of kitsunes in ancient japanese myth: udon noodles, fried egg, and tofu."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "kitsuneudon"
	trash = /obj/item/trash/snack_bowl
	nutriment_amt = 6
	nutriment_desc = list("fried egg" = 2, "egg noodles" = 4)
	bitesize = 2

/obj/item/chems/food/chickennoodlesoup // could also go in soup...
	name = "chicken noodle soup"
	desc = "A bright bowl of yellow broth with cuts of meat, noodles and carrots. Just like Mom used to make..."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "chickennoodlesoup"
	filling_color = "#ead90c"
	nutriment_amt = 6
	nutriment_desc = list("warm soup" = 4, "carrots" = 2, "noodles" = 2)
	bitesize = 3

/obj/item/chems/food/chickennoodlesoup/Initialize()
	. = ..()
	reagents.add_reagent(/decl/material/liquid/nutriment/protein, 4)
	reagents.add_reagent(/decl/material/liquid/water, 5)