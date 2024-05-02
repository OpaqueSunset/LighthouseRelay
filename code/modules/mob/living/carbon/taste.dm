/mob/living/proc/ingest(var/datum/reagents/from, var/datum/reagents/target, var/amount = 1, var/multiplier = 1, var/copy = 0)
	RAISE_EVENT(/decl/observ/ingested, src, from, target, amount, multiplier, copy)
	. = from.trans_to_holder(target,amount,multiplier,copy)

/mob/living/carbon/ingest(var/datum/reagents/from, var/datum/reagents/target, var/amount = 1, var/multiplier = 1, var/copy = 0) //we kind of 'sneak' a proc in here for ingesting stuff so we can play with it.
	if(last_taste_time + 50 < world.time)
		var/datum/reagents/temp = new(amount, global.temp_reagents_holder) //temporary holder used to analyse what gets transfered.
		from.trans_to_holder(temp, amount, multiplier, 1)
		var/text_output = temp.generate_taste_message(src, from)
		if(text_output && (text_output != last_taste_text || last_taste_time + 1 MINUTE < world.time)) //We dont want to spam the same message over and over again at the person. Give it a bit of a buffer.
			to_chat(src, SPAN_NOTICE("You can taste [text_output].")) //no taste means there are too many tastes and not enough flavor.
			last_taste_time = world.time
			last_taste_text = text_output
	. = ..()

/* what this does:
catalogue the 'taste strength' of each one
calculate text size per text.
*/
/datum/reagents/proc/generate_taste_message(mob/living/taster, datum/reagents/source_holder)

	if(!istype(taster))
		return

	var/minimum_percent
	if(taster.isSynthetic())
		minimum_percent = TASTE_DULL
	else
		var/decl/species/my_species = istype(taster) && taster?.get_species()
		if(my_species)
			// the taste bonus makes it so that sipping a drink lets you taste it better
			// 1u makes it 2x as strong, 2u makes it 1.5x, 5u makes it 1.2x, etc
			minimum_percent = (my_species.taste_sensitivity * clamp(1 + (1/max(total_volume, 1)), 1, 2))
		else
			minimum_percent = TASTE_NORMAL
	minimum_percent = round(TASTE_DEGREE_PROB/minimum_percent)

	if(minimum_percent > 100)
		return

	var/total_taste = 0
	var/list/tastes = list() //descriptor = strength
	for(var/reagent_type in reagent_volumes)
		var/decl/material/reagent = GET_DECL(reagent_type)
		var/list/nutriment_data = LAZYACCESS(reagent_data, reagent_type)
		var/list/taste_data = LAZYACCESS(nutriment_data, "taste")
		if(length(taste_data))
			for(var/taste in taste_data)
				var/taste_power = taste_data[taste]
				tastes[taste]  += taste_power
				total_taste    += taste_power
		else if(reagent.taste_description)
			tastes[reagent.taste_description] += reagent.taste_mult
			total_taste                       += reagent.taste_mult

	var/decl/material/primary_ingredient = get_primary_reagent_decl()
	if(primary_ingredient?.cocktail_ingredient && source_holder?.my_atom)
		for(var/decl/cocktail/cocktail in SSmaterials.get_cocktails_by_primary_ingredient(primary_ingredient.type))
			if(!LAZYLEN(cocktail.tastes))
				continue
			if(!cocktail.matches(source_holder.my_atom))
				continue
			var/cocktail_volume = 0
			for(var/chem in cocktail.ratios)
				cocktail_volume += REAGENT_VOLUME(src, chem)
			for(var/taste_desc in cocktail.tastes)
				var/taste_power     = cocktail.tastes[taste_desc] * cocktail_volume
				tastes[taste_desc] += taste_power
				total_taste        += taste_power

	//deal with percentages
	for(var/taste in tastes)
		var/percent = tastes[taste]/total_taste * 100
		if(percent < minimum_percent)
			continue
		var/intensity_desc = "a hint of"
		if(percent > minimum_percent * 2 || percent == 100)
			intensity_desc = ""
		else if(percent > minimum_percent * 3)
			intensity_desc = "the strong flavor of"
		if(intensity_desc == "")
			LAZYADD(., "[taste]")
		else
			LAZYADD(., "[intensity_desc] [taste]")

	if(length(.))
		. = english_list(., "something indescribable")
