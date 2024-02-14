/obj/item/chems/drinks/cans/europa
	name = "Europa Punch!"
	desc = "A can of Europa Punch, a delicious juice made from various aquatic plants!"
	DRINK_STATE("europa")
	center_of_mass = @'{"x":16,"y":10}'

/obj/item/chems/drinks/cans/europa/Initialize()
	. = ..()
	reagents.add_reagent(/decl/material/liquid/drink/juice/europa, 30)

/obj/item/chems/drinks/cans/ionbru
	name = "Ion-Bru"
	desc = "A can of Ion-Bru, the drink of shipbuilders."
	DRINK_STATE("ionbru")
	center_of_mass = @'{"x":16,"y":10}'

/obj/item/chems/drinks/cans/ionbru/Initialize()
	. = ..()
	reagents.add_reagent(/decl/material/liquid/drink/ionbru, 30)

/obj/item/chems/drinks/cans/vanillacola
	name = "Vanilla Cola"
	desc = "A can of vanilla cola."
	DRINK_STATE("vcola")
	center_of_mass = @'{"x":16,"y":10}'

/obj/item/chems/drinks/cans/vanillacola/Initialize()
	. = ..()
	reagents.add_reagent(/decl/material/liquid/drink/cola/vanilla, 30)

/obj/item/chems/drinks/cans/coffeecola
	name = "Coffee Cola"
	desc = "A can of coffee cola."
	DRINK_STATE("ccola")
	center_of_mass = @'{"x":16,"y":10}'

/obj/item/chems/drinks/cans/coffeecola/Initialize()
	. = ..()
	reagents.add_reagent(/decl/material/liquid/drink/cola/coffee, 30)

/obj/item/chems/drinks/cans/zazkis
	name = "Hsstik Zazkis"
	desc = "A chilled can of zazkis, a Moghsian delight."
	DRINK_STATE("zazkis")
	center_of_mass = @'{"x":16,"y":10}'

/obj/item/chems/drinks/cans/zazkis/Initialize()
	. = ..()
	reagents.add_reagent(/decl/material/liquid/drink/zazkis, 30)