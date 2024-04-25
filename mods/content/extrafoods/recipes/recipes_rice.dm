/decl/recipe/redcurry
	appliance = APPLIANCE_SKILLET
	reagents = list(/decl/material/liquid/drink/milk/cream = 5, /decl/material/solid/spacespice = 2, /decl/material/liquid/nutriment/rice = 5)
	items = list(
		/obj/item/chems/food/cutlet = 2
	)
	reagent_mix = REAGENT_REPLACE //Simplify end product
	result = /obj/item/chems/food/redcurry

/decl/recipe/greencurry
	appliance = APPLIANCE_SKILLET
	reagents = list(/decl/material/liquid/drink/milk/cream = 5, /decl/material/solid/spacespice = 2, /decl/material/liquid/nutriment/rice = 5)
	fruit = list("chili" = 1)
	items = list(
		/obj/item/chems/food/tofu = 2
	)
	reagent_mix = REAGENT_REPLACE //Simplify end product
	result = /obj/item/chems/food/greencurry

/decl/recipe/yellowcurry
	appliance = APPLIANCE_SKILLET
	reagents = list(/decl/material/liquid/drink/milk/cream = 5, /decl/material/solid/spacespice = 2, /decl/material/liquid/nutriment/rice = 5)
	fruit = list("peanut" = 2, "potato" = 1)
	reagent_mix = REAGENT_REPLACE //Simplify end product
	result = /obj/item/chems/food/yellowcurry

/decl/recipe/simmered/friedrice
	appliance = APPLIANCE_SKILLET | APPLIANCE_SAUCEPAN
	reagents = list(/decl/material/liquid/water = 5, /decl/material/liquid/nutriment/rice = 10, /decl/material/liquid/nutriment/soysauce = 5)
	fruit = list("carrot" = 1, "cabbage" = 1)
	reagent_mix = REAGENT_REPLACE //Simplify end product
	result = /obj/item/chems/food/friedrice

/decl/recipe/simmered/risotto
	reagents = list(/decl/material/liquid/ethanol/wine = 5, /decl/material/liquid/nutriment/rice = 10, /decl/material/solid/spacespice = 1)
	fruit = list("mushroom" = 1)
	reagent_mix = REAGENT_REPLACE //Get that rice and wine outta here
	result = /obj/item/chems/food/risotto

/decl/recipe/simmered/bibimbap
	fruit = list("carrot" = 1, "cabbage" = 1, "mushroom" = 1)
	reagents = list(/decl/material/liquid/nutriment/rice = 5, /decl/material/solid/spacespice = 2)
	items = list(
		/obj/item/chems/food/egg = 1,
		/obj/item/chems/food/cutlet = 1
	)
	reagent_mix = REAGENT_REPLACE //Simplify end product
	result = /obj/item/chems/food/bibimbap

/decl/recipe/simmered/porkbowl
	reagents = list(/decl/material/liquid/water = 5, /decl/material/liquid/nutriment/rice = 10)
	reagent_mix = REAGENT_REPLACE
	items = list(
		/obj/item/chems/food/bacon = 1
	)
	result = /obj/item/chems/food/porkbowl