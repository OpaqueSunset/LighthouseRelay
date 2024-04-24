/decl/recipe/jpoppers
	appliance = APPLIANCE_FRYER
	fruit = list("chili" = 4)
	coating = /decl/material/liquid/nutriment/batter
	items = list(
		/obj/item/chems/food/cheesewedge = 1
	)
	result = /obj/item/chems/food/jalapeno_poppers
	result_quantity = 4

/decl/recipe/risottoballs
	appliance = APPLIANCE_FRYER
	reagents = list(/decl/material/solid/sodiumchloride = 1, /decl/material/solid/blackpepper = 1)
	items = list(/obj/item/chems/food/risotto = 1)
	coating = /decl/material/liquid/nutriment/batter
	reagent_mix = REAGENT_REPLACE //Simplify end product
	result = /obj/item/chems/food/risottoballs

/decl/recipe/friedmushroom
	appliance = APPLIANCE_FRYER
	fruit = list("plumphelmet" = 1)
	coating = /decl/material/liquid/nutriment/batter/beerbatter
	reagent_mix = REAGENT_REPLACE //Simplify end product
	result = /obj/item/chems/food/friedmushroom

/decl/recipe/batteredsausage
	appliance = APPLIANCE_FRYER
	items = list(
		/obj/item/chems/food/sausage = 1
	)
	result = /obj/item/chems/food/sausage/battered
	coating = /decl/material/liquid/nutriment/batter

/decl/recipe/katsu
	appliance = APPLIANCE_FRYER
	items = list(
		/obj/item/chems/food/butchery/meat/chicken = 1
	)
	result = /obj/item/chems/food/chickenkatsu
	coating = /decl/material/liquid/nutriment/batter/beerbatter

/decl/recipe/pizzacrunch_1
	display_name = "premade pizza crunch"
	appliance = APPLIANCE_FRYER
	items = list(
		/obj/item/chems/food/sliceable/pizza = 1
	)
	result = /obj/item/chems/food/sliceable/pizza/crunch
	coating = /decl/material/liquid/nutriment/batter

//Alternate pizza crunch recipe for combination pizzas made in oven
/decl/recipe/pizzacrunch_2
	display_name = "custom pizza crunch"
	appliance = APPLIANCE_FRYER
	items = list(
		/obj/item/chems/food/variable/pizza = 1
	)
	result = /obj/item/chems/food/sliceable/pizza/crunch
	coating = /decl/material/liquid/nutriment/batter

/decl/recipe/funnelcake
	appliance = APPLIANCE_FRYER
	reagents = list(/decl/material/liquid/nutriment/sugar = 5, /decl/material/liquid/nutriment/batter = 10)
	result = /obj/item/chems/food/funnelcake

/decl/recipe/pisanggoreng
	appliance = APPLIANCE_FRYER
	fruit = list("banana" = 2)
	reagent_mix = REAGENT_REPLACE //Simplify end product
	result = /obj/item/chems/food/pisanggoreng
	coating = /decl/material/liquid/nutriment/batter

/decl/recipe/corn_dog
	appliance = APPLIANCE_FRYER
	items = list(
		/obj/item/chems/food/sausage = 1
	)
	fruit = list("corn" = 1)
	coating = /decl/material/liquid/nutriment/batter
	result = /obj/item/chems/food/corn_dog