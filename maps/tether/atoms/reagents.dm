/obj/item/chems/glass/bottle/tramadol
	desc = "A small bottle of tramadol, an effective but dangerous and addictive painkiller. Do not mix with alcohol."

/obj/item/chems/glass/bottle/tramadol/populate_reagents()
	reagents.add_reagent(/decl/material/liquid/painkillers/strong, reagents.maximum_volume)