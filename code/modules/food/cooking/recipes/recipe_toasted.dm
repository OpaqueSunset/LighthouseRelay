/decl/recipe/toasted
	container_categories = RECIPE_CATEGORY_SKILLET
	abstract_type = /decl/recipe/toasted
	//cooking_heat_type = COOKING_HEAT_DIRECT
	//cooking_medium_type = null

/decl/recipe/toasted/waffles
	reagents = list(/decl/material/liquid/nutriment/batter/cakebatter = 20)
	reagent_mix = REAGENT_REPLACE // the batter should be cooked
	result = /obj/item/chems/food/waffles

/decl/recipe/toasted/pancakes/blu
	fruit = list("blueberries" = 2)
	result = /obj/item/chems/food/pancakesblu

/decl/recipe/toasted/pancakes
	display_name = "plain pancakes"
	reagents = list(/decl/material/liquid/nutriment/batter = 20)
	reagent_mix = REAGENT_REPLACE // the batter should be cooked
	result = /obj/item/chems/food/pancakes

/decl/recipe/toasted/friedegg
	reagents = list(/decl/material/solid/sodiumchloride = 1, /decl/material/solid/blackpepper = 1)
	items = list(
		/obj/item/chems/food/egg
	)
	reagent_mix = REAGENT_REPLACE // no raw egg
	result = /obj/item/chems/food/friedegg

/decl/recipe/toasted/omelette
	items = list(
		/obj/item/chems/food/egg = 2,
		/obj/item/chems/food/cheesewedge,
	)
	reagent_mix = REAGENT_REPLACE // no raw egg
	result = /obj/item/chems/food/omelette
