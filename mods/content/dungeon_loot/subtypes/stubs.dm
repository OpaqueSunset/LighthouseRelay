// Base type for alien piles.
/obj/structure/loot_pile/surface/alien
	name = "alien pod"
	desc = "A pod which looks bigger on the inside. Something quite shiny might be inside?"
	icon_state = "alien_pile1"

/obj/structure/loot_pile/surface/alien
// May contain alien tools.
/obj/structure/loot_pile/surface/alien/engineering
// May contain alien surgery equipment or powerful medication.
/obj/structure/loot_pile/surface/alien/medical
// May contain powercells or alien weaponry.
/obj/structure/loot_pile/surface/alien/security
// The pile found at the very end, and as such has the best loot.
/obj/structure/loot_pile/surface/alien/end
	chance_uncommon = 30
	chance_rare = 10