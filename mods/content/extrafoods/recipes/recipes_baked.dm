/decl/recipe/baked/brownies
	display_name = "chocolate brownies"
	container_categories = RECIPE_CATEGORY_OVEN
	reagents = list(/decl/material/liquid/nutriment/browniemix = 10, /decl/material/solid/organic/meat/egg = 3)
	reagent_mix = REAGENT_REPLACE //No egg or mix in final recipe
	result = /obj/item/food/sliceable/brownies

/decl/recipe/baked/cosmicbrownies
	container_categories = RECIPE_CATEGORY_OVEN
	reagents = list(/decl/material/liquid/nutriment/browniemix = 10, /decl/material/solid/organic/meat/egg = 3)
	fruit = list("ambrosiavulgaris" = 1)
	reagent_mix = REAGENT_REPLACE //No egg or mix in final recipe
	result = /obj/item/food/sliceable/cosmicbrownies

/decl/recipe/baked/honeybun
	container_categories = RECIPE_CATEGORY_OVEN
	items = list(
		/obj/item/food/dough = 1
	)
	reagents = list(/decl/material/liquid/nutriment/honey = 5)
	result = /obj/item/food/honeybun
	result_quantity = 4

/decl/recipe/baked/keylimepie
	container_categories = RECIPE_CATEGORY_OVEN
	fruit = list("lime slice" = 2)
	reagents = list(/decl/material/liquid/drink/milk = 5, /decl/material/liquid/nutriment/sugar = 5, /decl/material/solid/organic/meat/egg = 3, /decl/material/liquid/nutriment/flour = 10)
	result = /obj/item/food/sliceable/keylimepie
	reagent_mix = REAGENT_REPLACE //No raw egg in finished product, protein after cooking causes magic meatballs otherwise

/decl/recipe/baked/quiche
	container_categories = RECIPE_CATEGORY_OVEN
	reagents = list(/decl/material/liquid/nutriment/batter = 15)
	items = list(/obj/item/food/cheesewedge)
	result = /obj/item/food/sliceable/quiche
	reagent_mix = REAGENT_REPLACE //No raw egg in finished product, protein after cooking causes magic meatballs otherwise

/decl/recipe/baked/muffin/berry
	display_name = null // autoset
	fruit = list("berries" = 1)
	result = /obj/item/food/berrymuffin

/decl/recipe/baked/croissant
	reagents = list(/decl/material/liquid/nutriment/batter = 5, /decl/material/solid/sodiumchloride = 1, /decl/material/liquid/water = 5, /decl/material/liquid/drink/milk = 5)
	reagent_mix = REAGENT_REPLACE
	result = /obj/item/food/croissant

/decl/recipe/baked/cinnamonbun
	container_categories = RECIPE_CATEGORY_OVEN
	reagents = list(/decl/material/liquid/nutriment/sugar = 15, /decl/material/liquid/drink/milk/cream = 10, /decl/material/solid/cinnamon = 5)
	items = list(
		/obj/item/food/dough = 1
	)
	result = /obj/item/food/cinnamonbun
	result_quantity = 4

/decl/recipe/baked/sugarcookie
	container_categories = RECIPE_CATEGORY_OVEN
	reagents = list(/decl/material/liquid/nutriment/batter/cakebatter = 5, /decl/material/liquid/nutriment/sugar = 5, /decl/material/solid/organic/meat/egg = 3)
	reagent_mix = REAGENT_REPLACE // Don't include the cakebatter
	result = /obj/item/food/sugarcookie
	result_quantity = 4 // so that it's economically feasible to make a batch
