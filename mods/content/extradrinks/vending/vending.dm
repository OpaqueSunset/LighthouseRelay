/obj/machinery/vending/boozeomat/Initialize()
	var/static/list/new_extradrinks_products = list(
		/obj/item/chems/drinks/bottle/arak = 5,
		/obj/item/chems/drinks/bottle/baijiu = 5,
		/obj/item/chems/drinks/bottle/blackstrap = 5,
		/obj/item/chems/drinks/bottle/cachaca = 5,
		/obj/item/chems/drinks/bottle/pink_gin = 5,
		/obj/item/chems/drinks/bottle/ogogoro = 5,
		/obj/item/chems/drinks/bottle/prosecco = 5,
		/obj/item/chems/drinks/bottle/rakia = 5,
		/obj/item/chems/drinks/bottle/soju = 5,
		/obj/item/chems/drinks/bottle/tej = 5,
		/obj/item/chems/drinks/bottle/mars_whiskey = 5,
		/obj/item/chems/drinks/bottle/hrenti = 5,
		/obj/item/chems/drinks/bottle/wasgaelhi = 5,
		/obj/item/chems/drinks/bottle/yekala = 5,
		/obj/item/chems/drinks/bottle/qokkhrona = 2,
		/obj/item/chems/drinks/bottle/small/cider_apple = 15,
		/obj/item/chems/drinks/bottle/small/cider_pear = 15,
		/obj/item/chems/drinks/bottle/small/lager = 15,
		/obj/item/chems/drinks/bottle/small/martianbeer = 15,
		/obj/item/chems/drinks/bottle/small/alcoholfreebeer = 15,
		/obj/item/chems/drinks/bottle/small/rootbeer = 15,
		/obj/item/chems/drinks/bottle/small/dnb = 15,
		/obj/item/chems/drinks/cans/beastenergy = 15,
		/obj/item/chems/drinks/bottle/small/eggnog = 15,
		/obj/item/chems/drinks/bottle/hrukhza = 5,
		/obj/item/chems/drinks/bottle/lemonjuice = 5,
		/obj/item/chems/drinks/bottle/pineapplejuice = 5,
	)
	var/static/list/new_extradrinks_contraband = list(
		/obj/item/chems/drinks/bottle/brandy = 5,
	)
// TODO: CONVERT TO USE A HELPER
	LAZYREMOVE(products, new_extradrinks_products) // clear duplicates
	LAZYADD(products, new_extradrinks_products)
	LAZYREMOVE(contraband, new_extradrinks_contraband)
	LAZYADD(contraband, new_extradrinks_contraband)
	. = ..()

/obj/machinery/vending/coffee/Initialize()
	var/list/static/new_extradrinks_products = list(
	/obj/item/chems/drinks/decaf = 15
	)
	LAZYREMOVE(products, new_extradrinks_products)
	LAZYADD(products, new_extradrinks_products)
	. = ..()

/obj/machinery/vending/cola/Initialize()
	var/list/new_extradrinks_products = list(
		/obj/item/chems/drinks/cans/coffeecola = 10,
		/obj/item/chems/drinks/cans/vanillacola = 10,
		/obj/item/chems/drinks/cans/ionbru = 10,
		/obj/item/chems/drinks/cans/europa = 10
	)
	LAZYREMOVE(products, new_extradrinks_products)
	LAZYADD(products, new_extradrinks_products)
	. = ..()