/decl/recipe/meatbun
	container_categories = RECIPE_CATEGORY_SAUCEPAN | RECIPE_CATEGORY_POT
	reagents = list(/decl/material/solid/spacespice = 1, /decl/material/liquid/water = 5)
	items = list(
		/obj/item/food/doughslice = 1,
		/obj/item/food/butchery/cutlet/raw = 1
	)
	reagent_mix = REAGENT_REPLACE //Water used up in cooking
	result = /obj/item/food/meatbun

/decl/recipe/custardbun
	container_categories = RECIPE_CATEGORY_SAUCEPAN | RECIPE_CATEGORY_POT
	reagents = list(/decl/material/solid/spacespice = 1, /decl/material/liquid/water = 5, /decl/material/solid/organic/meat/egg = 3)
	items = list(
		/obj/item/food/doughslice = 1
	)
	reagent_mix = REAGENT_REPLACE //Water, egg used up in cooking
	result = /obj/item/food/custardbun

/decl/recipe/chickenmomo
	container_categories = RECIPE_CATEGORY_SAUCEPAN | RECIPE_CATEGORY_POT
	reagents = list(/decl/material/solid/spacespice = 2, /decl/material/liquid/water = 5)
	items = list(
		/obj/item/food/doughslice = 3,
		/obj/item/food/butchery/meat/chicken = 1
	)
	reagent_mix = REAGENT_REPLACE //Simplify end product
	result = /obj/item/food/chickenmomo

/decl/recipe/veggiemomo
	container_categories = RECIPE_CATEGORY_SAUCEPAN | RECIPE_CATEGORY_POT
	reagents = list(/decl/material/solid/spacespice = 2, /decl/material/liquid/water = 5)
	fruit = list("carrot" = 1, "cabbage" = 1)
	items = list(
		/obj/item/food/doughslice = 3
	)
	reagent_mix = REAGENT_REPLACE //Get that water outta here
	result = /obj/item/food/veggiemomo

/decl/recipe/cheese_cracker
	items = list(
		/obj/item/food/spreads = 1,
		/obj/item/food/slice/bread = 1,
		/obj/item/food/dairy/cheese/wedge = 1
	)
	reagents = list(/decl/material/solid/spacespice = 1)
	result = /obj/item/food/cheese_cracker
	result_quantity = 4

/decl/recipe/fish_taco
	container_categories = RECIPE_CATEGORY_MIX | RECIPE_CATEGORY_SKILLET
	fruit = list("chili" = 1, "lemon slice" = 1)
	items = list(
		/obj/item/food/butchery/meat/fish = 1,
		/obj/item/food/tortilla = 1
	)
	result = /obj/item/food/fish_taco

/decl/recipe/mashedpotato
	fruit = list("potato" = 1)
	result = /obj/item/food/mashedpotato

/decl/recipe/icecreamsandwich
	reagents = list(/decl/material/liquid/drink/milk = 5, /decl/material/solid/ice = 5)
	reagent_mix = REAGENT_REPLACE
	items = list(
		/obj/item/food/icecream = 1
	)
	result = /obj/item/food/icecreamsandwich

/decl/recipe/banana_split
	fruit = list("banana" = 1)
	reagents = list(/decl/material/liquid/drink/milk = 5, /decl/material/solid/ice = 5)
	reagent_mix = REAGENT_REPLACE
	items = list(
		/obj/item/food/icecream = 1
	)
	result = /obj/item/food/banana_split

/decl/recipe/honeytoast
	container_categories = RECIPE_CATEGORY_SKILLET
	reagents = list(/decl/material/liquid/nutriment/honey = 5)
	items = list(
		/obj/item/food/slice/bread = 1
	)
	reagent_mix = REAGENT_REPLACE //Simplify end product
	result = /obj/item/food/honeytoast

/decl/recipe/truffle
	container_categories = RECIPE_CATEGORY_SAUCEPAN // it's melted and poured into a mold...?
	reagents = list(/decl/material/liquid/nutriment/coco = 2, /decl/material/liquid/drink/milk/cream = 5)
	items = list(
		/obj/item/food/chocolatebar = 1
	)
	reagent_mix = REAGENT_REPLACE
	result = /obj/item/food/truffle
	result_quantity = 4

/decl/recipe/fruitsalad
	container_categories = RECIPE_CATEGORY_MIX
	fruit = list("orange slice" = 2, "apple slice" = 2, "grape" = 1, "watermelon slice" = 1)
	result = /obj/item/food/fruitsalad

/decl/recipe/benedict
	container_categories = RECIPE_CATEGORY_MIX | RECIPE_CATEGORY_SKILLET
	items = list(
		/obj/item/food/butchery/cutlet = 1,
		/obj/item/food/friedegg = 1,
		/obj/item/food/slice/bread = 1,
		/obj/item/food/spreads/butter = 1
	)
	reagents = list(/decl/material/solid/organic/meat/egg = 3, /decl/material/liquid/drink/juice/lemon = 5)
	result = /obj/item/food/benedict

/decl/recipe/bakedbeans
	container_categories = RECIPE_CATEGORY_OVEN
	fruit = list("soybeans" = 2)
	reagents = list(/decl/material/liquid/nutriment/barbecue = 5)
	result = /obj/item/food/beans

/decl/recipe/curryrice
	fruit = list("chili" = 1)
	reagents = list(/decl/material/liquid/nutriment/rice = 10)
	result = /obj/item/food/curryrice

/decl/recipe/piginblanket
	container_categories = RECIPE_CATEGORY_OVEN
	items = list(
		/obj/item/food/doughslice,
		/obj/item/food/sausage
	)
	result = /obj/item/food/piginblanket