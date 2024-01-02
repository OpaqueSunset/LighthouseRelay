/decl/recipe/onionsoup
	appliance = APPLIANCE_SAUCEPAN | APPLIANCE_POT
	fruit = list("onion" = 1)
	reagents = list(/decl/material/liquid/water = 10)
	result = /obj/item/chems/food/onionsoup

/decl/recipe/goulash
	appliance = APPLIANCE_SAUCEPAN | APPLIANCE_POT
	fruit = list("tomato" = 1)
	reagents = list(/decl/material/liquid/water = 5)
	items = list(
		/obj/item/chems/food/cutlet = 1,
		/obj/item/chems/food/spagetti = 1
	)
	result = /obj/item/chems/food/goulash

/decl/recipe/hotandsoursoup
	appliance = APPLIANCE_SAUCEPAN | APPLIANCE_POT
	fruit = list("mushroom" = 1)
	reagents = list(/decl/material/liquid/nutriment/protein/egg = 3, /decl/material/solid/sodiumchloride = 2, /decl/material/solid/blackpepper = 2, /decl/material/liquid/nutriment/vinegar = 2, /decl/material/liquid/nutriment/garlicsauce = 2, /decl/material/liquid/capsaicin = 2, /decl/material/liquid/water = 10)
	items = list(
		/obj/item/chems/food/tofu = 1
	)
	result = /obj/item/chems/food/hotandsoursoup