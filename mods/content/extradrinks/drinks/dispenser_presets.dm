/obj/machinery/chemical_dispenser/bar_alc/full/Initialize()
	LAZYDISTINCTADD(spawn_cartridges, list(
			/obj/item/chems/chem_disp_cartridge/baijiu,
			/obj/item/chems/chem_disp_cartridge/ogogoro,
	))
	. = ..()

/obj/machinery/chemical_dispenser/bar_coffee/full/Initialize()
	LAZYDISTINCTADD(spawn_cartridges, list(
			/obj/item/chems/chem_disp_cartridge/skrianhi,
			/obj/item/chems/chem_disp_cartridge/espresso,
			/obj/item/chems/chem_disp_cartridge/syrup_affelerin,
			/obj/item/chems/chem_disp_cartridge/decafcoffee
	))
	. = ..()

/obj/machinery/chemical_dispenser/bar_soft/full/Initialize()
	LAZYDISTINCTADD(spawn_cartridges, list(
			/obj/item/chems/chem_disp_cartridge/europa,
			/obj/item/chems/chem_disp_cartridge/melon,
			/obj/item/chems/chem_disp_cartridge/pineapple,
			/obj/item/chems/chem_disp_cartridge/rootbeer,
			/obj/item/chems/chem_disp_cartridge/afbeer,
			/obj/item/chems/chem_disp_cartridge/hrukhza
	))
	. = ..()