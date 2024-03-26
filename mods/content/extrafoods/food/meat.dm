/obj/item/chems/food/rawcutlet/attackby(var/obj/item/W, var/mob/user)
	if(istype(W,/obj/item/knife))
		var/obj/item/chems/food/rawbacon/rawBacon = new() // unrolled for loop
		rawBacon.dropInto(loc)
		rawBacon = new()
		rawBacon.dropInto(loc)
		to_chat(user, "You slice the cutlet into thin strips of bacon.")
		qdel(src)
		return
	return ..()

/obj/item/chems/food/rawbacon
	name = "raw bacon"
	desc = "A very thin piece of raw meat, cut from beef. Kosher!"
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "rawbacon"
	bitesize = 1

/obj/item/chems/food/rawbacon/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/protein, 0.33)
	add_to_reagents(/decl/material/liquid/nutriment/triglyceride, 1)

// May as well put this here.
/datum/codex_entry/rawbacon
	associated_paths = list(/obj/item/chems/food/rawbacon)

/datum/codex_entry/rawbacon/New(_display_name, list/_associated_paths, list/_associated_strings, _lore_text, _mechanics_text, _antag_text)
	. = ..()
	var/obj/item/chems/food/rawbacon/example = /obj/item/chems/food/rawbacon
	lore_text = initial(example.desc)
	mechanics_text = "Three strips of raw bacon can be made by slicing a raw cutlet with any sharp object. It can be cooked to make <span codexlink='pan-cooked bacon (recipe)'>bacon</span>."

/obj/item/chems/food/bacon
	name = "bacon"
	desc = "A tasty slice of deep-fried meat. You don't see any pigs on this station, do you?"
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "bacon"
	bitesize = 2

/obj/item/chems/food/bacon/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/protein, 0.33)
	add_to_reagents(/decl/material/liquid/nutriment/triglyceride, 1)

/obj/item/chems/food/bacon/microwave
	name = "microwaved bacon"
	desc = "A bacon slice, microwaved. It's not quite as tasty as the real deal, but if it's all you've got..."

/obj/item/chems/food/bacon/oven
	name = "oven-cooked bacon"
	desc = "Why do we bake bacon but cook cookies?"

/obj/item/chems/food/bacon/pan
	name = "pan-cooked bacon"
	desc = "Pan-fried bacon. It's healthier than deep-fried bacon, but just as crisp."

/obj/item/chems/food/bacon_stick
	name = "eggpop"
	desc = "A bacon wrapped boiled egg, conviently skewered on a wooden stick."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "bacon_stick"
	nutriment_amt = 1
	nutriment_desc = list("egg" = 1)

/obj/item/chems/food/bacon_stick/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/protein, 3)

/obj/item/chems/food/chilied_eggs
	name = "chilied eggs"
	desc = "Three deviled eggs floating in a bowl of meat chili. A popular lunchtime meal for Unathi in Ouerea."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "chilied_eggs"
	trash = /obj/item/trash/snack_bowl

/obj/item/chems/food/chilied_eggs/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/protein/egg, 6)
	add_to_reagents(/decl/material/liquid/nutriment/protein, 2)

/obj/item/chems/food/bacon_and_eggs
	name = "bacon and eggs"
	desc = "A piece of bacon and two fried eggs."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "bacon_and_eggs"
	plate = /obj/item/plate
	nutriment_amt = 3
	nutriment_type = /decl/material/liquid/nutriment/protein

/obj/item/chems/food/bacon_and_eggs/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/protein/egg, 1)

/obj/item/chems/food/poachedegg
	name = "poached egg"
	desc = "A delicately poached egg with a runny yolk. Healthier than its fried counterpart."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "poachedegg"
	plate = /obj/item/plate
	filling_color = "#ffdf78"
	nutriment_amt = 1
	nutriment_desc = list("egg" = 1)
	bitesize = 2

/obj/item/chems/food/poachedegg/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/protein, 3)
	add_to_reagents(/decl/material/solid/blackpepper, 1)

/obj/item/chems/food/nt_muffin
	name = "\improper NtMuffin"
	desc = "A NanoTrasen sponsered biscuit with egg, cheese, and sausage."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "nt_muffin"
	nutriment_amt = 3
	nutriment_desc = list("biscuit" = 3)

/obj/item/chems/food/nt_muffin/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/protein, 5)

/obj/item/chems/food/baconburger
	name = "bacon burger"
	desc = "The cornerstone of every nutritious breakfast, now with bacon!"
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "baconburger"
	filling_color = "#d63c3c"
	nutriment_amt = 3
	nutriment_desc = list("bun" = 2)
	bitesize = 2

/obj/item/chems/food/baconburger/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/protein, 4)

/obj/item/chems/food/blt
	name = "BLT"
	desc = "Bacon, lettuce, tomatoes. The perfect lunch."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "blt"
	filling_color = "#d63c3c"
	nutriment_desc = list("bread" = 4, "lettuce" = 2, "tomato" = 2)
	nutriment_amt = 8
	bitesize = 2

/obj/item/chems/food/blt/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/protein, 4)

/obj/item/chems/food/blt/cbt
	name = "CBT"
	desc = "A cabbage, bacon, and tomato sandwich. Someone busted their balls to make this."
	nutriment_desc = list("bread" = 4, "cabbage" = 2, "tomato" = 2)

/obj/item/chems/food/sweet_and_sour
	name = "sweet and sour pork"
	desc = "A traditional ancient sol recipe with a few liberties taken with meat selection."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "sweet_and_sour"
	nutriment_desc = list("sweet and sour" = 6)
	nutriment_amt = 6
	plate = /obj/item/plate

/obj/item/chems/food/sweet_and_sour/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/protein, 3)

/obj/item/chems/food/bacon_flatbread
	name = "bacon cheese flatbread"
	desc = "Not a pizza."
	icon_state = "bacon_pizza"
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	nutriment_amt = 5
	nutriment_desc = list("flatbread" = 5)

/obj/item/chems/food/bacon_flatbread/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/protein, 5)

/obj/item/chems/food/meat_pocket
	name = "meat pocket"
	desc = "Meat and cheese stuffed in a flatbread pocket, grilled to perfection."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "meat_pocket"
	nutriment_amt = 3
	nutriment_desc = list("flatbread" = 3)

/obj/item/chems/food/meat_pocket/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/protein, 3)

/obj/item/chems/food/crabmeat
	name = "crab legs"
	desc = "... Coffee? Is that you?"
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "crabmeat"
	bitesize = 1

/obj/item/chems/food/crabmeat/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/protein, 2)

/mob/living/simple_animal/crab/meat_type = /obj/item/chems/food/crabmeat

/obj/item/chems/food/crab_legs
	name = "steamed crab legs"
	desc = "Crab legs steamed and buttered to perfection. One day when the boss gets hungry..."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "crablegs"
	nutriment_amt = 2
	nutriment_desc = list("savory butter" = 2)
	bitesize = 2
	plate = /obj/item/plate

/obj/item/chems/food/crab_legs/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/protein, 6)
	add_to_reagents(/decl/material/solid/sodiumchloride, 1)

/obj/item/chems/food/nugget
	name = "chicken nugget"
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "nugget_lump"
	bitesize = 3

/obj/item/chems/food/nugget/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/protein, 4)
	var/shape = pick("lump", "star", "lizard", "corgi")
	desc = "A chicken nugget vaguely shaped like a [shape]."
	icon_state = "nugget_[shape]"

/obj/item/chems/food/hatchling_surprise
	name = "hatchling surprise"
	desc = "A poached egg on top of three slices of bacon. A typical breakfast for hungry Unathi children."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "hatchling_surprise"
	trash = /obj/item/trash/snack_bowl
	nutriment_type = /decl/material/liquid/nutriment/protein
	nutriment_amt = 4

/obj/item/chems/food/hatchling_surprise/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/protein/egg, 2)

/obj/item/chems/food/red_sun_special
	name = "red sun special"
	desc = "One lousy piece of sausage sitting on melted cheese curds. A cheap meal for the Unathi peasants of Moghes."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "red_sun_special"
	plate = /obj/item/plate
	nutriment_amt = 2
	nutriment_type = /decl/material/liquid/nutriment/protein

/obj/item/chems/food/riztizkzi_sea
	name = "moghesian sea delight"
	desc = "Three raw eggs floating in a sea of blood. An authentic replication of an ancient Unathi delicacy."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "riztizkzi_sea"
	trash = /obj/item/trash/snack_bowl
	nutriment_type = /decl/material/liquid/nutriment/protein/egg
	nutriment_amt = 4

/obj/item/chems/food/father_breakfast
	name = "breakfast of champions"
	desc = "A sausage and an omelette on top of a grilled steak."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "father_breakfast"
	plate = /obj/item/plate
	nutriment_type = /decl/material/liquid/nutriment/protein
	nutriment_amt = 6

/obj/item/chems/food/father_breakfast/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/protein/egg, 4)

/obj/item/chems/food/stuffed_meatball
	name = "stuffed meatball" //YES
	desc = "A meatball loaded with cheese."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "stuffed_meatball"
	nutriment_type = /decl/material/liquid/nutriment/protein
	nutriment_amt = 4

/obj/item/chems/food/egg_pancake
	name = "meat pancake"
	desc = "An omelette baked on top of a giant meat patty. This monstrousity is typically shared between four people during a dinnertime meal."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "egg_pancake"
	plate = /obj/item/plate
	nutriment_type = /decl/material/liquid/nutriment/protein
	nutriment_amt = 6

/obj/item/chems/food/egg_pancake/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/protein/egg, 2)

/obj/item/chems/food/ribplate
	name = "plate of ribs"
	desc = "A half-rack of ribs, brushed with some sort of honey-glaze. Why are there no napkins on board?"
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "ribplate"
	plate = /obj/item/plate
	filling_color = "#7a3d11"
	nutriment_amt = 6
	nutriment_desc = list("barbecue" = 6)
	bitesize = 4

/obj/item/chems/food/ribplate/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/protein, 6)
	add_to_reagents(/decl/material/liquid/nutriment/triglyceride, 2)
	add_to_reagents(/decl/material/solid/blackpepper, 1)
	add_to_reagents(/decl/material/liquid/nutriment/honey, 5)

/obj/item/chems/food/generalschicken
	name = "general's chicken"
	desc = "Sweet, spicy, and fried. General's Chicken has been around for more than five-hundred years now, and still tastes good."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "generaltso"
	plate = /obj/item/plate
	nutriment_amt = 4
	nutriment_desc = list("sweet and spicy sauce" = 4)
	bitesize = 2

/obj/item/chems/food/generalschicken/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/protein, 4)

/obj/item/chems/food/roastbeef
	name = "roast beef"
	desc = "It's beef. It's roasted. It's been a staple of dining tradition for centuries."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "roastbeef"
	plate = /obj/item/plate
	nutriment_amt = 8
	nutriment_desc = list("cooked meat" = 5)
	bitesize = 2

/obj/item/chems/food/roastbeef/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/protein, 4) //For meaty things.

/obj/item/storage/box/wings //This is kinda like the donut box.
	name = "wing basket"
	desc = "A basket of chicken wings! Get some before they're all gone! Or maybe you're too late..."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "wings5"
	var/icon_base = "wings"
	max_storage_space = ITEM_SIZE_SMALL * 5
	can_hold = list(/obj/item/chems/food/chickenwing)


/obj/item/storage/box/wings/WillContain()
	return list(
		/obj/item/chems/food/chickenwing = 5
	)

/obj/item/storage/box/wings/empty/WillContain()
	return null

/decl/stack_recipe/cardstock/box/wings
	name = "chicken wings box"
	result_type = /obj/item/storage/box/wings/empty

/obj/item/storage/box/wings/Initialize()
	. = ..()
	update_icon()
	return

/obj/item/storage/box/wings/on_update_icon()
	var/i = 0
	for(var/obj/item/chems/food/W in get_contained_external_atoms())
		i++
	icon_state = "[icon_base][i]"

/obj/item/chems/food/chickenwing
	name = "chicken wing"
	desc = "What flavor even is this? Buffalo? Barbecue? Or something more exotic?"
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "wing"
	nutriment_amt = 2
	nutriment_desc = list("nondescript flavor sauce" = 4)
	bitesize = 3

/obj/item/chems/food/chickenwing/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/protein, 2)

/obj/item/chems/food/donerkebab
	name = "doner kebab"
	desc = "A delicious sandwich-like food from ancient Earth. The meat is typically cooked on a vertical rotisserie."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "doner_kebab"
	nutriment_amt = 5
	nutriment_desc = list("vegetables" = 2, "seasoned meat" = 5)

/obj/item/chems/food/donerkebab/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/protein, 2) //For meaty things.

/obj/item/chems/food/fish_taco
	name = "carp taco"
	desc = "A questionably cooked fish taco decorated with herbs, spices, and special sauce."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "fish_taco"
	nutriment_amt = 3
	nutriment_desc = list("flatbread" = 3)

/obj/item/chems/food/fish_taco/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/protein, 3)

/obj/item/chems/food/lasagna
	name = "lasagna"
	desc = "Favorite of cats."
	icon_state = "lasagna"
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	plate = /obj/item/plate/tray
	center_of_mass = @'{"x":16,"y":17}'
	nutriment_amt = 6
	nutriment_desc = list("pasta" = 4, "tomato" = 2)
	bitesize = 3

/obj/item/chems/food/lasagna/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/protein, 6)