#ifndef CONTENT_PACK_CYBERPLANTS
#define CONTENT_PACK_CYBERPLANTS
#endif

/decl/modpack/cyberplants
	name = "Holoplants"

/obj/machinery/holoplant
	name = "holoplant"
	desc = "One of those Ward-Takahashi holoplants! Give your space a bit of the comfort of being outdoors, by buying this blue buddy. A rugged case guarantees that your flower will outlive you, and variety of plant types won't let you to get bored along the way!"
	icon = 'mods/content/cyberplants/cyberplants.dmi'
	icon_state = "holopot"
	construct_state = /decl/machine_construction/default/panel_closed/item_chassis
	idle_power_usage = 0
	active_power_usage = 5
	anchored = TRUE
	var/brightness_on = 4
	var/interference = FALSE
	var/icon/plant = null
	var/plant_color
	var/static/list/possible_plants = list(
		"plant-1",
		"plant-10",
		"plant-09",
		"plant-15",
		"plant-13",
		"plant-xmas",
		"plant-03",
		"plant-08",
		"plant-02",
		"plant-04",
		"plant-06",
		"plant-07",
		"plant-14",
		"plant-16",
		"plant-17",
		"plant-21",
		"plant-22",
		"plant-35",
		"plant-36",
	)
	var/static/list/possible_colors = list(
		rgb(60, 148, 197),
		COLOR_NAVY_BLUE,
		COLOR_GREEN,
		COLOR_MAROON,
		COLOR_PURPLE,
		COLOR_VIOLET,
		COLOR_OLIVE,
		COLOR_BROWN_ORANGE,
		COLOR_DARK_ORANGE,
		COLOR_SEDONA,
		COLOR_DARK_BROWN,
		COLOR_BLUE,
		COLOR_DEEP_SKY_BLUE,
		COLOR_LIME,
		COLOR_CYAN,
		COLOR_TEAL,
		COLOR_RED,
		COLOR_PINK,
		COLOR_ORANGE,
		COLOR_YELLOW,
		COLOR_SUN,
		COLOR_BLUE_LIGHT,
		COLOR_RED_LIGHT,
		COLOR_BEIGE,
		COLOR_LUMINOL,
		COLOR_SILVER,
		COLOR_WHITE,
		COLOR_NT_RED,
		COLOR_BOTTLE_GREEN,
		COLOR_CHESTNUT,
		COLOR_BEASTY_BROWN,
		COLOR_WHEAT,
		COLOR_CYAN_BLUE,
		COLOR_LIGHT_CYAN,
		COLOR_PAKISTAN_GREEN,
		COLOR_HULL,
		COLOR_AMBER,
		COLOR_SKY_BLUE,
		COLOR_CIVIE_GREEN,
		COLOR_DARK_GUNMETAL,
	)

/obj/machinery/holoplant/Initialize()
	change_color()
	. = ..()
	activate()

/obj/machinery/holoplant/proc/change_color(new_color)
	if(!new_color)
		new_color = pick(possible_colors)
	plant_color = new_color
	set_light(l_color=plant_color)
	if (!plant)
		return
	plant.ColorTone(plant_color)

/obj/machinery/holoplant/proc/change_plant(var/state)
	plant = prepare_icon(state)
	plant.ColorTone(plant_color || COLOR_WHITE)

/obj/machinery/holoplant/attack_hand(var/mob/living/user)
	if((. = ..()))
		return
	if(!istype(user) || interference)
		return
	if(!anchored)
		to_chat(user, SPAN_WARNING("\The [src] must be anchored before activation!"))
		return
	if(!plant)
		activate()
	else
		deactivate()

/obj/machinery/holoplant/wrench_floor_bolts()
	. = ..()
	if(!anchored)
		deactivate()

/obj/machinery/holoplant/on_update_icon()
	. = ..()
	cut_overlays()
	if(!plant)
		set_light(0)
		update_use_power(POWER_USE_OFF)
		return
	add_overlay(plant)
	set_light(brightness_on, brightness_on/2)
	update_use_power(POWER_USE_ACTIVE)

/obj/machinery/holoplant/proc/activate()
	if(!anchored || stat & (NOPOWER|BROKEN))
		return

	change_plant((emagged || prob(1)) ? "emagged" : null)
	update_icon()

/obj/machinery/holoplant/proc/deactivate()
	QDEL_NULL(plant)
	update_icon()

/obj/machinery/holoplant/power_change()
	..()
	if(stat & NOPOWER)
		deactivate()

/obj/machinery/holoplant/proc/flicker()
	set waitfor = FALSE
	interference = TRUE
	cut_overlays()
	set_light(0)
	sleep(rand(2,4))
	add_overlay(plant)
	set_light(brightness_on, brightness_on/2)
	sleep(rand(2,4))
	cut_overlays()
	set_light(0)
	sleep(rand(2,4))
	update_icon() // reset our state
	interference = FALSE

/obj/machinery/holoplant/proc/prepare_icon(var/state)
	if(!state)
		state = pick(possible_plants)
	var/plant_icon = icon(icon, state)
	return getHologramIcon(plant_icon, FALSE, custom_tone = plant_color)

/obj/machinery/holoplant/emag_act()
	if(emagged)
		return

	emagged = TRUE
	change_plant("emagged")
	update_icon()

/obj/machinery/holoplant/Crossed(var/mob/living/L)
	if(!interference && plant && istype(L))
		flicker()

/obj/machinery/holoplant/shipped
	anchored = FALSE