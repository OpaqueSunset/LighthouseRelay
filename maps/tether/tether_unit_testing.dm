/datum/map/tether
	area_coherency_test_exempted_root_areas = list(
		/area/exoplanet,
		/area/tether/surfacebase/outside,
		/area/mine/explored,
	)
	area_coherency_test_exempt_areas = list(
		/area/space,
		/area/tether/outpost/solars_outside
	)
	area_coherency_test_subarea_count = list(
		/area/centcom/restaurant = 2,
		/area/centcom/security = 2,
		/area/centcom/command = 3,
		/area/centcom/living = 3,
		/area/centcom/bathroom = 3,
		/area/outpost/research/toxins_misc_lab = 2,
		/area/maintenance/evahallway = 2,
		/area/maintenance/station/micro = 2,
		/area/rnd/research_foyer = 2,
		/area/rnd/breakroom = 2,
	)

	apc_test_exempt_areas = list(
		// exterior
		/area/space = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/exoplanet = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/tether/surfacebase/outside = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/maintenance/lower/atmos = NO_SCRUBBER|NO_VENT,
		/area/engineering/atmos/intake = NO_SCRUBBER,
		/area/rnd/external = NO_SCRUBBER|NO_VENT,
		/area/syndicate_station = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/tether/transit = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/outpost/mining_main/passage = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/tether/surfacebase/mining_main/external = NO_SCRUBBER|NO_VENT,
		/area/storage/surface_eva/external = NO_SCRUBBER|NO_VENT,
		/area/tether/outpost/solars_outside = NO_SCRUBBER|NO_VENT,
		// airlocks
		/area/outpost/mining_main/airlock = NO_SCRUBBER|NO_VENT,
		/area/tether/surfacebase/mining_main/airlock = NO_SCRUBBER|NO_VENT,
		/area/outpost/research/materials_chamber = NO_SCRUBBER,
		// holodecks
		/area/holodeck = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/medical/surgery/holosurgery = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/crew_quarters/sleep/Dorm_1/holo = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/crew_quarters/sleep/Dorm_3/holo = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/crew_quarters/sleep/Dorm_5/holo = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/crew_quarters/sleep/Dorm_7/holo = NO_SCRUBBER|NO_VENT|NO_APC,
		// construction
		/area/vacant/vacant_bar_upper = NO_SCRUBBER|NO_VENT,
		/area/vacant/vacant_restaurant_lower = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/vacant/vacant_restaurant_upper = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/vacant/vacant_office = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/vacant/vacant_site = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/vacant/vacant_site/east = NO_SCRUBBER|NO_VENT|NO_APC,
		// maintenance
		/area/maintenance = NO_SCRUBBER|NO_VENT,
		/area/engineering/shaft = NO_SCRUBBER|NO_VENT,
		/area/security/riot_control = NO_SCRUBBER|NO_VENT,
		/area/tcommsat/chamber = NO_SCRUBBER,
		/area/outpost/research/mixing = NO_SCRUBBER,
		// abstract
		/area/shuttle = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/turbolift = NO_SCRUBBER|NO_VENT|NO_APC,
		// admin
		/area/tdome = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/centcom = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/supply/station = NO_SCRUBBER|NO_VENT|NO_APC,
		// storage and sheds
		/area/tether/outpost/solars_shed = NO_SCRUBBER|NO_VENT,
		/area/tether/surfacebase/emergency_storage/rnd = NO_SCRUBBER|NO_VENT,
		/area/outpost/research/storage/surface_eva = NO_SCRUBBER|NO_VENT,
		/area/storage = NO_SCRUBBER|NO_VENT,
		/area/hydroponics/cafegarden = NO_SCRUBBER|NO_VENT,
		/area/tether/surfacebase/emergency_storage/atrium = NO_SCRUBBER|NO_VENT,
		/area/tether/surfacebase/emergency_storage/atmos = NO_SCRUBBER|NO_VENT,
		/area/outpost/mining_main/storage = NO_SCRUBBER|NO_VENT,
	)
	disconnected_wires_test_exempt_turfs = list(list(78, 147, 1, NORTH), list(8, 71, 1, WEST))
	disconnected_disposals_tags = list("Trash") // just spits it into the garbage pile