/decl/recipe/friedegg
	appliance = APPLIANCE_SKILLET
	reagents = list(/decl/material/solid/sodiumchloride = 1, /decl/material/solid/blackpepper = 1)
	items = list(
		/obj/item/chems/food/egg
	)
	result = /obj/item/chems/food/friedegg

/decl/recipe/chocolateegg
	appliance = APPLIANCE_SAUCEPAN|APPLIANCE_POT // melt the chocolate
	items = list(
		/obj/item/chems/food/egg,
		/obj/item/chems/food/chocolatebar,
	)
	result = /obj/item/chems/food/chocolateegg

/decl/recipe/sausage
	appliance = APPLIANCE_SKILLET
	items = list(
		/obj/item/chems/food/rawmeatball,
		/obj/item/chems/food/rawcutlet,
	)
	result = /obj/item/chems/food/sausage

/decl/recipe/fatsausage
	appliance = APPLIANCE_SKILLET
	reagents = list(/decl/material/solid/blackpepper = 2)
	items = list(
		/obj/item/chems/food/rawmeatball,
		/obj/item/chems/food/rawcutlet,
	)
	result = /obj/item/chems/food/fatsausage

/decl/recipe/candiedapple
	appliance = APPLIANCE_SAUCEPAN
	fruit = list("apple" = 1)
	reagents = list(/decl/material/liquid/water = 10, /decl/material/liquid/nutriment/sugar = 5)
	reagent_mix = REAGENT_REPLACE // simplify end product
	result = /obj/item/chems/food/candiedapple

/decl/recipe/chawanmushi
	appliance = APPLIANCE_SAUCEPAN|APPLIANCE_POT // steamed
	fruit = list("mushroom" = 1)
	reagents = list(/decl/material/liquid/water = 10, /decl/material/liquid/nutriment/soysauce = 5)
	items = list(
		/obj/item/chems/food/egg = 2
	)
	reagent_mix = REAGENT_REPLACE // simplify end product
	result = /obj/item/chems/food/chawanmushi

/decl/recipe/bloodsoup
	appliance = APPLIANCE_MICROWAVE|APPLIANCE_SAUCEPAN|APPLIANCE_POT
	reagents = list(/decl/material/liquid/blood = 30)
	reagent_mix = REAGENT_REPLACE // simplify end product
	result = /obj/item/chems/food/bloodsoup

/decl/recipe/mysterysoup
	appliance = APPLIANCE_MICROWAVE|APPLIANCE_SAUCEPAN|APPLIANCE_POT
	reagents = list(/decl/material/liquid/water = 10)
	items = list(
		/obj/item/chems/food/badrecipe,
		/obj/item/chems/food/tofu,
		/obj/item/chems/food/egg,
		/obj/item/chems/food/cheesewedge,
	)
	reagent_mix = REAGENT_REPLACE // simplify end product
	result = /obj/item/chems/food/mysterysoup

/decl/recipe/mushroomsoup
	appliance = APPLIANCE_MICROWAVE|APPLIANCE_SAUCEPAN|APPLIANCE_POT
	fruit = list("mushroom" = 1)
	reagents = list(/decl/material/liquid/drink/milk = 10)
	reagent_mix = REAGENT_REPLACE // simplify end product
	result = /obj/item/chems/food/mushroomsoup

/decl/recipe/beetsoup
	appliance = APPLIANCE_MICROWAVE|APPLIANCE_SAUCEPAN|APPLIANCE_POT
	fruit = list("whitebeet" = 1, "cabbage" = 1)
	reagents = list(/decl/material/liquid/water = 10)
	reagent_mix = REAGENT_REPLACE // simplify end product
	result = /obj/item/chems/food/beetsoup

/decl/recipe/milosoup
	appliance = APPLIANCE_MICROWAVE|APPLIANCE_SAUCEPAN|APPLIANCE_POT
	reagents = list(/decl/material/liquid/water = 10)
	items = list(
		/obj/item/chems/food/soydope = 2,
		/obj/item/chems/food/tofu = 2,
	)
	reagent_mix = REAGENT_REPLACE // simplify end product
	result = /obj/item/chems/food/milosoup

/decl/recipe/tomatosoup
	appliance = APPLIANCE_MICROWAVE|APPLIANCE_SAUCEPAN|APPLIANCE_POT
	fruit = list("tomato" = 2)
	reagents = list(/decl/material/liquid/water = 10)
	reagent_mix = REAGENT_REPLACE // simplify end product
	result = /obj/item/chems/food/tomatosoup

/decl/recipe/meatballsoup
	appliance = APPLIANCE_MICROWAVE|APPLIANCE_SAUCEPAN|APPLIANCE_POT
	fruit = list("carrot" = 1, "potato" = 1)
	reagents = list(/decl/material/liquid/water = 10)
	items = list(/obj/item/chems/food/meatball)
	reagent_mix = REAGENT_REPLACE // simplify end product
	result = /obj/item/chems/food/meatballsoup

/decl/recipe/vegetablesoup
	appliance = APPLIANCE_MICROWAVE|APPLIANCE_SAUCEPAN|APPLIANCE_POT
	fruit = list("carrot" = 1, "potato" = 1, "corn" = 1, "eggplant" = 1)
	reagents = list(/decl/material/liquid/water = 10)
	reagent_mix = REAGENT_REPLACE // simplify end product
	result = /obj/item/chems/food/vegetablesoup

/decl/recipe/nettlesoup
	appliance = APPLIANCE_MICROWAVE|APPLIANCE_SAUCEPAN|APPLIANCE_POT
	fruit = list("nettle" = 1, "potato" = 1)
	reagents = list(/decl/material/liquid/water = 10)
	items = list(
		/obj/item/chems/food/egg
	)
	reagent_mix = REAGENT_REPLACE // simplify end product
	result = /obj/item/chems/food/nettlesoup

/decl/recipe/wishsoup
	appliance = APPLIANCE_MICROWAVE|APPLIANCE_SAUCEPAN|APPLIANCE_POT // microwave works, because desperation
	reagents = list(/decl/material/liquid/water = 20)
	reagent_mix = REAGENT_REPLACE // simplify end product
	result= /obj/item/chems/food/wishsoup

/decl/recipe/hotchili
	appliance = APPLIANCE_MICROWAVE|APPLIANCE_SAUCEPAN|APPLIANCE_POT
	fruit = list("chili" = 1, "tomato" = 1)
	items = list(/obj/item/chems/food/cutlet)
	result = /obj/item/chems/food/hotchili

/decl/recipe/coldchili
	appliance = APPLIANCE_MICROWAVE|APPLIANCE_SAUCEPAN|APPLIANCE_POT
	fruit = list("icechili" = 1, "tomato" = 1)
	items = list(/obj/item/chems/food/cutlet)
	result = /obj/item/chems/food/coldchili

/decl/recipe/stew
	appliance = APPLIANCE_MICROWAVE|APPLIANCE_SAUCEPAN|APPLIANCE_POT
	fruit = list("potato" = 1, "tomato" = 1, "carrot" = 1, "eggplant" = 1, "mushroom" = 1)
	reagents = list(/decl/material/liquid/water = 10)
	items = list(/obj/item/chems/food/meat)
	reagent_mix = REAGENT_REPLACE // simplify end product
	result = /obj/item/chems/food/stew

/decl/recipe/mint
	appliance = APPLIANCE_SAUCEPAN
	reagents = list(/decl/material/liquid/nutriment/sugar = 5, /decl/material/liquid/frostoil = 5)
	reagent_mix = REAGENT_REPLACE // simplify end product
	result = /obj/item/chems/food/mint

/decl/recipe/boiledspiderleg
	appliance = APPLIANCE_SAUCEPAN|APPLIANCE_POT
	reagents = list(/decl/material/liquid/water = 10)
	items = list(
		/obj/item/chems/food/spider
	)
	reagent_mix = REAGENT_REPLACE // simplify end product
	result = /obj/item/chems/food/spider/cooked

/decl/recipe/pelmeni_boiled
	appliance = APPLIANCE_SAUCEPAN|APPLIANCE_POT
	reagents = list(/decl/material/liquid/water = 10)
	items = list(
		/obj/item/chems/food/pelmen = 5
	)
	reagent_mix = REAGENT_REPLACE // simplify end product
	result = /obj/item/chems/food/pelmeni_boiled

/decl/recipe/meatball
	appliance = APPLIANCE_SKILLET|APPLIANCE_MICROWAVE
	items = list(
		/obj/item/chems/food/rawmeatball
	)
	result = /obj/item/chems/food/meatball

/decl/recipe/cutlet
	appliance = APPLIANCE_SKILLET|APPLIANCE_MICROWAVE
	items = list(
		/obj/item/chems/food/rawcutlet
	)
	result = /obj/item/chems/food/cutlet

/decl/recipe/ricepudding
	appliance = APPLIANCE_SAUCEPAN|APPLIANCE_POT
	reagents = list(/decl/material/liquid/drink/milk = 5, /decl/material/liquid/nutriment/rice = 10)
	reagent_mix = REAGENT_REPLACE // get the raw reagents out of there
	result = /obj/item/chems/food/ricepudding

/decl/recipe/stewedsoymeat
	appliance = APPLIANCE_SAUCEPAN|APPLIANCE_POT
	fruit = list("carrot" = 1, "tomato" = 1)
	items = list(
		/obj/item/chems/food/soydope = 2
	)
	result = /obj/item/chems/food/stewedsoymeat

/decl/recipe/boiledspagetti
	appliance = APPLIANCE_SAUCEPAN|APPLIANCE_POT
	reagents = list(/decl/material/liquid/water = 10)
	items = list(
		/obj/item/chems/food/spagetti,
	)
	reagent_mix = REAGENT_REPLACE // don't fill it with water
	result = /obj/item/chems/food/boiledspagetti

/decl/recipe/boiledegg
	appliance = APPLIANCE_SAUCEPAN|APPLIANCE_POT
	reagents = list(/decl/material/liquid/water = 10)
	items = list(
		/obj/item/chems/food/egg
	)
	reagent_mix = REAGENT_REPLACE // shouldn't fill it with water
	result = /obj/item/chems/food/boiledegg

/decl/recipe/waffles
	appliance = APPLIANCE_SKILLET // no waffle griddle, sadly
	reagents = list(/decl/material/liquid/nutriment/batter/cakebatter = 20)
	reagent_mix = REAGENT_REPLACE // the batter should be cooked
	result = /obj/item/chems/food/waffles

/decl/recipe/pancakes
	appliance = APPLIANCE_SKILLET
	reagents = list(/decl/material/liquid/nutriment/batter = 20)
	reagent_mix = REAGENT_REPLACE // the batter should be cooked
	result = /obj/item/chems/food/pancakes

/decl/recipe/pancakes/blu
	fruit = list("blueberries" = 2)
	result = /obj/item/chems/food/pancakesblu

/decl/recipe/omelette
	appliance = APPLIANCE_SKILLET
	reagents = list(/decl/material/liquid/nutriment/protein/egg = 6)
	items = list(
		/obj/item/chems/food/cheesewedge,
	)
	result = /obj/item/chems/food/omelette

/decl/recipe/soylenviridians
	appliance = APPLIANCE_SKILLET // considering it equivalent to waffles?
	fruit = list("soybeans" = 1)
	reagents = list(/decl/material/liquid/nutriment/flour = 10)
	reagent_mix = REAGENT_REPLACE // get the flour out of there
	result = /obj/item/chems/food/soylenviridians

/decl/recipe/soylentgreen
	appliance = APPLIANCE_SKILLET // considering it equivalent to waffles?
	reagents = list(/decl/material/liquid/nutriment/flour = 10)
	items = list(
		/obj/item/chems/food/meat/human = 2
	)
	reagent_mix = REAGENT_REPLACE // no flour
	result = /obj/item/chems/food/soylentgreen

/decl/recipe/amanitajelly
	appliance = APPLIANCE_SAUCEPAN
	reagents = list(/decl/material/liquid/water = 10, /decl/material/liquid/ethanol/vodka = 5, /decl/material/liquid/amatoxin = 5)
	reagent_mix = REAGENT_REPLACE // simplify end product
	result = /obj/item/chems/food/amanitajelly

/decl/recipe/amanitajelly/make_food(var/obj/container)
	. = ..(container)
	for(var/obj/item/chems/food/amanitajelly/being_cooked in .)
		being_cooked.reagents.clear_reagent(/decl/material/liquid/amatoxin)

/decl/recipe/toastedsandwich
	appliance = APPLIANCE_SKILLET
	items = list(
		/obj/item/chems/food/sandwich
	)
	result = /obj/item/chems/food/toastedsandwich

/decl/recipe/grilledcheese
	appliance = APPLIANCE_SKILLET
	items = list(
		/obj/item/chems/food/slice/bread = 2,
		/obj/item/chems/food/cheesewedge,
	)
	result = /obj/item/chems/food/grilledcheese
/decl/recipe/jelliedtoast
	appliance = APPLIANCE_SKILLET
	reagents = list(/decl/material/liquid/nutriment/cherryjelly = 5)
	items = list(
		/obj/item/chems/food/slice/bread,
	)
	result = /obj/item/chems/food/jelliedtoast/cherry