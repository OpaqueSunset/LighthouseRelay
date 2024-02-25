/obj/item/chems/drinks/decaf
	name = "\improper Robust Decaffeinated Coffee"
	desc = "Careful, the beverage you're about to enjoy is extremely hot. It contains no caffeine."
	DRINK_STATE("coffee")
	center_of_mass = @'{"x":15,"y":10}'

/obj/item/chems/drinks/decaf/Initialize()
	. = ..()
	add_to_reagents(/decl/material/liquid/drink/decafcoffee, 30)