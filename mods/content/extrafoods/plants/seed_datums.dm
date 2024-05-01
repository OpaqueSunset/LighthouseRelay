
// Lettuce/varieties.
/datum/seed/lettuce
	name = "lettuce"
	seed_name = "lettuce"
	display_name = "lettuce patch"
	grown_tag = "lettuce"
	chems = list(/decl/material/liquid/nutriment = list(1,15))

/datum/seed/lettuce/New()
	..()
	set_trait(TRAIT_HARVEST_REPEAT,1)
	set_trait(TRAIT_MATURATION,4)
	set_trait(TRAIT_PRODUCTION,5)
	set_trait(TRAIT_YIELD,6)
	set_trait(TRAIT_POTENCY,8)
	set_trait(TRAIT_PRODUCT_ICON,"cabbage")
	set_trait(TRAIT_PRODUCT_COLOUR,"#a8d0a7")
	set_trait(TRAIT_PLANT_COLOUR,"#6d9c6b")
	set_trait(TRAIT_PLANT_ICON,"vine2")
	set_trait(TRAIT_IDEAL_LIGHT, 6)
	set_trait(TRAIT_WATER_CONSUMPTION, 8)
	set_trait(TRAIT_NUTRIENT_CONSUMPTION, 0.13)

/datum/seed/rhubarb
	name = "rhubarb"
	seed_name = "rhubarb"
	display_name = "rhubarb stalks"
	grown_tag = "rhubarb"
	chems = list(/decl/material/liquid/nutriment = list(1,15))

/datum/seed/rhubarb/New()
	..()
	set_trait(TRAIT_HARVEST_REPEAT,1)
	set_trait(TRAIT_MATURATION,3)
	set_trait(TRAIT_PRODUCTION,5)
	set_trait(TRAIT_YIELD,5)
	set_trait(TRAIT_POTENCY,6)
	set_trait(TRAIT_PRODUCT_ICON,"stalk")
	set_trait(TRAIT_PRODUCT_COLOUR,"#fd5656")
	set_trait(TRAIT_PLANT_ICON,"stalk3")

// Wurmwoad, produces space spice.

/datum/seed/wurmwoad
	name = "wurmwoad"
	seed_name = "wurmwoad"
	display_name = "wurmwoad growth"
	chems = list(/decl/material/liquid/nutriment = list(1,10), /decl/material/solid/spacespice = list(5,15))
	grown_tag = "wurmwoad"

/datum/seed/wurmwoad/New()
	..()
	set_trait(TRAIT_HARVEST_REPEAT,1)
	set_trait(TRAIT_MATURATION,7)
	set_trait(TRAIT_PRODUCTION,6)
	set_trait(TRAIT_YIELD,2)
	set_trait(TRAIT_POTENCY,8)
	set_trait(TRAIT_PRODUCT_ICON,"pod")
	set_trait(TRAIT_PRODUCT_COLOUR,"#e08702")
	set_trait(TRAIT_PLANT_COLOUR,"#f1d1d2")
	set_trait(TRAIT_PLANT_ICON,"flower4")
	set_trait(TRAIT_IDEAL_LIGHT, 1)
	set_trait(TRAIT_WATER_CONSUMPTION, 8)
	set_trait(TRAIT_NUTRIENT_CONSUMPTION, 0.25)

/datum/seed/celery
	name = "celery"
	seed_name = "celery"
	display_name = "celery stalks"
	grown_tag = "celery"
	chems = list(/decl/material/liquid/nutriment = list(5,20))

/datum/seed/celery/New()
	..()
	set_trait(TRAIT_HARVEST_REPEAT,1)
	set_trait(TRAIT_MATURATION,6)
	set_trait(TRAIT_PRODUCTION,4)
	set_trait(TRAIT_YIELD,3)
	set_trait(TRAIT_POTENCY,8)
	set_trait(TRAIT_PRODUCT_ICON,"stalk")
	set_trait(TRAIT_PRODUCT_COLOUR,"#56fd56")
	set_trait(TRAIT_PLANT_ICON,"stalk3")

/datum/seed/grapes
	mutants = list("greengrapes","whitegrapes")

/datum/seed/grapes/green
	mutants = list("grapes","whitegrapes")
	chems = list(/decl/material/liquid/nutriment = list(1,10), /decl/material/liquid/nutriment/sugar = list(3,5), /decl/material/liquid/drink/juice/grape/green = list(10,10))

// Fruit Expansion

/datum/seed/melon
	name = "melon"
	seed_name = "melon"
	display_name = "melon vine"
	chems = list(/decl/material/liquid/nutriment = list(1,6), /decl/material/liquid/drink/juice/melon = list(10,6))

/datum/seed/melon/New()
	..()
	set_trait(TRAIT_HARVEST_REPEAT,1)
	set_trait(TRAIT_JUICY,1)
	set_trait(TRAIT_MATURATION,6)
	set_trait(TRAIT_PRODUCTION,6)
	set_trait(TRAIT_YIELD,3)
	set_trait(TRAIT_POTENCY,1)
	set_trait(TRAIT_PRODUCT_ICON,"vine")
	set_trait(TRAIT_PRODUCT_COLOUR,"#d4dc26")
	set_trait(TRAIT_PLANT_COLOUR,"#cad72a")
	set_trait(TRAIT_PLANT_ICON,"vine2")
	set_trait(TRAIT_FLESH_COLOUR,"#f2b32c")
	set_trait(TRAIT_IDEAL_HEAT, 298)
	set_trait(TRAIT_IDEAL_LIGHT, 6)
	set_trait(TRAIT_WATER_CONSUMPTION, 6)

/datum/seed/coffee
	name = "coffee"
	seed_name = "coffee bean"
	display_name = "coffee plant"
	chems = list(/decl/material/liquid/nutriment/coffee = list(10,10))

/datum/seed/coffee/New()
	..()
	set_trait(TRAIT_MATURATION,4)
	set_trait(TRAIT_PRODUCTION,4)
	set_trait(TRAIT_YIELD,3)
	set_trait(TRAIT_POTENCY,5)
	set_trait(TRAIT_PRODUCT_ICON,"nuts")
	set_trait(TRAIT_PRODUCT_COLOUR,"#71503e")
	set_trait(TRAIT_PLANT_ICON,"vine2")
	set_trait(TRAIT_IDEAL_LIGHT, 7)

/datum/seed/grapes/white
	name = "whitegrapes"
	seed_name = "white grape seeds"
	display_name = "white grapevines"
	mutants = list("grapes","greengrapes")
	chems = list(/decl/material/liquid/nutriment = list(1,10), /decl/material/liquid/nutriment/sugar = list(1,5), /decl/material/liquid/drink/juice/grape/white = list(10,10))

/datum/seed/grapes/white/New()
	..()
	set_trait(TRAIT_PRODUCT_ICON,"grapes")
	set_trait(TRAIT_PRODUCT_COLOUR,"#f5efd4")
	set_trait(TRAIT_PLANT_COLOUR,"#378f2e")

/datum/seed/vanilla
	name = "vanilla"
	seed_name = "vanilla flower"
	display_name = "vanilla flower"
	chems = list(/decl/material/liquid/nutriment = list(1,10), /decl/material/liquid/drink/syrup/vanilla = list(4,5))

/datum/seed/vanilla/New()
	..()
	set_trait(TRAIT_MATURATION,5)
	set_trait(TRAIT_PRODUCTION,5)
	set_trait(TRAIT_YIELD,3)
	set_trait(TRAIT_POTENCY,10)
	set_trait(TRAIT_PRODUCT_ICON,"treefruit")
	set_trait(TRAIT_PRODUCT_COLOUR,"#ffffda")
	set_trait(TRAIT_PLANT_ICON,"tree2")
	set_trait(TRAIT_IDEAL_HEAT, 298)
	set_trait(TRAIT_WATER_CONSUMPTION, 6)
	set_trait(TRAIT_PHOTOSYNTHESIS, 1)

/*
// TODO: Sane way to specify modular icon files
/datum/seed/pineapple
	name = "pineapples"
	seed_name = "pineapple"
	display_name = "pineapple plant"
	chems = list(/decl/material/liquid/drink/juice/pineapple = list(10,10), /decl/material/liquid/enzyme = list(1,5),/decl/material/liquid/nutriment = list(1,10))

/datum/seed/pineapple/New()
	..()
	set_trait(TRAIT_HARVEST_REPEAT,1)
	set_trait(TRAIT_JUICY,1)
	set_trait(TRAIT_MATURATION,5)
	set_trait(TRAIT_PRODUCTION,5)
	set_trait(TRAIT_YIELD,2)
	set_trait(TRAIT_POTENCY,10)
	set_trait(TRAIT_PRODUCT_ICON,"pineapple")
	set_trait(TRAIT_PRODUCT_COLOUR,"#f6e12d")
	set_trait(TRAIT_PLANT_ICON,"tree4")
	set_trait(TRAIT_FLESH_COLOUR,"#f6ce79")
	set_trait(TRAIT_IDEAL_LIGHT, 7)
	set_trait(TRAIT_WATER_CONSUMPTION, 6)
	set_trait(TRAIT_NUTRIENT_CONSUMPTION, 0.15)
*/

/datum/seed/pear
	name = "pears"
	seed_name = "pear"
	display_name = "pear tree"
	chems = list(/decl/material/liquid/nutriment = list(1,10), /decl/material/liquid/drink/juice/pear = list(10,10))

/datum/seed/pear/New()
	..()
	set_trait(TRAIT_HARVEST_REPEAT,1)
	set_trait(TRAIT_MATURATION,6)
	set_trait(TRAIT_PRODUCTION,6)
	set_trait(TRAIT_YIELD,5)
	set_trait(TRAIT_POTENCY,10)
	set_trait(TRAIT_PRODUCT_ICON,"apple")
	set_trait(TRAIT_PRODUCT_COLOUR,"#e1e463")
	set_trait(TRAIT_PLANT_ICON,"tree2")
	set_trait(TRAIT_FLESH_COLOUR,"#e8e39b")
	set_trait(TRAIT_IDEAL_LIGHT, 4)
	set_trait(TRAIT_PHOTOSYNTHESIS, 1)

/datum/seed/coconut
	name = "coconuts"
	seed_name = "coconut"
	display_name = "coconut trees"
	chems = list(/decl/material/liquid/nutriment = list(1,20), /decl/material/liquid/drink/juice/coconut = list(10,20))

/datum/seed/coconut/New()
	..()
	set_trait(TRAIT_HARVEST_REPEAT,1)
	set_trait(TRAIT_MATURATION,6)
	set_trait(TRAIT_PRODUCTION,6)
	set_trait(TRAIT_YIELD,4)
	set_trait(TRAIT_POTENCY,15)
	set_trait(TRAIT_PRODUCT_ICON,"treefruit")
	set_trait(TRAIT_PRODUCT_COLOUR,"#a36b09")
	set_trait(TRAIT_PLANT_ICON,"tree4")
	set_trait(TRAIT_PHOTOSYNTHESIS, 1)

/datum/seed/cinnamon
	name = "cinnamon"
	seed_name = "cinnamon"
	display_name = "cinnamon"
	chems = list(/decl/material/solid/cinnamon = list(10,20))

/datum/seed/cinnamon/New()
	..()
	set_trait(TRAIT_MATURATION,7)
	set_trait(TRAIT_PRODUCTION,5)
	set_trait(TRAIT_YIELD,5)
	set_trait(TRAIT_PRODUCT_ICON,"stalk")
	set_trait(TRAIT_PRODUCT_COLOUR,"#cd6139")
	set_trait(TRAIT_PLANT_ICON,"tree2")
	set_trait(TRAIT_IDEAL_LIGHT, 7)
	set_trait(TRAIT_NUTRIENT_CONSUMPTION, 0.05)
	set_trait(TRAIT_WATER_CONSUMPTION, 0.5)

/datum/seed/olives
	name = "olives"
	seed_name = "olives"
	display_name = "olive tree"
	chems = list(/decl/material/liquid/nutriment = list(1,20), /decl/material/liquid/nutriment/triglyceride/oil/olive = list(10,20))

/datum/seed/olives/New()
	..()
	set_trait(TRAIT_HARVEST_REPEAT,1)
	set_trait(TRAIT_MATURATION,3)
	set_trait(TRAIT_PRODUCTION,5)
	set_trait(TRAIT_YIELD,4)
	set_trait(TRAIT_POTENCY,10)
	set_trait(TRAIT_PRODUCT_ICON,"grapes")
	set_trait(TRAIT_PRODUCT_COLOUR,"#87a46e")
	set_trait(TRAIT_PLANT_COLOUR,"#378f2e")
	set_trait(TRAIT_PLANT_ICON,"vine")
	set_trait(TRAIT_IDEAL_LIGHT, 6)
	set_trait(TRAIT_NUTRIENT_CONSUMPTION, 0.15)