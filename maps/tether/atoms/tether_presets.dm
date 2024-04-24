/obj/machinery/newscaster/security_unit
	base_type = /obj/machinery/newscaster
	securityCaster = TRUE
/obj/machinery/vending/wallmed1/public
	markup = 0

/obj/abstract/map_data/tether
	height = 7

/obj/machinery/computer/holodeck_control/alphadeck
	linkedholodeck_area = /area/holodeck/alphadeck
	programs_list_id = "TetherMainHolodeck"

/obj/machinery/computer/holodeck_control/holodorm
	abstract_type = /obj/machinery/computer/holodeck_control/holodorm
	//Smollodeck
	active_power_usage = 500
	item_power_usage = 100
	programs_list_id = "TetherHolodorm"

/obj/machinery/computer/holodeck_control/holodorm/one
	name = "dorm one holodeck control console"
	linkedholodeck_area = /area/crew_quarters/sleep/Dorm_1/holo

/obj/machinery/computer/holodeck_control/holodorm/three
	name = "dorm three holodeck control console"
	linkedholodeck_area = /area/crew_quarters/sleep/Dorm_3/holo

/obj/machinery/computer/holodeck_control/holodorm/five
	name = "dorm five holodeck control console"
	linkedholodeck_area = /area/crew_quarters/sleep/Dorm_5/holo

/obj/machinery/computer/holodeck_control/holodorm/seven
	name = "dorm seven holodeck control console"
	linkedholodeck_area = /area/crew_quarters/sleep/Dorm_7/holo

/obj/machinery/network/router/lighthouse
	initial_network_id = "LighthouseRelay"

/obj/machinery/network/relay/wall_mounted/lighthouse
	initial_network_id = "LighthouseRelay"