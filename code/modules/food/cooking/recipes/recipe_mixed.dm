/decl/recipe/chocolateegg
	container_categories = RECIPE_CATEGORY_SAUCEPAN|RECIPE_CATEGORY_POT // melt the chocolate
	items = list(
		/obj/item/chems/food/egg,
		/obj/item/chems/food/chocolatebar,
	)
	reagent_mix = REAGENT_REPLACE // no raw egg
	result = /obj/item/chems/food/chocolateegg

/decl/recipe/candiedapple
	container_categories = RECIPE_CATEGORY_SAUCEPAN
	fruit = list("apple" = 1)
	reagents = list(/decl/material/liquid/water = 10, /decl/material/liquid/nutriment/sugar = 5)
	reagent_mix = REAGENT_REPLACE // simplify end product
	result = /obj/item/chems/food/candiedapple

/decl/recipe/cherrysandwich
	reagents = list(/decl/material/liquid/nutriment/cherryjelly = 5)
	items = list(
		/obj/item/chems/food/slice/bread = 2,
	)
	result = /obj/item/chems/food/jellysandwich/cherry
