/decl/recipe/cubancarp
	appliance = APPLIANCE_FRYER
	fruit = list("chili" = 1)
	coating = /decl/material/liquid/nutriment/batter
	items = list(
		/obj/item/chems/food/fish
	)
	result = /obj/item/chems/food/cubancarp

/decl/recipe/fishandchips
	appliance = APPLIANCE_FRYER
	items = list(
		/obj/item/chems/food/fries,
		/obj/item/chems/food/fish
	)
	reagent_mix = REAGENT_REPLACE // we don't want the fries to show up twice
	result = /obj/item/chems/food/fishandchips

/decl/recipe/katsucurry
	appliance = APPLIANCE_FRYER
	fruit = list("apple" = 1, "carrot" = 1, "potato" = 1)
	reagents = list(/decl/material/liquid/water = 10, /decl/material/liquid/nutriment/rice = 10, /decl/material/liquid/nutriment/flour = 5)
	items = list(
		/obj/item/chems/food/meat/chicken
	)
	reagent_mix = REAGENT_REPLACE // get the raw reagents out of there
	result = /obj/item/chems/food/katsucurry

/decl/recipe/fishfingers
	appliance = APPLIANCE_FRYER
	items = list(
		/obj/item/chems/food/fish
	)
	coating = /decl/material/liquid/nutriment/batter
	result = /obj/item/chems/food/fishfingers

/decl/recipe/fries
	display_name = "potato chips"
	appliance = APPLIANCE_FRYER
	items = list(
		/obj/item/chems/food/rawsticks
	)
	reagent_mix = REAGENT_REPLACE // get the raw potato out of there
	result = /obj/item/chems/food/fries

/decl/recipe/onionrings
	appliance = APPLIANCE_FRYER
	fruit = list("onion" = 1)
	coating = /decl/material/liquid/nutriment/batter
	reagents = list(/decl/material/liquid/nutriment/batter = 10)
	result = /obj/item/chems/food/onionrings

/decl/recipe/jellydonut
	display_name = "berry jelly donut"
	appliance = APPLIANCE_FRYER
	reagents = list(/decl/material/liquid/drink/juice/berry = 5, /decl/material/liquid/nutriment/sugar = 5)
	items = list(
		/obj/item/chems/food/dough
	)
	reagent_mix = REAGENT_REPLACE // simplify end product
	result = /obj/item/chems/food/donut/jelly/berry

/decl/recipe/jellydonut/cherry
	display_name = "cherry jelly donut"
	reagents = list(/decl/material/liquid/nutriment/cherryjelly = 5, /decl/material/liquid/nutriment/sugar = 5)
	result = /obj/item/chems/food/donut/jelly

/decl/recipe/donut
	display_name = "plain donut"
	appliance = APPLIANCE_FRYER
	reagents = list(/decl/material/liquid/nutriment/sugar = 5)
	items = list(
		/obj/item/chems/food/dough
	)
	reagent_mix = REAGENT_REPLACE // simplify end product
	result = /obj/item/chems/food/donut/unfrosted