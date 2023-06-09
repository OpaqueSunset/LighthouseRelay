ARBITRARY_WORTH(/obj/item/disk/nifsoft/single/medihud, 80)
/obj/item/disk/nifsoft/single/medihud
	installed_nifsoft = /datum/computer_file/program/nifsoft/nif_hud/med_hud

ARBITRARY_WORTH(/obj/item/disk/nifsoft/single/medihud, 100)
/obj/item/disk/nifsoft/single/suitsensors
	installed_nifsoft = /datum/computer_file/program/nifsoft/suit_sensors

ARBITRARY_WORTH(/obj/item/disk/nifsoft/bundle/medical, 160) // should be slightly discounted compared to buying them separate
/obj/item/disk/nifsoft/bundle/medical
	name = "\improper NIFsoft install disk - Medical"
	bundle_desc = "A bundle of useful medical-related NIF software."
	installed_nifsofts = list(
		/datum/computer_file/program/nifsoft/nif_hud/med_hud,
		/datum/computer_file/program/nifsoft/suit_sensors,
		// todo: self-body-scanner
	)
