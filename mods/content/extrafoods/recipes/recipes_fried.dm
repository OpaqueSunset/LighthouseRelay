/decl/recipe/fried/jpoppers
	fruit = list("chili" = 4)
	coating = /decl/material/liquid/nutriment/batter
	items = list(
		/obj/item/food/cheesewedge = 1
	)
	result = /obj/item/food/jalapeno_poppers
	result_quantity = 4

/decl/recipe/fried/risottoballs
	reagents = list(/decl/material/solid/sodiumchloride = 1, /decl/material/solid/blackpepper = 1)
	items = list(/obj/item/food/risotto = 1)
	coating = /decl/material/liquid/nutriment/batter
	reagent_mix = REAGENT_REPLACE //Simplify end product
	result = /obj/item/food/risottoballs

/decl/recipe/friedmushroom
	fruit = list("plumphelmet" = 1)
	coating = /decl/material/liquid/nutriment/batter/beerbatter
	reagent_mix = REAGENT_REPLACE //Simplify end product
	result = /obj/item/food/friedmushroom

/decl/recipe/fried/batteredsausage
	items = list(
		/obj/item/food/sausage = 1
	)
	result = /obj/item/food/sausage/battered
	coating = /decl/material/liquid/nutriment/batter

/decl/recipe/fried/katsu
	items = list(
		/obj/item/food/butchery/meat/chicken = 1
	)
	result = /obj/item/food/chickenkatsu
	coating = /decl/material/liquid/nutriment/batter/beerbatter

/decl/recipe/fried/pizzacrunch_1
	display_name = "premade pizza crunch"
	items = list(
		/obj/item/food/sliceable/pizza = 1
	)
	result = /obj/item/food/sliceable/pizza/crunch
	coating = /decl/material/liquid/nutriment/batter

//Alternate pizza crunch recipe for combination pizzas made in oven
/decl/recipe/fried/pizzacrunch_2
	display_name = "custom pizza crunch"
	items = list(
		/obj/item/food/variable/pizza = 1
	)
	result = /obj/item/food/sliceable/pizza/crunch
	coating = /decl/material/liquid/nutriment/batter

/decl/recipe/fried/funnelcake
	reagents = list(/decl/material/liquid/nutriment/sugar = 5, /decl/material/liquid/nutriment/batter = 10)
	result = /obj/item/food/funnelcake

/decl/recipe/fried/pisanggoreng
	fruit = list("banana" = 2)
	reagent_mix = REAGENT_REPLACE //Simplify end product
	result = /obj/item/food/pisanggoreng
	coating = /decl/material/liquid/nutriment/batter

/decl/recipe/fried/corn_dog
	items = list(
		/obj/item/food/sausage = 1
	)
	fruit = list("corn" = 1)
	coating = /decl/material/liquid/nutriment/batter
	result = /obj/item/food/corn_dog