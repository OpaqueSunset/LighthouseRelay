/decl/recipe/grilled
	abstract_type = /decl/recipe/grilled
	container_categories = RECIPE_CATEGORY_MICROWAVE|RECIPE_CATEGORY_SKILLET
	//cooking_heat_type = COOKING_HEAT_DIRECT

/decl/recipe/grilled/plainsteak
	items = list(/obj/item/chems/food/butchery/meat)
	result = /obj/item/chems/food/plainsteak

/decl/recipe/grilled/meatsteak
	reagents = list(/decl/material/solid/sodiumchloride = 1, /decl/material/solid/blackpepper = 1)
	items = list(/obj/item/chems/food/butchery/cutlet)
	result = /obj/item/chems/food/meatsteak

/decl/recipe/grilled/loadedsteak
	reagents = list(/decl/material/liquid/nutriment/garlicsauce = 5)
	fruit = list("onion" = 1, "mushroom" = 1)
	items = list(/obj/item/chems/food/butchery/cutlet)
	result = /obj/item/chems/food/loadedsteak

/decl/recipe/grilled/syntisteak
	reagents = list(/decl/material/solid/sodiumchloride = 1, /decl/material/solid/blackpepper = 1)
	items = list(/obj/item/chems/food/butchery/meat/syntiflesh)
	result = /obj/item/chems/food/meatsteak/synthetic

/decl/recipe/grilled/toastedsandwich
	items = list(
		/obj/item/chems/food/sandwich
	)
	result = /obj/item/chems/food/toastedsandwich

/decl/recipe/grilled/grilledcheese
	items = list(
		/obj/item/chems/food/slice/bread = 2,
		/obj/item/chems/food/cheesewedge,
	)
	result = /obj/item/chems/food/grilledcheese

/decl/recipe/grilled/meatball
	display_name = "cooked meatball"
	items = list(
		/obj/item/chems/food/meatball/raw
	)
	reagent_mix = REAGENT_REPLACE // get the raw reagents out of there
	result = /obj/item/chems/food/meatball

/decl/recipe/grilled/cutlet
	items = list(
		/obj/item/chems/food/butchery/cutlet/raw
	)
	result = /obj/item/chems/food/butchery/cutlet

/decl/recipe/grilled/meatkabob
	items = list(
		/obj/item/stack/material/rods,
		/obj/item/chems/food/butchery/cutlet = 2
	)
	result = /obj/item/chems/food/meatkabob

/decl/recipe/grilled/tofukabob
	items = list(
		/obj/item/stack/material/rods,
		/obj/item/chems/food/tofu = 2,
	)
	result = /obj/item/chems/food/tofukabob
