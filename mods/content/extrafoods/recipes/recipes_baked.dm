/decl/recipe/brownies
	display_name = "chocolate brownies"
	appliance = APPLIANCE_OVEN
	reagents = list(/decl/material/liquid/nutriment/browniemix = 10, /decl/material/solid/organic/meat/egg = 3)
	reagent_mix = REAGENT_REPLACE //No egg or mix in final recipe
	result = /obj/item/chems/food/sliceable/brownies

/decl/recipe/cosmicbrownies
	appliance = APPLIANCE_OVEN
	reagents = list(/decl/material/liquid/nutriment/browniemix = 10, /decl/material/solid/organic/meat/egg = 3)
	fruit = list("ambrosiavulgaris" = 1)
	reagent_mix = REAGENT_REPLACE //No egg or mix in final recipe
	result = /obj/item/chems/food/sliceable/cosmicbrownies

/decl/recipe/honeybun
	appliance = APPLIANCE_OVEN
	items = list(
		/obj/item/chems/food/dough = 1
	)
	reagents = list(/decl/material/liquid/nutriment/honey = 5)
	result = /obj/item/chems/food/honeybun
	result_quantity = 4

/decl/recipe/keylimepie
	appliance = APPLIANCE_OVEN
	fruit = list("lime slice" = 2)
	reagents = list(/decl/material/liquid/drink/milk = 5, /decl/material/liquid/nutriment/sugar = 5, /decl/material/solid/organic/meat/egg = 3, /decl/material/liquid/nutriment/flour = 10)
	result = /obj/item/chems/food/sliceable/keylimepie
	reagent_mix = REAGENT_REPLACE //No raw egg in finished product, protein after cooking causes magic meatballs otherwise

/decl/recipe/quiche
	appliance = APPLIANCE_OVEN
	reagents = list(/decl/material/liquid/nutriment/batter = 15)
	items = list(/obj/item/chems/food/cheesewedge)
	result = /obj/item/chems/food/sliceable/quiche
	reagent_mix = REAGENT_REPLACE //No raw egg in finished product, protein after cooking causes magic meatballs otherwise

/decl/recipe/muffin/berry
	display_name = null // autoset
	fruit = list("berries" = 1)
	result = /obj/item/chems/food/berrymuffin

/decl/recipe/croissant
	appliance = APPLIANCE_OVEN
	reagents = list(/decl/material/liquid/nutriment/batter = 5, /decl/material/solid/sodiumchloride = 1, /decl/material/liquid/water = 5, /decl/material/liquid/drink/milk = 5)
	reagent_mix = REAGENT_REPLACE
	result = /obj/item/chems/food/croissant

/decl/recipe/cinnamonbun
	appliance = APPLIANCE_OVEN
	reagents = list(/decl/material/liquid/nutriment/sugar = 15, /decl/material/liquid/drink/milk/cream = 10, /decl/material/solid/cinnamon = 5)
	items = list(
		/obj/item/chems/food/dough = 1
	)
	result = /obj/item/chems/food/cinnamonbun
	result_quantity = 4

/decl/recipe/sugarcookie
	appliance = APPLIANCE_OVEN
	reagents = list(/decl/material/liquid/nutriment/batter/cakebatter = 5, /decl/material/liquid/nutriment/sugar = 5, /decl/material/solid/organic/meat/egg = 3)
	reagent_mix = REAGENT_REPLACE // Don't include the cakebatter
	result = /obj/item/chems/food/sugarcookie
	result_quantity = 4 // so that it's economically feasible to make a batch
