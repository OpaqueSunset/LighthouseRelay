/obj/item/gun/projectile/automatic/smg/lethal
	magazine_type = /obj/item/ammo_magazine/smg

/obj/item/gun/pistol/holdout/silenced
	silencer = new /obj/item/silencer

/obj/item/gun/energy/gun/small/reloadable
	name = "reloadable small energy gun"
	desc = "A smaller model of the versatile LAEP90 Perun, the LAEP90-CR packs considerable utility in a smaller package, and allows hotswapping of power cells for times when rechargers aren't available. Best used in situations where full-sized sidearms are inappropriate."

/obj/item/gun/energy/gun/small/reloadable/setup_power_supply(loaded_cell_type, accepted_cell_type, power_supply_extension_type, charge_value)
	return ..(/obj/item/cell/gun, /obj/item/cell/gun, /datum/extension/loaded_cell, charge_value)