/* Food */
/decl/material/liquid/nutriment
	name = "nutriment"
	lore_text = "All the vitamins, minerals, and carbohydrates the body needs in pure form."
	taste_mult = 4
	metabolism = REM * 4
	color = "#664330"
	value = 1.2
	fruit_descriptor = "nutritious"
	uid = "chem_nutriment"
	exoplanet_rarity_gas = MAT_RARITY_NOWHERE // Please, no more animal protein or glowsap or corn oil atmosphere.
	fishing_bait_value = 0.65
	compost_value = 1
	nutriment_factor = 10

	// Technically a room-temperature solid, but saves
	// repathing it to /solid all over the codebase.
	melting_point    = 323
	ignition_point   = 353
	boiling_point    = 373
	accelerant_value =   0.65

/decl/material/liquid/nutriment/Initialize()
	solid_name = name   // avoid 'frozen sugar'
	liquid_name = name  // avoid 'molten honey'
	return ..()

/decl/material/liquid/nutriment/slime_meat
	name = "slime-meat"
	lore_text = "Mollusc meat, or slug meat - something slimy, anyway."
	scannable = 1
	taste_description = "cold, bitter slime"
	overdose = 10
	hydration_factor = 6
	uid = "chem_nutriment_slime"

/decl/material/liquid/nutriment/glucose
	name = "glucose"
	color = "#ffffff"
	scannable = 1
	injectable_nutrition = TRUE
	uid = "chem_nutriment_glucose"

/decl/material/liquid/nutriment/bread
	name = "bread"
	uid = "chem_nutriment_bread"

/decl/material/liquid/nutriment/bread/cake
	name = "cake"
	uid = "chem_nutriment_cake"

//vegetamarian alternative that is safe for vegans to ingest//rewired it from its intended nutriment/protein/egg/softtofu because it would not actually work, going with plan B, more recipes.
/decl/material/liquid/nutriment/plant_protein
	name = "plant protein"
	lore_text = "A gooey pale paste."
	taste_description = "healthy sadness"
	color = "#ffffff"
	uid = "chem_nutriment_plant"

/decl/material/liquid/nutriment/honey
	name = "honey"
	lore_text = "A golden yellow syrup, loaded with sugary sweetness."
	taste_description = "sweetness"
	nutriment_factor = 10
	color = "#ffff00"
	fruit_descriptor = "rich"
	uid = "chem_nutriment_honey"
	melting_point = 273
	boiling_point = 373

/decl/material/liquid/nutriment/flour
	name = "flour"
	lore_text = "This is what you rub all over yourself to pretend to be a ghost."
	taste_description = "chalky wheat"
	nutriment_factor = 1
	color = "#ffffff"
	slipperiness = -1
	uid = "chem_nutriment_flour"

/decl/material/liquid/nutriment/flour/touch_turf(var/turf/T, var/amount, var/datum/reagents/holder)
	..()
	new /obj/effect/decal/cleanable/flour(T)

/decl/material/liquid/nutriment/batter
	name = "batter"
	codex_name = "plain batter"
	lore_text = "A gooey mixture of eggs and flour, a base for turning wheat into food."
	taste_description = "batter"
	nutriment_factor = 3
	color = "#ffd592"
	slipperiness = -1
	exoplanet_rarity_plant = MAT_RARITY_NOWHERE
	exoplanet_rarity_gas = MAT_RARITY_NOWHERE
	uid = "chem_nutriment_batter"
	melting_point = T0C
	boiling_point = T100C
	var/icon_raw = "batter_raw"
	var/icon_cooked = "batter_cooked"
	var/coated_adj = "battered"

/decl/material/liquid/nutriment/batter/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed, var/datum/reagents/holder)
	//We'll assume that the batter isnt going to be regurgitated and eaten by someone else. Only show this once
	var/list/data = REAGENT_DATA(holder, type)
	if (!data["cooked"])
		//Raw coatings will sometimes cause vomiting
		if (prob(1))
			to_chat(M, "This raw [name] tastes disgusting!")
			if (ishuman(M))
				var/mob/living/carbon/human/H = M
				H.vomit()
	..()

/decl/material/liquid/nutriment/batter/initialize_data(var/newdata) // Called when the reagent is created.
	. = ..()
	if (!.)
		. = list()
	else
		if (isnull(.["cooked"]))
			.["cooked"] = FALSE
		return .
	.["cooked"] = FALSE

/decl/material/liquid/nutriment/batter/mix_data(var/datum/reagents/reagents, var/newdata, var/newamount)
	. = ..()
	if(newamount > (REAGENT_VOLUME(reagents, type)/2)) // take whatever the majority is
		.["cooked"] = newdata["cooked"]

/decl/material/liquid/nutriment/batter/touch_turf(var/turf/T, var/amount, var/datum/reagents/holder)
	..()
	new /obj/effect/decal/cleanable/pie_smudge(T)

/decl/material/liquid/nutriment/batter/cakebatter
	name = "cake batter"
	codex_name = null
	lore_text = "A gooey mixture of eggs, flour and sugar, a important precursor to cake!"
	taste_description = "sweetness"
	color = "#ffe992"
	uid = "chem_nutriment_cakebatter"

/decl/material/liquid/nutriment/batter/beerbatter
	name = "beer batter"
	codex_name = null
	color = "#f5f4e9"
	icon_raw = "batter_raw"
	icon_cooked = "batter_cooked"
	coated_adj = "beer-battered"
	taste_description = "beer batter"
	uid = "chem_nutriment_beerbatter"

/decl/material/liquid/nutriment/batter/beerbatter/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed, var/datum/reagents/holder)
	..()
	M.add_chemical_effect(CE_ALCOHOL, removed*0.02) //Very slightly alcoholic

//Fats
//=========================
/decl/material/liquid/nutriment/triglyceride
	name = "triglyceride"
	lore_text = "More commonly known as fat, the third macronutrient, with over double the energy content of carbs and protein"

	nutriment_factor = 27//The caloric ratio of carb/protein/fat is 4:4:9
	color = "#cccccc"
	taste_description = "fat"
	uid = "chem_nutriment_triglyceride"

/decl/material/liquid/nutriment/triglyceride/oil
	//Having this base class in case we want to add more variants of oil
	name = "oil"
	codex_name = "cooking oil"
	lore_text = "Oils are liquid fats."
	color = "#c79705"
	touch_met = 1.5
	var/lastburnmessage = 0
	taste_description = "some sort of oil"
	taste_mult = 0.1
	uid = "chem_nutriment_triglyceride_oil"

/decl/material/liquid/nutriment/triglyceride/oil/initialize_data(var/newdata) // Called when the reagent is created.
	return ..() || list("temperature" = T20C, "lastburnmessage" = 0)

/decl/material/liquid/nutriment/triglyceride/oil/touch_turf(var/turf/T, var/datum/reagents/holder)
	if(!istype(T))
		return

	if(holder.reagent_volumes[type] >= 3)
		T.wet_floor()

//Handles setting the temperature when oils are mixed
/decl/material/liquid/nutriment/mix_data(var/datum/reagents/reagents, var/list/newdata, var/newamount)
	if(!islist(newdata) || !newdata.len)
		return

	var/data = ..()
	var/volume = REAGENT_VOLUME(reagents, type)
	var/ouramount = volume - newamount
	if (ouramount <= 0 || !data["temperature"] || !volume)
		//If we get here, then this reagent has just been created, just copy the temperature exactly
		data["temperature"] = newdata["temperature"]

	else
		//Our temperature is set to the mean of the two mixtures, taking volume into account
		var/total = (data["temperature"] * ouramount) + (newdata["temperature"] * newamount)
		data["temperature"] = total / volume

	return data


//Calculates a scaling factor for scalding damage, based on the temperature of the oil and creature's heat resistance
/decl/material/liquid/nutriment/triglyceride/oil/proc/heatdamage(var/mob/living/carbon/M, var/datum/reagents/holder)
	var/threshold = 360//Human heatdamage threshold
	//Step = degrees above heat level 1 for 1.0 multiplier
	var/damage_step = 60
	var/obj/item/organ/external/head = GET_EXTERNAL_ORGAN(M, BP_HEAD)
	if (head?.bodytype)
		threshold = head.bodytype.heat_level_1
		damage_step = (head.bodytype.heat_level_2 - head.bodytype.heat_level_1) * 1.5

	var/data = REAGENT_DATA(holder, type)

	//If temperature is too low to burn, return a factor of 0. no damage
	if (data["temperature"] < threshold)
		return 0

	. = data["temperature"] - threshold
	. /= damage_step
	. = min(., 2.5)//Cap multiplier at 2.5

/decl/material/liquid/nutriment/triglyceride/oil/affect_touch(var/mob/living/carbon/M, var/alien, var/removed, var/datum/reagents/holder)
	var/dfactor = heatdamage(M)
	if (dfactor)
		var/data = REAGENT_DATA(holder, type)
		LAZYINITLIST(holder.reagent_data)
		M.take_organ_damage(0, removed * 1.5 * dfactor)
		data["temperature"] -= (6 * removed) / (1 + REAGENT_VOLUME(holder, type)*0.1)//Cools off as it burns you
		if (LAZYACCESS(holder.reagent_data[type], "lastburnmessage")+100 < world.time)
			to_chat(M, SPAN_DANGER("The hot oil clings to your skin and burns you!"))
			LAZYSET(holder.reagent_data[type], "lastburnmessage", world.time)

/decl/material/liquid/nutriment/triglyceride/oil/corn
	name = "corn oil"
	lore_text = "An oil derived from corn."
	taste_description = "corn oil"
	uid = "chem_cornoil"

// From Synnono's Cooking Expansion on Aurora
/decl/material/liquid/nutriment/browniemix
	name = "brownie mix"
	lore_text = "A dry mix for making delicious brownies."
	color = "#441a03"
	nutriment_factor = 5
	taste_mult = 1.3
	taste_description = "chocolate"
	uid = "chem_browniemix"

// Caramel sugar from Hestia
/decl/material/liquid/nutriment/caramelsugar
	name = "caramel sugar"
	lore_text = "Caramelised sugar, used in various recipes."
	taste_description = "toasty sweetness"
	taste_mult = 1.5
	nutriment_factor = 1.5
	uid = "chem_caramelsugar"
// HEARTH EDIT END

/decl/material/liquid/nutriment/coffee
	name = "ground coffee"
	lore_text = "A bitter powder made by grinding coffee beans."
	taste_description = "bitterness"
	taste_mult = 1.3
	nutriment_factor = 1
	color = "#482000"
	fruit_descriptor = "bitter"
	uid = "chem_nutriment_coffeepowder"

/decl/material/liquid/nutriment/coffee/affect_blood(var/mob/living/M, var/removed, var/datum/reagents/holder)
	..()
	M.add_chemical_effect(CE_PULSE, 2)

/decl/material/liquid/nutriment/coffee/instant
	name = "instant coffee powder"
	lore_text = "A bitter powder made by processing coffee beans."
	exoplanet_rarity_plant = MAT_RARITY_NOWHERE
	exoplanet_rarity_gas = MAT_RARITY_NOWHERE
	uid = "chem_nutriment_instantcoffee"

/decl/material/liquid/nutriment/tea
	name = "tea leaves"
	lore_text = "A dark, tart powder made from black tea leaves."
	taste_description = "tartness"
	taste_mult = 1.3
	nutriment_factor = 1
	color = "#101000"
	uid = "chem_nutriment_teapowder"

/decl/material/liquid/nutriment/tea/instant
	name = "instant tea powder"
	uid = "chem_nutriment_instanttea"

/decl/material/liquid/nutriment/coco
	name = "coco powder"
	lore_text = "A fatty, bitter paste made from coco beans."
	taste_description = "bitterness"
	taste_mult = 1.3
	nutriment_factor = 5
	color = "#302000"
	fruit_descriptor = "bitter"
	uid = "chem_nutriment_cocoa"

/decl/material/liquid/nutriment/instantjuice
	name = "juice concentrate"
	lore_text = "Dehydrated, powdered juice of some kind."
	taste_mult = 1.3
	nutriment_factor = 1
	exoplanet_rarity_plant = MAT_RARITY_NOWHERE
	exoplanet_rarity_gas = MAT_RARITY_NOWHERE
	uid = "chem_nutriment_juice"

/decl/material/liquid/nutriment/instantjuice/grape
	name = "grape concentrate"
	lore_text = "Dehydrated, powdered grape juice."
	taste_description = "dry grapes"
	color = "#863333"
	exoplanet_rarity_plant = MAT_RARITY_NOWHERE
	exoplanet_rarity_gas = MAT_RARITY_NOWHERE
	uid = "chem_nutriment_juice_grape"

/decl/material/liquid/nutriment/instantjuice/orange
	name = "orange concentrate"
	lore_text = "Dehydrated, powdered orange juice."
	taste_description = "dry oranges"
	color = "#e78108"
	exoplanet_rarity_plant = MAT_RARITY_NOWHERE
	exoplanet_rarity_gas = MAT_RARITY_NOWHERE
	uid = "chem_nutriment_juice_orange"

/decl/material/liquid/nutriment/instantjuice/watermelon
	name = "watermelon concentrate"
	lore_text = "Dehydrated, powdered watermelon juice."
	taste_description = "dry sweet watermelon"
	color = "#b83333"
	exoplanet_rarity_plant = MAT_RARITY_NOWHERE
	exoplanet_rarity_gas = MAT_RARITY_NOWHERE
	uid = "chem_nutriment_juice_watermelon"

/decl/material/liquid/nutriment/instantjuice/apple
	name = "apple concentrate"
	lore_text = "Dehydrated, powdered apple juice."
	taste_description = "dry sweet apples"
	color = "#c07c40"
	exoplanet_rarity_plant = MAT_RARITY_NOWHERE
	exoplanet_rarity_gas = MAT_RARITY_NOWHERE
	uid = "chem_nutriment_juice_apple"

/decl/material/liquid/nutriment/soysauce
	name = "soy sauce"
	lore_text = "A salty sauce made from the soy plant."
	taste_description = "umami"
	taste_mult = 1.1
	nutriment_factor = 2
	color = "#792300"
	exoplanet_rarity_plant = MAT_RARITY_NOWHERE
	exoplanet_rarity_gas = MAT_RARITY_NOWHERE
	uid = "chem_nutriment_soysauce"
	melting_point = 273
	boiling_point = 373

/decl/material/liquid/nutriment/ketchup
	name = "ketchup"
	lore_text = "Ketchup, catsup, whatever. It's tomato paste."
	taste_description = "ketchup"
	nutriment_factor = 5
	color = "#731008"
	exoplanet_rarity_plant = MAT_RARITY_NOWHERE
	exoplanet_rarity_gas = MAT_RARITY_NOWHERE
	uid = "chem_nutriment_ketchup"
	melting_point = 273
	boiling_point = 373

/decl/material/liquid/nutriment/banana_cream
	name = "banana cream"
	lore_text = "A creamy confection that tastes of banana."
	taste_description = "banana"
	color = "#f6dfaa"
	exoplanet_rarity_plant = MAT_RARITY_NOWHERE
	exoplanet_rarity_gas = MAT_RARITY_NOWHERE
	uid = "chem_nutriment_bananacream"
	melting_point = 273
	boiling_point = 373

/decl/material/liquid/nutriment/barbecue
	name = "barbecue sauce"
	lore_text = "Barbecue sauce for barbecues and long shifts."
	taste_description = "barbecue"
	nutriment_factor = 5
	color = "#4f330f"
	exoplanet_rarity_plant = MAT_RARITY_NOWHERE
	exoplanet_rarity_gas = MAT_RARITY_NOWHERE
	uid = "chem_nutriment_bbqsauce"
	melting_point = 273
	boiling_point = 373

/decl/material/liquid/nutriment/garlicsauce
	name = "garlic sauce"
	lore_text = "Garlic sauce, perfect for spicing up a plate of garlic."
	taste_description = "garlic"
	nutriment_factor = 4
	color = "#d8c045"
	exoplanet_rarity_plant = MAT_RARITY_NOWHERE
	exoplanet_rarity_gas = MAT_RARITY_NOWHERE
	uid = "chem_nutriment_garlicsauce"
	melting_point = 273
	boiling_point = 373

/decl/material/liquid/nutriment/rice
	name = "rice"
	lore_text = "Enjoy the great taste of nothing."
	taste_description = "rice"
	taste_mult = 0.4
	nutriment_factor = 1
	color = "#ffffff"
	uid = "chem_nutriment_rice"
	soup_base = "rice_base"
	soup_overlay = "soup_meatballs"

/decl/material/liquid/nutriment/cherryjelly
	name = "cherry jelly"
	lore_text = "Totally the best. Only to be spread on foods with excellent lateral symmetry."
	taste_description = "cherry"
	taste_mult = 1.3
	nutriment_factor = 1
	color = "#801e28"
	fruit_descriptor = "sweet"
	uid = "chem_nutriment_cherryjelly"
	melting_point = 273
	boiling_point = 373

/decl/material/liquid/nutriment/cornoil
	name = "corn oil"
	lore_text = "An oil derived from various types of corn."
	taste_description = "slime"
	taste_mult = 0.1
	nutriment_factor = 20
	color = "#302000"
	slipperiness = 8
	uid = "chem_nutriment_cornoil"
	melting_point = 273
	boiling_point = 373

/decl/material/liquid/nutriment/sprinkles
	name = "sprinkles"
	lore_text = "Multi-colored little bits of sugar, commonly found on donuts. Loved by cops."
	taste_description = "childhood whimsy"
	nutriment_factor = 1
	color = "#ff00ff"
	exoplanet_rarity_plant = MAT_RARITY_NOWHERE
	exoplanet_rarity_gas = MAT_RARITY_NOWHERE
	uid = "chem_nutriment_sprinkles"

/decl/material/liquid/nutriment/sugar
	name = "sugar"
	codex_name = "granulated sugar"
	lore_text = "The organic compound commonly known as table sugar and sometimes called saccharose. This white, odorless, crystalline powder has a pleasing, sweet taste."
	taste_description = "sugar"
	taste_mult = 3
	color = "#ffffff"
	scannable = 1
	nutriment_factor = 3
	glass_name = "sugar"
	glass_desc = "The organic compound commonly known as table sugar and sometimes called saccharose. This white, odorless, crystalline powder has a pleasing, sweet taste."
	glass_icon = DRINK_ICON_NOISY
	fruit_descriptor = "sweet"
	hidden_from_codex = FALSE
	uid = "chem_nutriment_sugar"

/decl/material/liquid/nutriment/vinegar
	name = "vinegar"
	lore_text = "A weak solution of acetic acid. Usually used for seasoning food."
	taste_description = "vinegar"
	color = "#e8dfd0"
	taste_mult = 3
	uid = "chem_nutriment_vinegar"
	melting_point = 273
	boiling_point = 373

/decl/material/liquid/nutriment/mayo
	name = "mayonnaise"
	lore_text = "A mixture of egg yolk with lemon juice or vinegar. Usually put on bland food to make it more edible."
	taste_description = "mayo"
	color = "#efede8"
	taste_mult = 2
	exoplanet_rarity_plant = MAT_RARITY_NOWHERE
	exoplanet_rarity_gas = MAT_RARITY_NOWHERE
	uid = "chem_nutriment_mayonnaise"
