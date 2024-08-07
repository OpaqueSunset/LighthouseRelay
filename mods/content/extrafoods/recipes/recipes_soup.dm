/decl/recipe/simmered/onionsoup
	fruit = list("onion" = 1)
	reagents = list(/decl/material/liquid/water = 10)
	result = /obj/item/food/onionsoup

/decl/recipe/simmered/goulash
	fruit = list("tomato" = 1)
	reagents = list(/decl/material/liquid/water = 5)
	items = list(
		/obj/item/food/butchery/cutlet = 1,
		/obj/item/food/spagetti = 1
	)
	result = /obj/item/food/goulash

/decl/recipe/simmered/hotandsoursoup
	fruit = list("mushroom" = 1)
	reagents = list(/decl/material/solid/organic/meat/egg = 3, /decl/material/solid/sodiumchloride = 2, /decl/material/solid/blackpepper = 2, /decl/material/liquid/nutriment/vinegar = 2, /decl/material/liquid/nutriment/garlicsauce = 2, /decl/material/liquid/capsaicin = 2, /decl/material/liquid/water = 10)
	items = list(
		/obj/item/food/tofu = 1
	)
	result = /obj/item/food/hotandsoursoup