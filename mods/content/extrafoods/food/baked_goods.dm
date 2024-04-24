// Baked goods. Or maybe they're baked bads...?
// The world may never know the truth.

/obj/item/chems/food/sliceable/keylimepie
	name = "key lime pie"
	desc = "A tart, sweet dessert. What's a key lime, anyway?"
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "keylimepie"
	slice_path = /obj/item/chems/food/keylimepieslice
	slice_num = 5
	filling_color = "#f5b951"
	nutriment_amt = 12
	nutriment_desc = list("lime" = 12)

/obj/item/chems/food/sliceable/keylimepie/Initialize()
	. = ..()
	add_to_reagents(/decl/material/solid/organic/meat, 4)
	add_to_reagents(/decl/material/liquid/nutriment/bread, 4, list("graham crackers" = 4))

/obj/item/chems/food/keylimepieslice
	name = "slice of key lime pie"
	desc = "A slice of tart pie, with whipped cream on top."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "keylimepieslice"
	plate = /obj/item/plate
	filling_color = "#f5b951"
	bitesize = 3
	nutriment_desc = list("lime" = 1)

/obj/item/chems/food/keylimepieslice/filled
	nutriment_amt = 1

/obj/item/chems/food/sliceable/quiche
	name = "quiche"
	desc = "Real men eat this, contrary to popular belief."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "quiche"
	slice_path = /obj/item/chems/food/quicheslice
	slice_num = 5
	filling_color = "#f5b951"
	nutriment_amt = 10
	nutriment_desc = list("cheese" = 5, "egg" = 5)

/obj/item/chems/food/sliceable/quiche/Initialize()
	. = ..()
	add_to_reagents(/decl/material/solid/organic/meat, 10)

/obj/item/chems/food/quicheslice
	name = "slice of quiche"
	desc = "A slice of delicious quiche. Eggy, cheesy goodness."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "quicheslice"
	plate = /obj/item/plate
	filling_color = "#f5b951"
	bitesize = 3
	nutriment_desc = list("cheesy eggs" = 1)

/obj/item/chems/food/quicheslice/filled
	nutriment_amt = 1

/obj/item/chems/food/quicheslice/filled/Initialize()
	. = ..()
	add_to_reagents(/decl/material/solid/organic/meat, 1)

/obj/item/chems/food/sliceable/brownies
	name = "brownies"
	gender = PLURAL
	desc = "Halfway to fudge, or halfway to cake? Who cares!"
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "brownies"
	slice_path = /obj/item/chems/food/browniesslice
	slice_num = 4
	trash = /obj/item/trash/brownies
	filling_color = "#301301"
	nutriment_amt = 8
	nutriment_desc = list("fudge" = 8)
	bitesize = 2

/obj/item/chems/food/sliceable/brownies/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/browniemix, 2)

/obj/item/chems/food/browniesslice
	name = "brownie"
	desc = "A dense, decadent chocolate brownie."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "browniesslice"
	plate = /obj/item/plate
	filling_color = "#f5b951"
	bitesize = 2
	nutriment_desc = list("fudge" = 1)

/obj/item/chems/food/browniesslice/filled
	nutriment_amt = 1

/obj/item/chems/food/browniesslice/filled/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/browniemix, 1)

/obj/item/chems/food/sliceable/cosmicbrownies
	name = "cosmic brownies"
	gender = PLURAL
	desc = "Like, ultra-trippy. Brownies HAVE no gender, man." //Except I had to add one!
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "cosmicbrownies"
	slice_path = /obj/item/chems/food/cosmicbrowniesslice
	slice_num = 4
	trash = /obj/item/trash/brownies
	filling_color = "#301301"
	nutriment_amt = 8
	nutriment_desc = list("fudge" = 8)
	bitesize = 3

/obj/item/chems/food/sliceable/cosmicbrownies/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/browniemix, 2)
	add_to_reagents(/decl/material/liquid/psychoactives, 2)
	add_to_reagents(/decl/material/liquid/burn_meds, 1)
	add_to_reagents(/decl/material/liquid/brute_meds, 1)
	add_to_reagents(/decl/material/liquid/bromide, 1)

/obj/item/chems/food/cosmicbrowniesslice
	name = "cosmic brownie"
	desc = "A dense, decadent and fun-looking chocolate brownie."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "cosmicbrowniesslice"
	plate = /obj/item/plate
	filling_color = "#f5b951"
	bitesize = 3
	nutriment_desc = list("fudge" = 1)

/obj/item/chems/food/cosmicbrowniesslice/filled
	nutriment_amt = 1

/obj/item/chems/food/cosmicbrowniesslice/filled/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/browniemix, 1)

/obj/item/chems/food/berrymuffin
	name = "berry muffin"
	desc = "A delicious and spongy little cake, with berries."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "berrymuffin"
	filling_color = "#e0cf9b"
	nutriment_amt = 5
	nutriment_desc = list("sweetness" = 1, "muffin" = 2, "berries" = 2)
	bitesize = 2

/obj/item/chems/food/croissant
	name = "croissant"
	desc = "True french cuisine."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	filling_color = "#e3d796"
	icon_state = "croissant"
	nutriment_amt = 4
	nutriment_desc = list("french bread" = 4)
	bitesize = 2

/obj/item/chems/food/honeybun
	name = "honey bun"
	desc = "A sticky pastry bun glazed with honey."
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "honeybun"
	nutriment_desc = list("pastry" = 2)
	nutriment_amt = 2
	bitesize = 3

/obj/item/chems/food/honeybun/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/nutriment/honey, 2)

/obj/item/chems/food/cinnamonbun
	name = "cinnamon bun"
	desc = "Life needs frosting!"
	icon = 'mods/content/extrafoods/icons/obj/food.dmi'
	icon_state = "cinnamonbun"
	nutriment_amt = 8
	nutriment_desc = list("cinnamon sugar" = 4, "frosting" = 4)
	bitesize = 2
