/obj/machinery/appliance/cooker/stove
	name = "stove"
	desc = "Don't touch it!"
	icon_state = "stove_off"
	pass_flags = PASS_FLAG_TABLE
	cook_type = "pan-fried"
	cooking_category = RECIPE_CATEGORY_SKILLET | RECIPE_CATEGORY_SAUCEPAN | RECIPE_CATEGORY_POT
	food_color = "#a34719"
	can_burn_food = TRUE
	active_power_usage = 6 KILOWATTS
	heating_power = 6000
	on_icon = "stove_on"
	off_icon = "stove_off"

	resistance = 5000 // Approx. 2 minutes.
	idle_power_usage = 1 KILOWATTS
	//uses ~30% power to stay warm
	optimal_temp = T0C + 100 // can boil water!
	optimal_power = 1.2

	max_contents = 4

	use_power = POWER_USE_OFF	//Starts turned off

	starts_with = list(
		/obj/item/chems/cooking_container/skillet,
		/obj/item/chems/cooking_container/pot,
		/obj/item/chems/cooking_container/saucepan
	)

/obj/machinery/appliance/cooker/stove/on_update_icon()
	. = ..()
	var/list/pans = list()
	for(var/obj/item/chems/cooking_container/CC in contents)
		var/image/pan_overlay
		switch(CC.cooking_category)
			if(RECIPE_CATEGORY_SKILLET)
				pan_overlay = image('icons/obj/cooking_machines.dmi', "skillet[clamp(length(pans)+1, 1, 4)]")
			if(RECIPE_CATEGORY_SAUCEPAN)
				pan_overlay = image('icons/obj/cooking_machines.dmi', "pan[clamp(length(pans)+1, 1, 4)]")
			if(RECIPE_CATEGORY_POT)
				pan_overlay = image('icons/obj/cooking_machines.dmi', "pot[clamp(length(pans)+1, 1, 4)]")
			else
				continue
		pan_overlay.color = CC.color
		pans += pan_overlay
	if(!length(pans))
		return
	add_overlay(pans)