/decl/recipe/baked
	abstract_type = /decl/recipe/baked
	container_categories = RECIPE_CATEGORY_OVEN
	//cooking_heat_type = COOKING_HEAT_INDIRECT

/decl/recipe/baked/pizzamargherita
	fruit = list("tomato" = 1)
	items = list(
		/obj/item/chems/food/sliceable/flatdough,
		/obj/item/chems/food/cheesewedge = 3,
	)
	result = /obj/item/chems/food/sliceable/pizza/margherita

/decl/recipe/baked/meatpizza
	fruit = list("tomato" = 1)
	items = list(
		/obj/item/chems/food/sliceable/flatdough,
		/obj/item/chems/food/butchery/cutlet = 2,
		/obj/item/chems/food/cheesewedge
	)
	result = /obj/item/chems/food/sliceable/pizza/meatpizza

/decl/recipe/baked/mushroompizza
	fruit = list("mushroom" = 5, "tomato" = 1)
	items = list(
		/obj/item/chems/food/sliceable/flatdough,
		/obj/item/chems/food/cheesewedge
	)
	result = /obj/item/chems/food/sliceable/pizza/mushroompizza

/decl/recipe/baked/vegetablepizza
	fruit = list("eggplant" = 1, "carrot" = 1, "corn" = 1, "tomato" = 1)
	items = list(
		/obj/item/chems/food/sliceable/flatdough,
		/obj/item/chems/food/cheesewedge
	)
	result = /obj/item/chems/food/sliceable/pizza/vegetablepizza

/decl/recipe/baked/amanita_pie
	reagents = list(/decl/material/liquid/amatoxin = 5)
	items = list(/obj/item/chems/food/sliceable/flatdough)
	result = /obj/item/chems/food/amanita_pie

/decl/recipe/baked/pumpkinpie
	fruit = list("pumpkin" = 1)
	reagents = list(/decl/material/liquid/nutriment/sugar = 5)
	items = list(/obj/item/chems/food/sliceable/flatdough)
	reagent_mix = REAGENT_REPLACE // Remove the sugar
	result = /obj/item/chems/food/sliceable/pumpkinpie

/decl/recipe/baked/bananapie
	fruit = list("banana" = 1)
	reagents = list(/decl/material/liquid/nutriment/sugar = 5)
	items = list(/obj/item/chems/food/sliceable/flatdough)
	reagent_mix = REAGENT_REPLACE // Don't include the sugar
	result = /obj/item/chems/food/bananapie

/decl/recipe/baked/cherrypie
	fruit = list("cherries" = 1)
	reagents = list(/decl/material/liquid/nutriment/sugar = 10)
	items = list(
		/obj/item/chems/food/sliceable/flatdough,
	)
	reagent_mix = REAGENT_REPLACE // Don't include the sugar
	result = /obj/item/chems/food/cherrypie

/decl/recipe/baked/meatbread
	display_name = "plain meatbread loaf"
	items = list(
		/obj/item/chems/food/dough = 2,
		/obj/item/chems/food/butchery/cutlet = 2,
		/obj/item/chems/food/cheesewedge = 2,
	)
	result = /obj/item/chems/food/sliceable/meatbread

/decl/recipe/baked/xenomeatbread
	items = list(
		/obj/item/chems/food/dough = 2,
		/obj/item/chems/food/xenomeat = 2,
		/obj/item/chems/food/cheesewedge = 2,
	)
	result = /obj/item/chems/food/sliceable/xenomeatbread

/decl/recipe/baked/bananabread
	fruit = list("banana" = 2)
	reagents = list(/decl/material/liquid/drink/milk = 5, /decl/material/liquid/nutriment/sugar = 5)
	items = list(
		/obj/item/chems/food/dough = 2,
	)
	reagent_mix = REAGENT_REPLACE // Don't include the milk or sugar
	result = /obj/item/chems/food/sliceable/bananabread

/decl/recipe/baked/soylenviridians
	fruit = list("soybeans" = 1)
	reagents = list(/decl/material/liquid/nutriment/flour = 10)
	reagent_mix = REAGENT_REPLACE // no raw flour
	result = /obj/item/chems/food/soylenviridians

/decl/recipe/baked/soylentgreen
	reagents = list(/decl/material/liquid/nutriment/flour = 10)
	items = list(
		/obj/item/chems/food/butchery/meat/human = 2
	)
	reagent_mix = REAGENT_REPLACE // no raw flour
	result = /obj/item/chems/food/soylentgreen

/decl/recipe/baked/tofubread
	items = list(
		/obj/item/chems/food/dough = 3,
		/obj/item/chems/food/tofu = 3,
		/obj/item/chems/food/cheesewedge = 3,
	)
	result = /obj/item/chems/food/sliceable/tofubread

/decl/recipe/baked/cookie
	display_name = "plain cookie"
	reagents = list(/decl/material/liquid/nutriment/batter/cakebatter = 5, /decl/material/liquid/nutriment/coco = 5)
	reagent_mix = REAGENT_REPLACE // no raw batter
	result = /obj/item/chems/food/cookie

/decl/recipe/baked/fortunecookie
	container_categories = RECIPE_CATEGORY_OVEN|RECIPE_CATEGORY_FRYER
	reagents = list(/decl/material/liquid/nutriment/sugar = 5)
	items = list(
		/obj/item/chems/food/doughslice,
		/obj/item/paper,
	)
	result = /obj/item/chems/food/fortunecookie

/decl/recipe/baked/fortunecookie/produce_result(obj/container)
	var/obj/item/paper/paper = locate() in container
	paper.forceMove(null) //prevent deletion
	var/obj/item/chems/food/fortunecookie/being_cooked = ..(container)
	paper.forceMove(being_cooked)
	being_cooked.trash = paper //so the paper is left behind as trash without special-snowflake(TM Nodrak) code ~carn
	return being_cooked

/decl/recipe/baked/fortunecookie/check_items(var/obj/container)
	. = ..()
	if(.)
		var/obj/item/paper/paper = locate() in container
		if(!paper || !paper.info)
			return FALSE

/decl/recipe/baked/muffin
	display_name = "plain muffin"
	reagents = list(/decl/material/liquid/nutriment/batter/cakebatter = 10)
	reagent_mix = REAGENT_REPLACE // no raw batter in muffins
	result = /obj/item/chems/food/muffin

/decl/recipe/baked/eggplantparm
	fruit = list("eggplant" = 1)
	items = list(
		/obj/item/chems/food/cheesewedge = 2
		)
	result = /obj/item/chems/food/eggplantparm

/decl/recipe/baked/enchiladas
	container_categories = RECIPE_CATEGORY_OVEN|RECIPE_CATEGORY_FRYER
	fruit = list("chili" = 2, "corn" = 1)
	items = list(/obj/item/chems/food/butchery/cutlet)
	result = /obj/item/chems/food/enchiladas

/decl/recipe/baked/creamcheesebread
	items = list(
		/obj/item/chems/food/dough = 2,
		/obj/item/chems/food/cheesewedge = 2,
	)
	result = /obj/item/chems/food/sliceable/creamcheesebread

/decl/recipe/baked/monkeysdelight
	container_categories = RECIPE_CATEGORY_OVEN|RECIPE_CATEGORY_MICROWAVE
	fruit = list("banana" = 1)
	reagents = list(/decl/material/solid/sodiumchloride = 1, /decl/material/solid/blackpepper = 1, /decl/material/liquid/nutriment/flour = 10)
	items = list(
		/obj/item/chems/food/monkeycube
	)
	reagent_mix = REAGENT_REPLACE // simplify end product
	result = /obj/item/chems/food/monkeysdelight

/decl/recipe/baked/baguette
	reagents = list(/decl/material/solid/sodiumchloride = 1, /decl/material/solid/blackpepper = 1)
	items = list(
		/obj/item/chems/food/dough = 2,
	)
	result = /obj/item/chems/food/baguette

/decl/recipe/baked/bread
	display_name = "loaf of bread"
	items = list(
		/obj/item/chems/food/dough = 2,
		/obj/item/chems/food/egg
	)
	reagent_mix = REAGENT_REPLACE // no raw egg/flour
	result = /obj/item/chems/food/sliceable/bread

/decl/recipe/baked/jelliedtoast
	reagents = list(/decl/material/liquid/nutriment/cherryjelly = 5)
	items = list(
		/obj/item/chems/food/slice/bread,
	)
	result = /obj/item/chems/food/jelliedtoast/cherry

/decl/recipe/baked/rofflewaffles
	reagents = list(/decl/material/liquid/psychotropics = 5, /decl/material/liquid/nutriment/batter/cakebatter = 20)
	reagent_mix = REAGENT_REPLACE // no raw batter
	result = /obj/item/chems/food/rofflewaffles

/decl/recipe/baked/poppypretzel
	fruit = list("poppy" = 1)
	items = list(/obj/item/chems/food/dough)
	result = /obj/item/chems/food/poppypretzel

/decl/recipe/baked/plumphelmetbiscuit
	display_name = "batter plump helmet biscuit"
	fruit = list("plumphelmet" = 1)
	reagents = list(/decl/material/liquid/nutriment/batter = 10)
	reagent_mix = REAGENT_REPLACE // Remove the batter
	result = /obj/item/chems/food/plumphelmetbiscuit

/decl/recipe/baked/plumphelmetbiscuitvegan
	display_name = "vegan plump helmet biscuit"
	fruit = list("plumphelmet" = 1)
	reagents = list(/decl/material/liquid/nutriment/flour = 10, /decl/material/liquid/water = 10)
	reagent_mix = REAGENT_REPLACE // Remove the flour and water
	result = /obj/item/chems/food/plumphelmetbiscuit

/decl/recipe/baked/appletart
	fruit = list("goldapple" = 1)
	items = list(/obj/item/chems/food/sliceable/flatdough)
	reagent_mix = REAGENT_REPLACE // no raw flour
	result = /obj/item/chems/food/appletart

/decl/recipe/baked/cracker
	reagents = list(/decl/material/solid/sodiumchloride = 1)
	items = list(
		/obj/item/chems/food/doughslice
	)
	result = /obj/item/chems/food/cracker

/decl/recipe/baked/tofurkey
	items = list(
		/obj/item/chems/food/tofu = 2,
		/obj/item/chems/food/stuffing,
	)
	result = /obj/item/chems/food/tofurkey

/decl/recipe/baked/bun
	display_name = "plain bun"
	items = list(
		/obj/item/chems/food/dough
	)
	result = /obj/item/chems/food/bun

/decl/recipe/baked/flatbread
	display_name = "plain flatbread"
	items = list(
		/obj/item/chems/food/sliceable/flatdough
	)
	result = /obj/item/chems/food/flatbread

/decl/recipe/baked/cake
	reagents = list(/decl/material/liquid/nutriment/batter/cakebatter = 60)
	reagent_mix = REAGENT_REPLACE // no raw batter
	result = /obj/item/chems/food/sliceable/plaincake

/decl/recipe/baked/cake/carrot
	fruit = list("carrot" = 3)
	result = /obj/item/chems/food/sliceable/carrotcake

/decl/recipe/baked/cake/cheese
	items = list(
		/obj/item/chems/food/cheesewedge = 2
	)
	result = /obj/item/chems/food/sliceable/cheesecake

/decl/recipe/baked/cake/orange
	fruit = list("orange" = 1)
	result = /obj/item/chems/food/sliceable/orangecake

/decl/recipe/baked/cake/lime
	fruit = list("lime" = 1)
	result = /obj/item/chems/food/sliceable/limecake

/decl/recipe/baked/cake/lemon
	fruit = list("lemon" = 1)
	result = /obj/item/chems/food/sliceable/lemoncake

/decl/recipe/baked/cake/chocolate
	items = list(/obj/item/chems/food/chocolatebar)
	result = /obj/item/chems/food/sliceable/chocolatecake

/decl/recipe/baked/cake/birthday
	reagents = list(/decl/material/liquid/nutriment/batter/cakebatter = 60, /decl/material/liquid/nutriment/sprinkles = 10)
	result = /obj/item/chems/food/sliceable/birthdaycake

/decl/recipe/baked/cake/apple
	fruit = list("apple" = 2)
	result = /obj/item/chems/food/sliceable/applecake

/decl/recipe/baked/cake/brain
	items = list(/obj/item/organ/internal/brain)
	result = /obj/item/chems/food/sliceable/braincake

// Stub recipes for cooking pies.
/decl/recipe/baked/meatpie
	items  = list(/obj/item/chems/food/meatpie/raw)
	result = /obj/item/chems/food/meatpie
/decl/recipe/baked/tofupie
	items  = list(/obj/item/chems/food/tofupie/raw)
	result = /obj/item/chems/food/tofupie
/decl/recipe/baked/xemeatpie
	items  = list(/obj/item/chems/food/xemeatpie/raw)
	result = /obj/item/chems/food/xemeatpie
/decl/recipe/baked/applepie
	items  = list(/obj/item/chems/food/applepie/raw)
	result = /obj/item/chems/food/applepie
/decl/recipe/baked/berryclafoutis
	items  = list(/obj/item/chems/food/berryclafoutis/raw)
	result = /obj/item/chems/food/berryclafoutis
/decl/recipe/baked/plump_pie
	items  = list(/obj/item/chems/food/plump_pie/raw)
	result = /obj/item/chems/food/plump_pie
/decl/recipe/baked/loadedbakedpotato
	items  = list(/obj/item/chems/food/loadedbakedpotato/raw)
	result = /obj/item/chems/food/loadedbakedpotato
/decl/recipe/baked/cheesyfries
	container_categories = RECIPE_CATEGORY_MICROWAVE|RECIPE_CATEGORY_OVEN
	items  = list(/obj/item/chems/food/cheesyfries/uncooked)
	result = /obj/item/chems/food/cheesyfries
