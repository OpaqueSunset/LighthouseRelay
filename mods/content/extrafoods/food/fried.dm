/obj/item/food/chickenfillet
	name = "chicken fillet sandwich"
	desc = "Fried chicken, in sandwich format. Beauty is simplicity."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "chickenfillet"
	filling_color = "#e9adff"
	nutriment_amt = 4
	nutriment_desc = list("breading" = 4)
	bitesize = 3

/obj/item/food/chickenfillet/Initialize()
	. = ..()
	add_to_reagents(/decl/material/solid/organic/meat, 8)

/obj/item/food/chilicheesefries
	name = "chili cheese fries"
	gender = PLURAL
	desc = "A mighty plate of fries, drowned in hot chili and cheese sauce. Because your arteries are overrated."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "chilicheesefries"
	plate = /obj/item/plate
	filling_color = "#eddd00"
	nutriment_amt = 8
	nutriment_desc = list("hearty, cheesy fries" = 8)
	bitesize = 3

/obj/item/food/chilicheesefries/Initialize()
	. = ..()
	add_to_reagents(/decl/material/solid/organic/meat, 2)
	add_to_reagents(/decl/material/liquid/capsaicin, 2)

/obj/item/food/carrotfries
	name = "carrot fries"
	desc = "Tasty fries from fresh carrots."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "carrotfries"
	plate = /obj/item/plate
	filling_color = "#faa005"
	nutriment_amt = 3
	nutriment_desc = list("carrot" = 3)
	bitesize = 2

/obj/item/food/carrotfries/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/eyedrops, 1)
	add_to_reagents(/decl/material/solid/sodiumchloride, 1)

/obj/item/food/friedmushroom
	name = "fried mushroom"
	desc = "A tender, beer-battered plump helmet, fried to crispy perfection."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "friedmushroom"
	filling_color = "#eddd00"
	nutriment_amt = 4
	nutriment_desc = list("alcoholic mushrooms" = 4)
	bitesize = 6

/obj/item/food/friedmushroom/Initialize()
	. = ..()
	add_to_reagents(/decl/material/solid/organic/meat, 2)

/obj/item/food/pisanggoreng
	name = "pisang goreng"
	gender = PLURAL
	desc = "Crispy, starchy, sweet banana fritters. Popular street food in parts of Sol."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "pisanggoreng"
	plate = /obj/item/plate
	filling_color = "#301301"
	nutriment_amt = 8
	nutriment_desc = list("sweet bananas" = 8)
	bitesize = 3

/obj/item/food/pisanggoreng/Initialize()
	. = ..()
	add_to_reagents(/decl/material/solid/organic/meat, 1)

/obj/item/food/sausage/battered
	name = "battered sausage"
	desc = "A piece of mixed, long meat, battered and then deepfried."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "batteredsausage"
	filling_color = "#db0000"
	do_coating_prefix = FALSE
	bitesize = 3

/obj/item/food/sausage/battered/Initialize()
	. = ..()
	add_to_reagents(/decl/material/solid/organic/meat, 6)
	add_to_reagents(/decl/material/liquid/nutriment/batter, 1.7)
	add_to_reagents(/decl/material/liquid/nutriment/triglyceride/oil, 1.5)

/obj/item/food/jalapeno_poppers
	name = "jalapeno popper"
	desc = "A battered, deep-fried chili pepper stuffed with melted cheese."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "popper"
	filling_color = "#00aa00"
	do_coating_prefix = FALSE
	nutriment_amt = 2
	nutriment_desc = list("chili pepper" = 2)
	bitesize = 1

/obj/item/food/jalapeno_poppers/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/batter, 2)
	add_to_reagents(/decl/material/liquid/nutriment/triglyceride/oil, 2)

/obj/item/food/chickenkatsu
	name = "chicken katsu"
	desc = "A delicacy consisting of chicken fried in a light beer batter."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "katsu"
	plate = /obj/item/plate
	filling_color = "#e9adff"
	do_coating_prefix = FALSE
	bitesize = 1.5

/obj/item/food/chickenkatsu/Initialize()
	. = ..()
	add_to_reagents(/decl/material/solid/organic/meat, 6)
	add_to_reagents(/decl/material/liquid/nutriment/batter/beerbatter, 2)
	add_to_reagents(/decl/material/liquid/nutriment/triglyceride/oil, 1)

/obj/item/food/fries
	name = "fries" // NOT CHIPS

/obj/item/food/fries/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/triglyceride/oil, 1.2)

// i'm putting these here because they're fries
// even though they're not actually fried
/obj/item/food/microfries
	name = "micro chips"
	desc = "Soft and rubbery, should have fried them. Good for smaller crewmembers, maybe?"
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "microfries"
	plate = /obj/item/plate
	filling_color = "#eddd00"
	nutriment_amt = 4
	nutriment_desc = list("soggy potato slices" = 4)
	bitesize = 2

/obj/item/food/ovenfries
	name = "baked fries"
	desc = "Dark and crispy, but a bit dry."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "bakedfries"
	plate = /obj/item/plate
	filling_color = "#eddd00"
	nutriment_amt = 4
	nutriment_desc = list("crisp, dry fries" = 4)
	bitesize = 2

/obj/item/food/sliceable/pizza/crunch
	name = "pizza crunch"
	desc = "This was once a normal pizza, but it has been coated in batter and deep-fried. Whatever toppings it once had are a mystery, but they're still under there, somewhere..."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "pizzacrunch"
	slice_path = /obj/item/food/pizzacrunchslice
	slice_num = 6
	nutriment_amt = 25
	nutriment_desc = list("fried pizza" = 25)
	bitesize = 2

/obj/item/food/sliceable/pizza/crunch/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/batter, 6.5)
	add_to_reagents(/decl/material/liquid/nutriment/triglyceride/oil, 4)
	batter_coating = /decl/material/liquid/nutriment/batter

/obj/item/food/pizzacrunchslice
	name = "pizza crunch slice"
	desc = "A little piece of a heart attack. Its toppings are a mystery, hidden under batter."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "pizzacrunchslice"
	filling_color = "#baa14c"
	bitesize = 2

/obj/item/food/funnelcake
	name = "funnel cake"
	desc = "Funnel cakes rule!"
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "funnelcake"
	filling_color = "#ef1479"
	do_coating_prefix = FALSE
	bitesize = 2

/obj/item/food/funnelcake/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/batter, 10)
	add_to_reagents(/decl/material/liquid/nutriment/sugar, 5)
	add_to_reagents(/decl/material/liquid/nutriment/triglyceride/oil, 1)

/obj/item/food/onionrings
	name = "onion rings"
	desc = "Like circular fries but better."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "onionrings"
	plate = /obj/item/plate
	filling_color = "#eddd00"
	nutriment_desc = list("fried onions" = 5)
	nutriment_amt = 5
	bitesize = 2

/obj/item/food/corn_dog
	name = "corn dog"
	desc = "A batter-covered sausage deep-fried in oil."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "corndog"
	trash = /obj/item/trash/stick
	nutriment_type = /decl/material/liquid/nutriment/bread
	nutriment_desc = list("corn batter" = 4)
	nutriment_amt = 4
	bitesize = 2

/obj/item/food/corn_dog/Initialize()
	. = ..()
	add_to_reagents(/decl/material/solid/organic/meat, 4)
