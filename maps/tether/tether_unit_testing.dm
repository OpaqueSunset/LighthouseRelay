/datum/map/tether
	area_coherency_test_exempted_root_areas = list(
		/area/exoplanet,
		/area/tether/surfacebase/outside
	)

	apc_test_exempt_areas = list(
		/area/space = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/exoplanet = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/tether/surfacebase/outside = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/maintenance/lower/atmos = NO_SCRUBBER|NO_VENT,
		/area/engineering/atmos/intake = NO_SCRUBBER,
		/area/crew_quarters/sleep/Dorm_1/holo = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/crew_quarters/sleep/Dorm_3/holo = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/crew_quarters/sleep/Dorm_5/holo = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/crew_quarters/sleep/Dorm_7/holo = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/rnd/external = NO_SCRUBBER|NO_VENT,
		/area/maintenance/lower/research = NO_SCRUBBER|NO_VENT,
		/area/vacant/vacant_site/east = NO_APC,
		/area/tether/surfacebase/emergency_storage/rnd = NO_SCRUBBER|NO_VENT,
	)