/decl/recipe/steamed
	abstract_type = /decl/recipe/steamed
	container_categories = RECIPE_CATEGORY_SAUCEPAN|RECIPE_CATEGORY_POT

/decl/recipe/steamed/chawanmushi
	fruit = list("mushroom" = 1)
	reagents = list(/decl/material/liquid/water = 10, /decl/material/liquid/nutriment/soysauce = 5)
	items = list(
		/obj/item/food/egg = 2
	)
	reagent_mix = REAGENT_REPLACE // no raw egg
	result = /obj/item/food/chawanmushi
