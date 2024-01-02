/decl/recipe/donkpocket
	appliance = APPLIANCE_OVEN
	items = list(
		/obj/item/chems/food/doughslice,
		/obj/item/chems/food/meatball
	)
	result = /obj/item/chems/food/donkpocket //SPECIAL

/decl/recipe/donkpocket/proc/warm_up(var/obj/item/chems/food/donkpocket/being_cooked)
	being_cooked.heat()

/decl/recipe/donkpocket/make_food(var/obj/container)
	. = ..(container)
	for(var/obj/item/chems/food/donkpocket/being_cooked in .)
		warm_up(being_cooked)

/decl/recipe/donkpocket/rawmeat
	items = list(
		/obj/item/chems/food/doughslice,
		/obj/item/chems/food/rawmeatball
	)

/decl/recipe/donkpocket/warm
	appliance = APPLIANCE_OVEN | APPLIANCE_MICROWAVE
	reagents = list() //This is necessary since this is a child object of the above recipe and we don't want donk pockets to need flour
	items = list(
		/obj/item/chems/food/donkpocket
	)
	result = /obj/item/chems/food/donkpocket //SPECIAL

/decl/recipe/donkpocket/warm/check_items(obj/container)
	. = ..()
	if(!.)
		return FALSE
	for(var/obj/item/chems/food/donkpocket/being_cooked in container.get_contained_external_atoms())
		if(!being_cooked.warm)
			return TRUE
	return FALSE

/decl/recipe/donkpocket/warm/make_food(var/obj/container)
	for(var/obj/item/chems/food/donkpocket/being_cooked in container.get_contained_external_atoms())
		if(!being_cooked.warm)
			warm_up(being_cooked)
			return list(being_cooked)

/decl/recipe/meatbread
	appliance = APPLIANCE_OVEN
	items = list(
		/obj/item/chems/food/dough = 2,
		/obj/item/chems/food/cutlet = 2,
		/obj/item/chems/food/cheesewedge = 2,
	)
	result = /obj/item/chems/food/sliceable/meatbread

/decl/recipe/xenomeatbread
	appliance = APPLIANCE_OVEN
	items = list(
		/obj/item/chems/food/dough = 2,
		/obj/item/chems/food/xenomeat = 2,
		/obj/item/chems/food/cheesewedge = 2,
	)
	result = /obj/item/chems/food/sliceable/xenomeatbread

/decl/recipe/bananabread
	appliance = APPLIANCE_OVEN
	fruit = list("banana" = 2)
	reagents = list(/decl/material/liquid/drink/milk = 5, /decl/material/liquid/nutriment/sugar = 5)
	items = list(
		/obj/item/chems/food/dough = 2,
	)
	reagent_mix = REAGENT_REPLACE // Don't include the milk or sugar
	result = /obj/item/chems/food/sliceable/bananabread

/decl/recipe/muffin
	appliance = APPLIANCE_OVEN
	reagents = list(/decl/material/liquid/nutriment/batter/cakebatter = 10)
	reagent_mix = REAGENT_REPLACE // simplify end product
	result = /obj/item/chems/food/muffin

/decl/recipe/eggplantparm
	appliance = APPLIANCE_OVEN
	fruit = list("eggplant" = 1)
	items = list(
		/obj/item/chems/food/cheesewedge = 2
		)
	result = /obj/item/chems/food/eggplantparm

/decl/recipe/pizzamargherita
	appliance = APPLIANCE_OVEN
	fruit = list("tomato" = 1)
	items = list(
		/obj/item/chems/food/sliceable/flatdough,
		/obj/item/chems/food/cheesewedge = 3,
	)
	result = /obj/item/chems/food/sliceable/pizza/margherita

/decl/recipe/meatpizza
	appliance = APPLIANCE_OVEN
	fruit = list("tomato" = 1)
	items = list(
		/obj/item/chems/food/sliceable/flatdough,
		/obj/item/chems/food/cutlet = 2,
		/obj/item/chems/food/cheesewedge
	)
	result = /obj/item/chems/food/sliceable/pizza/meatpizza

/decl/recipe/mushroompizza
	appliance = APPLIANCE_OVEN
	fruit = list("mushroom" = 5, "tomato" = 1)
	items = list(
		/obj/item/chems/food/sliceable/flatdough,
		/obj/item/chems/food/cheesewedge
	)
	result = /obj/item/chems/food/sliceable/pizza/mushroompizza

/decl/recipe/vegetablepizza
	appliance = APPLIANCE_OVEN
	fruit = list("eggplant" = 1, "carrot" = 1, "corn" = 1, "tomato" = 1)
	items = list(
		/obj/item/chems/food/sliceable/flatdough,
		/obj/item/chems/food/cheesewedge
	)
	result = /obj/item/chems/food/sliceable/pizza/vegetablepizza

/decl/recipe/spacylibertyduff
	appliance = APPLIANCE_OVEN
	reagents = list(/decl/material/liquid/water = 10, /decl/material/liquid/ethanol/vodka = 5, /decl/material/liquid/psychotropics = 5)
	reagent_mix = REAGENT_REPLACE // Don't include the water
	result = /obj/item/chems/food/spacylibertyduff

/decl/recipe/cookie
	appliance = APPLIANCE_OVEN
	reagents = list(/decl/material/liquid/nutriment/batter/cakebatter = 5, /decl/material/liquid/nutriment/coco = 5)
	reagent_mix = REAGENT_REPLACE // Don't include the cakebatter
	result = /obj/item/chems/food/cookie

/decl/recipe/fortunecookie
	appliance = APPLIANCE_OVEN|APPLIANCE_FRYER
	reagents = list(/decl/material/liquid/nutriment/sugar = 5)
	items = list(
		/obj/item/chems/food/doughslice // our check_items override already handles the paper
	)
	result = /obj/item/chems/food/fortunecookie

/decl/recipe/fortunecookie/make_food(obj/container)
	. = ..(container)
	var/obj/item/paper/paper = locate() in container.get_contained_external_atoms()
	for (var/obj/item/chems/food/fortunecookie/being_cooked in .)
		paper.forceMove(being_cooked)
		being_cooked.trash = paper //so the paper is left behind as trash
		return

/decl/recipe/fortunecookie/check_items(var/obj/container)
	. = ..()
	if (.)
		var/obj/item/paper/paper = locate() in container
		if (!paper || !istype(paper))
			return FALSE

/decl/recipe/tofubread
	appliance = APPLIANCE_OVEN
	items = list(
		/obj/item/chems/food/dough = 3,
		/obj/item/chems/food/tofu = 3,
		/obj/item/chems/food/cheesewedge = 3,
	)
	result = /obj/item/chems/food/sliceable/tofubread

/decl/recipe/meatpie
	appliance = APPLIANCE_OVEN
	items = list(
		/obj/item/chems/food/sliceable/flatdough,
		/obj/item/chems/food/cutlet
	)
	result = /obj/item/chems/food/meatpie

/decl/recipe/tofupie
	appliance = APPLIANCE_OVEN
	items = list(
		/obj/item/chems/food/sliceable/flatdough,
		/obj/item/chems/food/tofu,
	)
	result = /obj/item/chems/food/tofupie

/decl/recipe/xemeatpie
	appliance = APPLIANCE_OVEN
	items = list(
		/obj/item/chems/food/sliceable/flatdough,
		/obj/item/chems/food/xenomeat,
	)
	result = /obj/item/chems/food/xemeatpie

/decl/recipe/bananapie
	appliance = APPLIANCE_OVEN
	fruit = list("banana" = 1)
	reagents = list(/decl/material/liquid/nutriment/sugar = 5)
	items = list(/obj/item/chems/food/sliceable/flatdough)
	reagent_mix = REAGENT_REPLACE // Don't include the sugar
	result = /obj/item/chems/food/bananapie

/decl/recipe/cherrypie
	appliance = APPLIANCE_OVEN
	fruit = list("cherries" = 1)
	reagents = list(/decl/material/liquid/nutriment/sugar = 10)
	items = list(
		/obj/item/chems/food/sliceable/flatdough,
	)
	reagent_mix = REAGENT_REPLACE // Don't include the sugar
	result = /obj/item/chems/food/cherrypie

/decl/recipe/berryclafoutis
	appliance = APPLIANCE_OVEN
	fruit = list("berries" = 1)
	items = list(
		/obj/item/chems/food/sliceable/flatdough,
	)
	result = /obj/item/chems/food/berryclafoutis

/decl/recipe/chaosdonut
	appliance = APPLIANCE_OVEN
	reagents = list(/decl/material/liquid/frostoil = 5, /decl/material/liquid/capsaicin = 5, /decl/material/liquid/nutriment/sugar = 5)
	items = list(
		/obj/item/chems/food/dough
	)
	reagent_mix = REAGENT_REPLACE // special case; chaos donut adds random reagents
	result = /obj/item/chems/food/donut/chaos

/decl/recipe/amanita_pie
	appliance = APPLIANCE_OVEN
	reagents = list(/decl/material/liquid/amatoxin = 5)
	items = list(/obj/item/chems/food/sliceable/flatdough)
	result = /obj/item/chems/food/amanita_pie

/decl/recipe/plump_pie
	appliance = APPLIANCE_OVEN
	fruit = list("plumphelmet" = 1)
	items = list(/obj/item/chems/food/sliceable/flatdough)
	result = /obj/item/chems/food/plump_pie

/decl/recipe/enchiladas
	appliance = APPLIANCE_OVEN|APPLIANCE_FRYER
	fruit = list("chili" = 2, "corn" = 1)
	items = list(/obj/item/chems/food/cutlet)
	result = /obj/item/chems/food/enchiladas

/decl/recipe/creamcheesebread
	appliance = APPLIANCE_OVEN
	items = list(
		/obj/item/chems/food/dough = 2,
		/obj/item/chems/food/cheesewedge = 2,
	)
	result = /obj/item/chems/food/sliceable/creamcheesebread

/decl/recipe/monkeysdelight
	appliance = APPLIANCE_OVEN|APPLIANCE_MICROWAVE
	fruit = list("banana" = 1)
	reagents = list(/decl/material/solid/sodiumchloride = 1, /decl/material/solid/blackpepper = 1, /decl/material/liquid/nutriment/flour = 10)
	items = list(
		/obj/item/chems/food/monkeycube
	)
	reagent_mix = REAGENT_REPLACE // simplify end product
	result = /obj/item/chems/food/monkeysdelight

/decl/recipe/baguette
	appliance = APPLIANCE_OVEN
	reagents = list(/decl/material/solid/sodiumchloride = 1, /decl/material/solid/blackpepper = 1)
	items = list(
		/obj/item/chems/food/dough = 2,
	)
	result = /obj/item/chems/food/baguette

/decl/recipe/bun
	appliance = APPLIANCE_OVEN
	items = list(
		/obj/item/chems/food/dough
	)
	result = /obj/item/chems/food/bun

/decl/recipe/flatbread
	appliance = APPLIANCE_OVEN
	items = list(
		/obj/item/chems/food/sliceable/flatdough
	)
	result = /obj/item/chems/food/flatbread

/decl/recipe/bread
	appliance = APPLIANCE_OVEN
	items = list(
		/obj/item/chems/food/dough = 4
	)
	reagents = list(/decl/material/solid/sodiumchloride = 1)
	result = /obj/item/chems/food/sliceable/bread

/decl/recipe/poppypretzel
	appliance = APPLIANCE_OVEN
	fruit = list("poppy" = 1)
	items = list(/obj/item/chems/food/dough)
	result = /obj/item/chems/food/poppypretzel

/decl/recipe/applepie
	appliance = APPLIANCE_OVEN
	fruit = list("apple" = 1)
	items = list(/obj/item/chems/food/sliceable/flatdough)
	result = /obj/item/chems/food/applepie

/decl/recipe/pumpkinpie
	appliance = APPLIANCE_OVEN
	fruit = list("pumpkin" = 1)
	reagents = list(/decl/material/liquid/nutriment/sugar = 5)
	items = list(/obj/item/chems/food/sliceable/flatdough)
	reagent_mix = REAGENT_REPLACE // Remove the sugar
	result = /obj/item/chems/food/sliceable/pumpkinpie

/decl/recipe/plumphelmetbiscuit
	appliance = APPLIANCE_OVEN
	fruit = list("plumphelmet" = 1)
	reagents = list(/decl/material/liquid/nutriment/batter = 10)
	reagent_mix = REAGENT_REPLACE // Remove the batter
	result = /obj/item/chems/food/plumphelmetbiscuit

/decl/recipe/plumphelmetbiscuitvegan
	appliance = APPLIANCE_OVEN
	fruit = list("plumphelmet" = 1)
	reagents = list(/decl/material/liquid/nutriment/flour = 10, /decl/material/liquid/water = 10)
	reagent_mix = REAGENT_REPLACE // Remove the raw flour and the water
	result = /obj/item/chems/food/plumphelmetbiscuit

/decl/recipe/cracker
	appliance = APPLIANCE_OVEN
	reagents = list(/decl/material/solid/sodiumchloride = 1)
	items = list(
		/obj/item/chems/food/doughslice
	)
	result = /obj/item/chems/food/cracker

/decl/recipe/stuffing
	appliance = APPLIANCE_OVEN
	reagents = list(/decl/material/liquid/water = 10, /decl/material/solid/sodiumchloride = 1, /decl/material/solid/blackpepper = 1)
	items = list(
		/obj/item/chems/food/sliceable/bread,
	)
	reagent_mix = REAGENT_REPLACE // Remove the water
	result = /obj/item/chems/food/stuffing

/decl/recipe/tofurkey
	appliance = APPLIANCE_OVEN
	items = list(
		/obj/item/chems/food/tofu = 2,
		/obj/item/chems/food/stuffing,
	)
	result = /obj/item/chems/food/tofurkey

/decl/recipe/appletart
	appliance = APPLIANCE_OVEN
	fruit = list("goldapple" = 1)
	items = list(/obj/item/chems/food/sliceable/flatdough)
	reagent_mix = REAGENT_REPLACE // simplify end product
	result = /obj/item/chems/food/appletart

// Cakes.
/decl/recipe/cake
	appliance = APPLIANCE_OVEN
	reagents = list(/decl/material/liquid/nutriment/batter/cakebatter = 60)
	reagent_mix = REAGENT_REPLACE // simplify end product
	result = /obj/item/chems/food/sliceable/plaincake

/decl/recipe/cake/carrot
	fruit = list("carrot" = 3)
	result = /obj/item/chems/food/sliceable/carrotcake

/decl/recipe/cake/cheese
	items = list(
		/obj/item/chems/food/cheesewedge = 2
	)
	result = /obj/item/chems/food/sliceable/cheesecake

/decl/recipe/cake/orange
	fruit = list("orange" = 1)
	result = /obj/item/chems/food/sliceable/orangecake

/decl/recipe/cake/lime
	fruit = list("lime" = 1)
	result = /obj/item/chems/food/sliceable/limecake

/decl/recipe/cake/lemon
	fruit = list("lemon" = 1)
	result = /obj/item/chems/food/sliceable/lemoncake

/decl/recipe/cake/chocolate
	items = list(/obj/item/chems/food/chocolatebar)
	result = /obj/item/chems/food/sliceable/chocolatecake

/decl/recipe/cake/birthday
	reagents = list(/decl/material/liquid/nutriment/batter/cakebatter = 60, /decl/material/liquid/nutriment/sprinkles = 10)
	result = /obj/item/chems/food/sliceable/birthdaycake

/decl/recipe/cake/apple
	fruit = list("apple" = 2)
	result = /obj/item/chems/food/sliceable/applecake

/decl/recipe/cake/brain
	items = list(/obj/item/organ/internal/brain)
	result = /obj/item/chems/food/sliceable/braincake

/decl/recipe/cake/chocolatebar
	reagents = list(/decl/material/liquid/drink/milk/chocolate = 10, /decl/material/liquid/nutriment/coco = 5, /decl/material/liquid/nutriment/sugar = 5)
	reagent_mix = REAGENT_REPLACE // simplify end product
	result = /obj/item/chems/food/chocolatebar