/decl/recipe/simmered/kitsuneudon
	container_categories = RECIPE_CATEGORY_MICROWAVE | RECIPE_CATEGORY_SAUCEPAN | RECIPE_CATEGORY_POT
	reagents = list(/decl/material/solid/organic/meat/egg = 3)
	items = list(
		/obj/item/food/spagetti = 1,
		/obj/item/food/tofu = 1
	)
	result = /obj/item/food/kitsuneudon

/decl/recipe/simmered/lomein
	container_categories = RECIPE_CATEGORY_MICROWAVE | RECIPE_CATEGORY_SAUCEPAN | RECIPE_CATEGORY_POT
	reagents = list(/decl/material/liquid/water = 5, /decl/material/liquid/nutriment/soysauce = 5)
	fruit = list("carrot" = 1, "cabbage" = 1)
	items = list(
		/obj/item/food/spagetti = 1
	)
	reagent_mix = REAGENT_REPLACE //Simplify end product
	result = /obj/item/food/lomein

/decl/recipe/simmered/chickennoodlesoup
	fruit = list("carrot" = 1)
	reagents = list(/decl/material/liquid/water = 10)
	items = list(/obj/item/food/spagetti = 1, /obj/item/food/butchery/cutlet/raw = 1)
	reagent_mix = REAGENT_REPLACE //Simplify end product
	result = /obj/item/food/chickennoodlesoup

/decl/recipe/simmered/macncheese
	reagents = list(/decl/material/liquid/drink/milk = 5)
	reagent_mix = REAGENT_REPLACE // no milk
	items = list(
		/obj/item/food/spagetti, // todo: different pasta types?
		/obj/item/food/dairy/cheese/wedge
	)
	result = /obj/item/food/macncheese