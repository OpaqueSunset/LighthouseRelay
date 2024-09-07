// Chip update.
/obj/item/food/tortilla
	name = "tortilla"
	desc = "A thin, flour-based tortilla that can be used in a variety of dishes, or can be served as is."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "tortilla"
	bitesize = 3
	nutriment_desc = list("tortilla" = 3)
	nutriment_amt = 6

//chips
/obj/item/food/chip
	name = "chip"
	desc = "A portion sized chip good for dipping."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "chip"
	var/bitten_state = "chip_half"
	bitesize = 1
	nutriment_desc = list("fried tortilla chips" = 2)
	nutriment_amt = 2

/obj/item/food/chip/handle_consumed(mob/M as mob)
	. = ..()
	if(reagents && reagents.total_volume)
		icon_state = bitten_state

/obj/item/food/chip/salsa
	name = "salsa chip"
	desc = "A portion sized chip good for dipping. This one has salsa on it."
	icon_state = "chip_salsa"
	bitten_state = "chip_half"
	nutriment_desc = list("fried tortilla chips" = 1, "salsa" = 1)

/obj/item/food/chip/guac
	name = "guac chip"
	desc = "A portion sized chip good for dipping. This one has guac on it."
	icon_state = "chip_guac"
	bitten_state = "chip_half"
	nutriment_desc = list("fried tortilla chips" = 1, "guacamole" = 1)

/obj/item/food/chip/cheese
	name = "cheese chip"
	desc = "A portion sized chip good for dipping. This one has cheese sauce on it."
	icon_state = "chip_cheese"
	bitten_state = "chip_half"
	nutriment_desc = list("fried tortilla chips" = 1, "cheese" = 1)

/obj/item/food/chip/nacho
	name = "nacho chip"
	desc = "A nacho ship stray from a plate of cheesy nachos."
	icon_state = "chip_nacho"
	bitten_state = "chip_half"
	nutriment_desc = list("nacho chips" = 2)

/obj/item/food/chip/nacho/salsa
	name = "nacho chip"
	desc = "A nacho ship stray from a plate of cheesy nachos. This one has salsa on it."
	icon_state = "chip_nacho_salsa"
	bitten_state = "chip_half"

/obj/item/food/chip/nacho/guac
	name = "nacho chip"
	desc = "A nacho ship stray from a plate of cheesy nachos. This one has guac on it."
	icon_state = "chip_nacho_guac"
	bitten_state = "chip_half"

/obj/item/food/chip/nacho/cheese
	name = "nacho chip"
	desc = "A nacho ship stray from a plate of cheesy nachos. This one has extra cheese on it."
	icon_state = "chip_nacho_cheese"
	bitten_state = "chip_half"

// chip plates
/obj/item/food/chipplate
	name = "basket of chips"
	desc = "A plate of chips intended for dipping."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "chip_basket"
	trash = /obj/item/trash/chipbasket
	var/vendingobject = /obj/item/food/chip
	nutriment_desc = list("tortilla chips" = 10)
	bitesize = 1
	nutriment_amt = 10

/obj/item/food/chipplate/attack_hand(mob/user)
	. = ..()
	var/obj/item/food/returningitem = new vendingobject(loc)
	returningitem.reagents.clear_reagents()
	reagents.trans_to_holder(returningitem.reagents, bitesize)
	returningitem.bitesize = bitesize/2
	user.put_in_hands(returningitem)
	if (reagents && reagents.total_volume)
		to_chat(user, "You take a chip from the plate.")
	else
		to_chat(user, "You take the last chip from the plate.")
		var/obj/waste = new trash(loc)
		if (loc == user)
			user.put_in_hands(waste)
		qdel(src)

/obj/item/food/chipplate/MouseDrop(mob/user) //Dropping the chip onto the user
	if(istype(user))
		user.put_in_active_hand(src)
		return
	. = ..()

/obj/item/food/chipplate/nachos
	name = "plate of nachos"
	desc = "A very cheesy nacho plate."
	icon_state = "nachos"
	plate = /obj/item/plate
	vendingobject = /obj/item/food/chip/nacho
	nutriment_desc = list("tortilla chips" = 10)
	bitesize = 1
	nutriment_amt = 10

//dips
/obj/item/food/dip
	name = "queso dip"
	desc = "A simple, cheesy dip consisting of tomatos, cheese, and spices."
	var/nachotrans = /obj/item/food/chip/nacho/cheese
	var/chiptrans = /obj/item/food/chip/cheese
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "dip_cheese"
	trash = /obj/item/trash/dipbowl
	bitesize = 1
	nutriment_desc = list("queso" = 20)
	nutriment_amt = 20

/obj/item/food/dip/attackby(var/obj/item/food/item, var/mob/user)
	. = ..()
	var/obj/item/food/returningitem
	if(istype(item,/obj/item/food/chip/nacho) && item.icon_state == "chip_nacho")
		returningitem = new nachotrans(src)
	else if (istype(item,/obj/item/food/chip) && (item.icon_state == "chip" || item.icon_state == "chip_half"))
		returningitem = new chiptrans(src)
	if(returningitem)
		returningitem.reagents.clear_reagents() //Clear the new chip
		var/memed = 0
		item.reagents.trans_to_holder(returningitem.reagents, item.reagents.total_volume) //Old chip to new chip
		if(item.icon_state == "chip_half")
			returningitem.icon_state = "[returningitem.icon_state]_half"
			returningitem.bitesize = clamp(returningitem.reagents.total_volume,1,10)
		else if(prob(1))
			memed = 1
			to_chat(user, "You scoop up some dip with the chip, but mid-scoop, the chip breaks off into the dreadful abyss of dip, never to be seen again...")
			returningitem.icon_state = "[returningitem.icon_state]_half"
			returningitem.bitesize = clamp(returningitem.reagents.total_volume,1,10)
		else
			returningitem.bitesize = clamp(returningitem.reagents.total_volume*0.5,1,10)
		qdel(item)
		reagents.trans_to_holder(returningitem.reagents, bitesize) //Dip to new chip
		user.put_in_hands(returningitem)

		if(!memed)
			to_chat(user, "You scoop up [(reagents && reagents.total_volume) ? "some" : "the remaining"] dip with \the [item].")
		if (!reagents || !reagents.total_volume)
			var/obj/waste = new trash(loc)
			if (loc == user)
				user.put_in_hands(waste)
			qdel(src)

/obj/item/food/dip/salsa
	name = "salsa dip"
	desc = "Traditional Sol chunky salsa dip containing tomatos, peppers, and spices."
	nachotrans = /obj/item/food/chip/nacho/salsa
	chiptrans = /obj/item/food/chip/salsa
	icon_state = "dip_salsa"
	nutriment_desc = list("salsa" = 20)
	nutriment_amt = 20

/obj/item/food/dip/guac
	name = "guac dip"
	desc = "A recreation of the ancient Sol 'Guacamole' dip using tofu, limes, and spices. This recreation obviously leaves out mole meat."
	nachotrans = /obj/item/food/chip/nacho/guac
	chiptrans = /obj/item/food/chip/guac
	icon_state = "dip_guac"
	nutriment_desc = list("guacamole" = 20)
	nutriment_amt = 20

//burritos
/obj/item/food/burrito
	name = "meat burrito"
	desc = "Meat wrapped in a flour tortilla. It's a burrito by definition."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "burrito"
	bitesize = 4
	nutriment_desc = list("tortilla" = 3)
	nutriment_amt = 3

/obj/item/food/burrito/Initialize()
	. = ..()
	add_to_reagents(/decl/material/solid/organic/meat, 6)

/obj/item/food/burrito_vegan
	name = "vegan burrito"
	desc = "Tofu wrapped in a flour tortilla. Those seen with this food object are Valid."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "burrito_vegan"
	bitesize = 4
	nutriment_desc = list("tortilla" = 3)
	nutriment_amt = 3

/obj/item/food/burrito_vegan/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/plant_protein, 6)

/obj/item/food/burrito_spicy
	name = "spicy meat burrito"
	desc = "Meat and chilis wrapped in a flour tortilla."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "burrito_spicy"
	bitesize = 4
	nutriment_desc = list("tortilla" = 3)
	nutriment_amt = 3

/obj/item/food/burrito_spicy/Initialize()
	. = ..()
	add_to_reagents(/decl/material/solid/organic/meat, 6)
	add_to_reagents(/decl/material/liquid/capsaicin, 3)

/obj/item/food/burrito_cheese
	name = "meat cheese burrito"
	desc = "Meat and melted cheese wrapped in a flour tortilla."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "burrito_cheese"
	bitesize = 4
	nutriment_desc = list("tortilla" = 3, "cheese" = 3)
	nutriment_amt = 6

/obj/item/food/burrito_cheese/Initialize()
	. = ..()
	add_to_reagents(/decl/material/solid/organic/meat, 6)

/obj/item/food/burrito_cheese_spicy
	name = "spicy cheese meat burrito"
	desc = "Meat, melted cheese, and chilis wrapped in a flour tortilla."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "burrito_cheese_spicy"
	bitesize = 4
	nutriment_desc = list("tortilla" = 3, "cheese" = 3)
	nutriment_amt = 6

/obj/item/food/burrito_cheese_spicy/Initialize()
	. = ..()
	add_to_reagents(/decl/material/solid/organic/meat, 6)
	add_to_reagents(/decl/material/liquid/capsaicin, 3)

/obj/item/food/burrito_hell
	name = "el diablo"
	desc = "Meat and an insane amount of chilis packed in a flour tortilla. The Chaplain will see you now."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "burrito_hell"
	bitesize = 4
	nutriment_desc = list("hellfire" = 6)
	nutriment_amt = 24// 10 Chilis is a lot.

/obj/item/food/breakfast_wrap
	name = "breakfast wrap"
	desc = "Bacon, eggs, cheese, and tortilla grilled to perfection."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "breakfast_wrap"
	bitesize = 4
	nutriment_desc = list("tortilla" = 3)
	nutriment_amt = 3

/obj/item/food/breakfast_wrap/Initialize()
	. = ..()
	add_to_reagents(/decl/material/solid/organic/meat, 9)
	add_to_reagents(/decl/material/liquid/capsaicin/condensed, 20)

/obj/item/food/burrito_mystery
	name = "mystery meat burrito"
	desc = "The mystery is, why aren't you nuking it?"
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "burrito_mystery"
	bitesize = 5
	nutriment_desc = list("regret" = 6)
	nutriment_amt = 6