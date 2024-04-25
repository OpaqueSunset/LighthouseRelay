/decl/recipe/meatbun
	appliance = APPLIANCE_SAUCEPAN | APPLIANCE_POT
	reagents = list(/decl/material/solid/spacespice = 1, /decl/material/liquid/water = 5)
	items = list(
		/obj/item/chems/food/doughslice = 1,
		/obj/item/chems/food/rawcutlet = 1
	)
	reagent_mix = REAGENT_REPLACE //Water used up in cooking
	result = /obj/item/chems/food/meatbun

/decl/recipe/custardbun
	appliance = APPLIANCE_SAUCEPAN | APPLIANCE_POT
	reagents = list(/decl/material/solid/spacespice = 1, /decl/material/liquid/water = 5, /decl/material/solid/organic/meat/egg = 3)
	items = list(
		/obj/item/chems/food/doughslice = 1
	)
	reagent_mix = REAGENT_REPLACE //Water, egg used up in cooking
	result = /obj/item/chems/food/custardbun

/decl/recipe/chickenmomo
	appliance = APPLIANCE_SAUCEPAN | APPLIANCE_POT
	reagents = list(/decl/material/solid/spacespice = 2, /decl/material/liquid/water = 5)
	items = list(
		/obj/item/chems/food/doughslice = 3,
		/obj/item/chems/food/butchery/meat/chicken = 1
	)
	reagent_mix = REAGENT_REPLACE //Simplify end product
	result = /obj/item/chems/food/chickenmomo

/decl/recipe/veggiemomo
	appliance = APPLIANCE_SAUCEPAN | APPLIANCE_POT
	reagents = list(/decl/material/solid/spacespice = 2, /decl/material/liquid/water = 5)
	fruit = list("carrot" = 1, "cabbage" = 1)
	items = list(
		/obj/item/chems/food/doughslice = 3
	)
	reagent_mix = REAGENT_REPLACE //Get that water outta here
	result = /obj/item/chems/food/veggiemomo

/decl/recipe/cheese_cracker
	items = list(
		/obj/item/chems/food/spreads = 1,
		/obj/item/chems/food/slice/bread = 1,
		/obj/item/chems/food/cheesewedge = 1
	)
	reagents = list(/decl/material/solid/spacespice = 1)
	result = /obj/item/chems/food/cheese_cracker
	result_quantity = 4

/decl/recipe/fish_taco
	appliance = APPLIANCE_MIX | APPLIANCE_SKILLET
	fruit = list("chili" = 1, "lemon slice" = 1)
	items = list(
		/obj/item/chems/food/butchery/meat/fish = 1,
		/obj/item/chems/food/tortilla = 1
	)
	result = /obj/item/chems/food/fish_taco

/decl/recipe/mashedpotato
	fruit = list("potato" = 1)
	result = /obj/item/chems/food/mashedpotato

/decl/recipe/icecreamsandwich
	reagents = list(/decl/material/liquid/drink/milk = 5, /decl/material/solid/ice = 5)
	reagent_mix = REAGENT_REPLACE
	items = list(
		/obj/item/chems/food/icecream = 1
	)
	result = /obj/item/chems/food/icecreamsandwich

/decl/recipe/banana_split
	fruit = list("banana" = 1)
	reagents = list(/decl/material/liquid/drink/milk = 5, /decl/material/solid/ice = 5)
	reagent_mix = REAGENT_REPLACE
	items = list(
		/obj/item/chems/food/icecream = 1
	)
	result = /obj/item/chems/food/banana_split

/decl/recipe/honeytoast
	appliance = APPLIANCE_SKILLET
	reagents = list(/decl/material/liquid/nutriment/honey = 5)
	items = list(
		/obj/item/chems/food/slice/bread = 1
	)
	reagent_mix = REAGENT_REPLACE //Simplify end product
	result = /obj/item/chems/food/honeytoast

/decl/recipe/truffle
	appliance = APPLIANCE_SAUCEPAN // it's melted and poured into a mold...?
	reagents = list(/decl/material/liquid/nutriment/coco = 2, /decl/material/liquid/drink/milk/cream = 5)
	items = list(
		/obj/item/chems/food/chocolatebar = 1
	)
	reagent_mix = REAGENT_REPLACE
	result = /obj/item/chems/food/truffle
	result_quantity = 4

/decl/recipe/fruitsalad
	appliance = APPLIANCE_MIX
	fruit = list("orange slice" = 2, "apple slice" = 2, "grape" = 1, "watermelon slice" = 1)
	result = /obj/item/chems/food/fruitsalad

/decl/recipe/benedict
	appliance = APPLIANCE_MIX | APPLIANCE_SKILLET
	items = list(
		/obj/item/chems/food/cutlet = 1,
		/obj/item/chems/food/friedegg = 1,
		/obj/item/chems/food/slice/bread = 1,
		/obj/item/chems/food/spreads/butter = 1
	)
	reagents = list(/decl/material/solid/organic/meat/egg = 3, /decl/material/liquid/drink/juice/lemon = 5)
	result = /obj/item/chems/food/benedict

/decl/recipe/bakedbeans
	appliance = APPLIANCE_OVEN
	fruit = list("soybeans" = 2)
	reagents = list(/decl/material/liquid/nutriment/barbecue = 5)
	result = /obj/item/chems/food/beans

/decl/recipe/curryrice
	fruit = list("chili" = 1)
	reagents = list(/decl/material/liquid/nutriment/rice = 10)
	result = /obj/item/chems/food/curryrice

/decl/recipe/piginblanket
	appliance = APPLIANCE_OVEN
	items = list(
		/obj/item/chems/food/doughslice,
		/obj/item/chems/food/sausage
	)
	result = /obj/item/chems/food/piginblanket