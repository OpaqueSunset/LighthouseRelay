/decl/recipe/steamed
	abstract_type = /decl/recipe/steamed
	appliance = APPLIANCE_SAUCEPAN|APPLIANCE_POT

/decl/recipe/steamed/chawanmushi
	fruit = list("mushroom" = 1)
	reagents = list(/decl/material/liquid/water = 10, /decl/material/liquid/nutriment/soysauce = 5)
	items = list(
		/obj/item/chems/food/egg = 2
	)
	reagent_mix = REAGENT_REPLACE // no raw egg
	result = /obj/item/chems/food/chawanmushi
