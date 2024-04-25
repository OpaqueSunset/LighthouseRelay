/obj/structure/window/reinforced/polarized/full
	maxhealth = 80

//Special map objects

/datum/turbolift
	music = list('sound/music/elevator.ogg')  // Woo elevator music!

/obj/machinery/atmospherics/unary/vent_pump/positive
	use_power = USE_POWER_IDLE
	icon_state = "map_vent_out"
	external_pressure_bound = ONE_ATMOSPHERE * 1.1

//
// Holodorms
//
/obj/machinery/computer/holodeck_control/holodorm
	name = "Don't use this one!!!"
	powerdown_program = "Off"
	default_program = "Off"

	//Smollodeck
	active_power_usage = 500
	item_power_usage = 100

	supported_programs = list(
	"Off"			= new/datum/holodeck_program(/area/holodeck/holodorm/source_off),
	"Basic Dorm"	= new/datum/holodeck_program(/area/holodeck/holodorm/source_basic),
	"Table Seating"	= new/datum/holodeck_program(/area/holodeck/holodorm/source_seating),
	"Beach Sim"		= new/datum/holodeck_program(/area/holodeck/holodorm/source_beach),
	"Desert Area"	= new/datum/holodeck_program(/area/holodeck/holodorm/source_desert),
	"Snow Field"	= new/datum/holodeck_program(/area/holodeck/holodorm/source_snow),
	"Flower Garden"	= new/datum/holodeck_program(/area/holodeck/holodorm/source_garden),
	"Space Sim"		= new/datum/holodeck_program(/area/holodeck/holodorm/source_space),
	"Boxing Ring"	= new/datum/holodeck_program(/area/holodeck/holodorm/source_boxing)
	)

//
//Holosurgery
//
/obj/machinery/computer/holodeck_control/holosurgery
	name = "Don't use this one either."
	powerdown_program = "Off"
	default_program = "Off"

	//Surgerydeck
	active_power_usage = 500
	item_power_usage = 100

	supported_programs = list(
	"Off"			= new/datum/holodeck_program(/area/holodeck/holodorm/source_emptysurgery),
	"Basic Suite"	= new/datum/holodeck_program(/area/holodeck/holodorm/source_standard),
	"Phoron Suite"	= new/datum/holodeck_program(/area/holodeck/holodorm/source_phoron),
	"Zaddat Suite"	= new/datum/holodeck_program(/area/holodeck/holodorm/source_zaddat)
	)

/obj/machinery/computer/holodeck_control/holosurgery
	name = "holosurgery control"
	linkedholodeck_area = /area/medical/surgery/holosurgery

// Our map is small, if the supermatter is ejected lets not have it just blow up somewhere else
/obj/machinery/power/supermatter/touch_map_edge()
	qdel(src)
