/decl/recipe/simmered/kitsuneudon
	appliance = APPLIANCE_MICROWAVE | APPLIANCE_SAUCEPAN | APPLIANCE_POT
	reagents = list(/decl/material/solid/organic/meat/egg = 3)
	items = list(
		/obj/item/chems/food/spagetti = 1,
		/obj/item/chems/food/tofu = 1
	)
	result = /obj/item/chems/food/kitsuneudon

/decl/recipe/simmered/lomein
	appliance = APPLIANCE_MICROWAVE | APPLIANCE_SAUCEPAN | APPLIANCE_POT
	reagents = list(/decl/material/liquid/water = 5, /decl/material/liquid/nutriment/soysauce = 5)
	fruit = list("carrot" = 1, "cabbage" = 1)
	items = list(
		/obj/item/chems/food/spagetti = 1
	)
	reagent_mix = REAGENT_REPLACE //Simplify end product
	result = /obj/item/chems/food/lomein

/decl/recipe/simmered/chickennoodlesoup
	fruit = list("carrot" = 1)
	reagents = list(/decl/material/liquid/water = 10)
	items = list(/obj/item/chems/food/spagetti = 1, /obj/item/chems/food/rawcutlet = 1)
	reagent_mix = REAGENT_REPLACE //Simplify end product
	result = /obj/item/chems/food/chickennoodlesoup

/decl/recipe/simmered/macncheese
	reagents = list(/decl/material/liquid/drink/milk = 5)
	reagent_mix = REAGENT_REPLACE // no milk
	items = list(
		/obj/item/chems/food/spagetti, // todo: different pasta types?
		/obj/item/chems/food/cheesewedge
	)
	result = /obj/item/chems/food/macncheese