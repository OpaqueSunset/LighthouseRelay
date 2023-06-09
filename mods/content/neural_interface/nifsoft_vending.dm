/obj/machinery/vending/nifsofts
	name = "\improper NIFsoft store"
	desc = "An automated kiosk selling NIFsoft install disks. Products are only authorized for use with NIFs and not for individual resale or modification."
	icon_state = "robotics" // todo: custom icon with a different screen
	base_type = /obj/machinery/vending/nifsofts
	products = list(
		/obj/item/disk/nifsoft/single/arhud       = 10,
		/obj/item/disk/nifsoft/single/medihud     = 10,
		/obj/item/disk/nifsoft/single/sechud      = 10,
		/obj/item/disk/nifsoft/single/janihud     = 10,
		/obj/item/disk/nifsoft/single/suitsensors = 10,
		/obj/item/disk/nifsoft/bundle/medical     =  5,
	)