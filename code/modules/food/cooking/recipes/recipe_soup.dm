/decl/recipe/soup
	abstract_type = /decl/recipe/soup
	reagent_mix = REAGENT_REPLACE
	container_categories = RECIPE_CATEGORY_POT
	var/precursor_type

/decl/recipe/soup/stock
	abstract_type = /decl/recipe/soup/stock
	result_quantity = 10
	result = /decl/material/liquid/nutriment/soup/stock
	reagents = list(
		/decl/material/solid/sodiumchloride = 1,
		/decl/material/liquid/water = 10
	)
	minimum_temperature = 100 CELSIUS

/decl/recipe/soup/get_result_data(atom/container, list/used_ingredients)

	. = list()
	var/soup_flags = INGREDIENT_FLAG_PLAIN
	var/list/taste_strings = list()
	var/list/ingredients = list()
	var/list/used_items = used_ingredients["items"]

	if(length(used_items))

		for(var/obj/item/chems/food/food in used_items)
			if(food.nutriment_type && food.nutriment_desc)
				for(var/taste in food.nutriment_desc)
					taste_strings[taste] += food.nutriment_desc[taste]
			soup_flags |= food.ingredient_flags

		if(locate(/obj/item/chems/food/grown) in used_items)
			for(var/obj/item/chems/food/grown/veg in used_items)
				if(veg.seed)
					ingredients[veg.seed.product_name]++

		if(locate(/obj/item/chems/food/processed_grown) in used_items)
			for(var/obj/item/chems/food/processed_grown/veg in used_items)
				if(veg.seed)
					ingredients[veg.seed.product_name]++

		if(locate(/obj/item/chems/food/butchery) in used_items)
			for(var/obj/item/chems/food/butchery/meat in used_items)
				if(meat.meat_name)
					ingredients[meat.meat_name]++

	if(precursor_type)
		var/list/precursor_data = REAGENT_DATA(container.reagents, precursor_type)
		var/list/precursor_taste = LAZYACCESS(precursor_data, "taste")
		if(length(precursor_taste))
			for(var/taste in precursor_taste)
				taste_strings[taste] += precursor_taste["taste"]
		var/list/precursor_ingredients = LAZYACCESS(precursor_data, "soup_ingredients")
		if(length(precursor_ingredients))
			for(var/ingredient in precursor_ingredients)
				ingredients[ingredient] += precursor_ingredients[ingredient]
		var/precursor_soup_flags = LAZYACCESS(precursor_data, "soup_flags")
		if(precursor_soup_flags)
			soup_flags |= precursor_soup_flags

	if(length(taste_strings))
		.["taste"] = taste_strings
	if(length(ingredients))
		.["soup_ingredients"] = ingredients
	if(soup_flags)
		.["soup_flags"] = soup_flags

/decl/recipe/soup/stock/meat
	display_name = "meat stock"
	items = list(/obj/item/chems/food/butchery)
	completion_message = "The liquid darkens to a rich brown as the meat dissolves."

/decl/recipe/soup/stock/vegetable
	display_name = "vegetable stock"
	items = list(/obj/item/chems/food/grown)
	completion_message = "The liquid darkens to a rich brown as the vegetables dissolve."

/decl/recipe/soup/stock/bone
	display_name = "bone broth"
	items = list(/obj/item/stack/material/bone = 1)
	completion_message = "The liquid darkens to a rich brown as the marrow dissolves."

/decl/recipe/soup/stock/bone/get_result_data(atom/container, list/used_ingredients)
	. = list()
	.["soup_ingredients"] = list("marrow" = 1)
	.["soup_flags"] = INGREDIENT_FLAG_MEAT

/decl/recipe/soup/simple
	abstract_type = /decl/recipe/soup/simple
	reagents = list(
		/decl/material/liquid/nutriment/soup/stock = 10
	)
	result = /decl/material/liquid/nutriment/soup/simple
	result_quantity = 10
	completion_message = "A savoury smell rises from the soup as the ingredients release their flavour into the broth."
	precursor_type = /decl/material/liquid/nutriment/soup/stock

/decl/recipe/soup/simple/meat
	display_name = "simple meat soup"
	items = list(
		/obj/item/chems/food/butchery/chopped = 1
	)

/decl/recipe/soup/simple/veg
	display_name = "simple vegetable soup"
	items = list(
		/obj/item/chems/food/processed_grown/chopped = 1
	)

/decl/recipe/soup/simple/stew
	abstract_type = /decl/recipe/soup/simple/stew
	precursor_type = /decl/material/liquid/nutriment/soup/simple
	reagents = list(
		/decl/material/liquid/nutriment/soup/simple = 10
	)
	result_quantity = 10
	result = /decl/material/liquid/nutriment/soup/stew

/decl/recipe/soup/simple/stew/mixed
	display_name = "mixed stew"
	items = list(
		/obj/item/chems/food/butchery/chopped = 1,
		/obj/item/chems/food/processed_grown/chopped = 1
	)

/decl/recipe/soup/simple/stew/meat
	display_name = "meat stew"
	items = list(
		/obj/item/chems/food/butchery/chopped = 2
	)

/decl/recipe/soup/simple/stew/veg
	display_name = "vegetable stew"
	items = list(
		/obj/item/chems/food/processed_grown/chopped = 2
	)
