#define AMBIENCE_AI list('sound/ambience/ambimalf.ogg')
#define AMBIENCE_ENGINEERING list('sound/ambience/ambisin1.ogg','sound/ambience/ambisin2.ogg','sound/ambience/ambisin3.ogg','sound/ambience/ambisin4.ogg')
// Lighthouse areas.

/area/assembly/chargebay
	name = "\improper Mech Bay"
	icon_state = "mechbay"

/area/assembly/robotics
	name = "\improper Robotics Lab"
	icon_state = "robotics"

// CENTCOM
/area/centcom
	name = "\improper Centcom"
	icon_state = "centcom"
	requires_power = FALSE
	dynamic_lighting = FALSE
	req_access = list(access_cent_general)

/area/centcom/control
	name = "\improper CentCom Control"

/area/centcom/evac
	name = "\improper CentCom Emergency Shuttle"

/area/centcom/living
	name = "\improper CentCom Living Quarters"

/area/centcom/specops
	name = "\improper CentCom Special Operations"

/area/centcom/holding
	name = "\improper Holding Facility"

/area/centcom/terminal
	name = "\improper Docking Terminal"
	icon_state = "centcom_dock"

/area/centcom/security
	name = "\improper CentCom Security"
	icon_state = "centcom_security"

/area/centcom/security/arrivals
	name = "\improper CentCom Security Arrivals"

/area/centcom/security/residential
	name = "\improper CentCom Residential Security"

/area/centcom/medical
	name = "\improper CentCom Medical"
	icon_state = "centcom_medical"

/area/centcom/command
	name = "\improper CentCom Command" //Central Command Command totally isn't RAS Syndrome in action.
	icon_state = "centcom_command"

/area/centcom/main_hall
	name = "\improper Main Hallway"
	icon_state = "centcom_hallway1"

/area/centcom/bar
	name = "\improper CentCom Bar"
	icon_state = "centcom_crew"

/area/centcom/restaurant
	name = "\improper CentCom Restaurant"
	icon_state = "centcom_crew"

/area/centcom/bathroom
	name = "\improper CentCom Bathroom"
	icon_state = "centcom_crew"
	sound_env = SMALL_ENCLOSED

/area/centcom/ferry
	name = "\improper CentCom Transport Shuttle"

/area/vacant/vacant_restaurant_upper
	name = "\improper Vacant Restaurant"
	icon_state = "vacant_site"

/area/vacant/vacant_restaurant_lower
	name = "\improper Vacant Restaurant"
	icon_state = "vacant_site"

/area/engineering/engineering_airlock
	name = "\improper Engineering Airlock"
	icon_state = "engine_eva"

/area/engineering/hallway
	name = "\improper Engineering Hallway"
	icon_state = "engineering"

/area/engineering/shaft
	name = "\improper Engineering Electrical Shaft"
	icon_state = "substation"

/area/vacant
	holomap_color = HOLOMAP_AREACOLOR_MAINTENANCE

/area/vacant/vacant_office
	name = "\improper Vacant Office"
	icon_state = "vacant_site"

/area/medical/psych_ward
	name = "\improper Psych Ward"
	icon_state = "psych_ward"

/area/construction
	holomap_color = HOLOMAP_AREACOLOR_MAINTENANCE
/area/construction/observation
	name = "\improper Abandoned Observation Lounge"
	icon_state = "yellow"

/area/crew_quarters/heads/hop
	name = "\improper Command - HoP's Office"
	icon_state = "head_quarters"
	req_access = list(access_hop)

/area/crew_quarters/heads/chief
	name = "Engineering - CE's Office"
	icon_state = "head_quarters"
	req_access = list(access_ce)

/area/crew_quarters/heads/hos
	name = "Security - HoS' Office"
	icon_state = "head_quarters"
	req_access = list(access_hos)

/area/crew_quarters/heads/cmo
	name = "Medbay - CMO's Office"
	icon_state = "head_quarters"
	req_access = list(access_cmo)

/area/crew_quarters/lounge
	name = "\improper Lounge"
	icon_state = "bar"
	sound_env = LARGE_SOFTFLOOR

/area/crew_quarters/lounge/kitchen
	name = "\improper Lounge Kitchen"
	icon_state = "kitchen"

/area/crew_quarters/lounge/kitchen_freezer
	name = "\improper Lounge Kitchen Freezer"
	icon_state = "kitchen"

/area/lawoffice
	name = "\improper Internal Affairs"
	icon_state = "law"
	holomap_color = HOLOMAP_AREACOLOR_SECURITY

/area/maintenance
	area_flags = AREA_FLAG_RAD_SHIELDED
	sound_env = TUNNEL_ENCLOSED
	turf_initializer = /decl/turf_initializer/maintenance
	forced_ambience = list('sound/ambience/maintambience.ogg')
	req_access = list(access_maint_tunnels)
	holomap_color = HOLOMAP_AREACOLOR_MAINTENANCE

/area/maintenance/bar
	name = "Bar Maintenance"
	icon_state = "maint_bar"

/area/maintenance/bar/catwalk
	name = "Bar Maintenance Catwalk"
	icon_state = "maint_bar"

/area/medical/medbay_emt_bay
	name = "\improper Medical EMT Bay"
	icon_state = "medbay_emt_bay"

/area/medical/surgery2
	name = "\improper Operating Theatre 2"
	icon_state = "surgery"

/area/outpost/research
	holomap_color = HOLOMAP_AREACOLOR_SCIENCE
/area/outpost/research/longtermstorage
	name = "Research Outpost Long-Term Storage"

/area/outpost/research/toxins_misc_lab
	name = "\improper Research Outpost Toxins Miscellaneous Research"
	icon_state = "toxmisc"

/area/outpost/research/mixing
	name = "\improper Research Outpost Toxins Mixing Room"
	icon_state = "toxmix"

/area/rnd/research_foyer
	name = "\improper Research Foyer"
	icon_state = "research_foyer"

/area/security/breakroom
	name = "\improper Security Breakroom"
	icon_state = "security"

/area/security/brig
	name = "\improper Security - Brig"
	icon_state = "brig"

/area/security/brig/bathroom
	name = "\improper Brig Bathroom"
	icon_state = "security"

/area/security/brig/visitation
	name = "\improper Visitation"
	icon_state = "security"

/area/security/checkpoint
	name = "\improper Security Checkpoint"
	icon_state = "checkpoint1"

/area/security/eva
	name = "\improper Security EVA"
	icon_state = "security_equip_storage"

/area/security/evidence_storage
	name = "\improper Security - Evidence Storage"
	icon_state = "evidence_storage"

/area/security/interrogation
	name = "\improper Security - Interrogation"
	icon_state = "interrogation"

/area/security/lobby
	name = "\improper Security Lobby"
	icon_state = "security"

/area/security/riot_control
	name = "\improper Security - Riot Control"
	icon_state = "riot_control"

/area/security/security_bathroom
	name = "\improper Security - Restroom"
	icon_state = "security_bathroom"
	sound_env = SMALL_ENCLOSED

/area/security/security_cell_hallway
	name = "\improper Security - Cell Hallway"
	icon_state = "security_cell_hallway"

/area/security/security_equiptment_storage
	name = "\improper Security - Equipment Storage"
	icon_state = "security_equip_storage"

/area/security/security_lockerroom
	name = "\improper Security - Locker Room"
	icon_state = "security_lockerroom"

/area/security/security_processing
	name = "\improper Security - Security Processing"
	icon_state = "security_processing"

/area/security/briefing_room
	name = "\improper Security - Briefing Room"
	icon_state = "brig"

/area/security/detectives_office
	name = "\improper Security - Forensic Office"
	icon_state = "detective"
	sound_env = MEDIUM_SOFTFLOOR

/area/security/range
	name = "\improper Security - Firing Range"
	icon_state = "firingrange"

/area/security/warden
	name = "\improper Security - Warden's Office"
	icon_state = "Warden"

/area/shuttle/belter/station
	name = "Belter Shuttle Landed"
	icon_state = "shuttle2"

/area/shuttle/large_escape_pod1/station
	icon_state = "shuttle2"
	base_turf = /turf/exterior/barren

/area/shuttle/escape/centcom
	name = "\improper Emergency Shuttle CentCom"
	icon_state = "shuttle"

/area/shuttle/specops/centcom
	name = "\improper Special Ops Shuttle"
	icon_state = "shuttlered"

/area/shuttle/tether/surface
	name = "Tether Shuttle Landed"
	icon_state = "shuttle"

/area/vacant/vacant_site2
	name = "\improper Abandoned Locker Room"
	icon_state = "vacant_site"

/area/supply/station
	name = "Supply Shuttle"
	icon_state = "shuttle3"
	requires_power = FALSE

/area/supply/dock
	name = "Supply Shuttle"
	icon_state = "shuttle3"
	requires_power = 0
	base_turf = /turf/space

// Thunderdome

/area/tdome
	name = "\improper Thunderdome"
	icon_state = "thunder"
	requires_power = 0
	dynamic_lighting = 0
	sound_env = ARENA
	req_access = list(access_cent_thunder)

/area/tdome/tdome1
	name = "\improper Thunderdome (Team 1)"
	icon_state = "green"

/area/tdome/tdome2
	name = "\improper Thunderdome (Team 2)"
	icon_state = "yellow"

/area/tdome/tdomeadmin
	name = "\improper Thunderdome (Admin.)"
	icon_state = "purple"

/area/tdome/tdomeobserve
	name = "\improper Thunderdome (Observer.)"
	icon_state = "purple"

// Elevator areas.
/area/turbolift/tether/transit
	name = "\improper Lighthouse (midway)"
	lift_floor_label = "Lighthouse Midpoint"
	lift_floor_name = "Midpoint"
	lift_announce_str = "Arriving at Lighthouse midway point."
	delay_time = 5 SECONDS

/area/turbolift/t_surface/level1
	name = "surface (level 1)"
	lift_floor_label = "Surface 1"
	lift_floor_name = "Tram, Dorms, Mining, Surf. EVA"
	lift_announce_str = "Arriving at Base Level 1."
	base_turf = /turf/floor/plating

/area/turbolift/t_surface/level2
	name = "surface (level 2)"
	lift_floor_label = "Surface 2"
	lift_floor_name = "Atmos, Maintenance"
	lift_announce_str = "Arriving at Base Level 2."

/area/turbolift/t_surface/level3
	name = "surface (level 3)"
	lift_floor_label = "Surface 3"
	lift_floor_name = "Science, Bar, Pool"
	lift_announce_str = "Arriving at Base Level 3."

/area/turbolift/t_station/level1
	name = "asteroid (level 1)"
	lift_floor_label = "Asteroid 1"
	lift_floor_name = "Eng, Bridge, Park, Cryo"
	lift_announce_str = "Arriving at Station Level 1."

/area/turbolift/t_station/level2
	name = "asteroid (level 2)"
	lift_floor_label = "Asteroid 2"
	lift_floor_name = "Chapel, AI Core, EVA Gear"
	lift_announce_str = "Arriving at Station Level 2."

/area/turbolift/t_station/level3
	name = "asteroid (level 3)"
	lift_floor_label = "Asteroid 3"
	lift_floor_name = "Medical, Security, Cargo"
	lift_announce_str = "Arriving at Station Level 3."

/area/tether/transit
	name = "\improper Lighthouse Transit"
	area_flags = AREA_FLAG_EXTERNAL | AREA_FLAG_IS_NOT_PERSISTENT | AREA_FLAG_IS_BACKGROUND | AREA_FLAG_HIDE_FROM_HOLOMAP
	is_outside = OUTSIDE_YES


//
// Surface Base Z Levels
//

/area
	holomap_color = HOLOMAP_AREACOLOR_CREW

/area/tether/surfacebase
	// icon = 'icons/turf/areas_vr.dmi'


/area/tether/surfacebase/outside
	name = "Outside - Surface"
	sound_env = MOUNTAINS
	area_flags = AREA_FLAG_EXTERNAL | AREA_FLAG_IS_NOT_PERSISTENT | AREA_FLAG_IS_BACKGROUND | AREA_FLAG_HIDE_FROM_HOLOMAP
	is_outside = OUTSIDE_YES
/area/tether/surfacebase/outside/outside1
	icon_state = "outside1"
/area/tether/surfacebase/outside/outside2
	icon_state = "outside2"
/area/tether/surfacebase/outside/outside3
	icon_state = "outside3"

/area/tether/surfacebase/outside/empty
	name = "Outside - Empty Area"

/area/tether/surfacebase/outside/wilderness
	name = "Outside - Wilderness"
	icon_state = "invi"
	// forced_ambience = list('sound/music/Sacred_Grove.ogg')

/area/tether/surfacebase/temple
	name = "Outside - Wilderness" // ToDo: Make a way to hide spoiler areas off the list of areas ghosts can jump to.
	icon_state = "red"
	area_flags = AREA_FLAG_EXTERNAL | AREA_FLAG_IS_NOT_PERSISTENT | AREA_FLAG_IS_BACKGROUND | AREA_FLAG_HIDE_FROM_HOLOMAP
	is_outside = TRUE

/area/tether/surfacebase/crash
	name = "Outside - Wilderness" // ToDo: Make a way to hide spoiler areas off the list of areas ghosts can jump to.
	icon_state = "yellow"
	area_flags = AREA_FLAG_EXTERNAL | AREA_FLAG_IS_NOT_PERSISTENT | AREA_FLAG_IS_BACKGROUND | AREA_FLAG_HIDE_FROM_HOLOMAP
	is_outside = TRUE

/area/tether/surfacebase/tram
	name = "\improper Tram Station"
	icon_state = "dk_yellow"

/area/tether/surfacebase/atrium_one
	name = "\improper Atrium First Floor"
	icon_state = "dk_yellow"
/area/tether/surfacebase/atrium_two
	name = "\improper Atrium Second Floor"
	icon_state = "dk_yellow"
/area/tether/surfacebase/atrium_three
	name = "\improper Atrium Third Floor"
	icon_state = "dk_yellow"


/area/tether/surfacebase/north_stairs_one
	name = "\improper North Stairwell First Floor"
	icon_state = "dk_yellow"
/area/tether/surfacebase/north_staires_two
	name = "\improper North Stairwell Second Floor"
	icon_state = "dk_yellow"
/area/tether/surfacebase/north_stairs_three
	name = "\improper North Stairwell Third Floor"
	icon_state = "dk_yellow"

/area/tether/surfacebase/public_garden_one
	name = "\improper Public Garden First Floor"
	icon_state = "green"
/area/tether/surfacebase/public_garden_two
	name = "\improper Public Garden Second Floor"
	icon_state = "green"
/area/tether/surfacebase/public_garden_three
	name = "\improper Public Garden Third Floor"
	icon_state = "green"
/area/tether/surfacebase/public_garden
	name = "\improper Public Garden"
	icon_state = "purple"
/area/tether/surfacebase/bar_backroom
	name = "\improper Bar Backroom"
	icon_state = "red"
	sound_env = SMALL_SOFTFLOOR

/area/tether/surfacebase/fishing_garden
	name = "\improper Fish Pond"
	icon_state = "blue"


/area/tether/surfacebase/sauna
	name = "\improper Public Sauna"
	icon_state = "green"


/area/tether/surfacebase/lounge
	name = "\improper Station Lounge"
	icon_state = "purple"

// /area/tether/surfacebase/east_stairs_one //This is just part of a lower hallway

/area/tether/surfacebase/east_stairs_two
	name = "\improper East Stairwell Second Floor"
	icon_state = "dk_yellow"

/area/vacant/vacant_site
	name = "\improper Vacant Site"
	icon_state = "vacant_site"

/area/vacant/vacant_site2
	name = "\improper Abandoned Locker Room"
	icon_state = "vacant_site"

/area/vacant/vacant_site/east
	name = "\improper East Base Vacant Site"
/area/vacant/vacant_bar
	name = "\improper Vacant Bar"
/area/vacant/vacant_bar_upper
	name = "\improper Upper Vacant Bar"

// /area/tether/surfacebase/east_stairs_three //This is just part of an upper hallway

/area/tether/surfacebase/emergency_storage
	icon_state = "emergencystorage"
	holomap_color = HOLOMAP_AREACOLOR_MAINTENANCE
/area/tether/surfacebase/emergency_storage/rnd
	name = "\improper RnD Emergency Storage"
/area/tether/surfacebase/emergency_storage/atmos
	name = "\improper Atmospherics Emergency Storage"
/area/tether/surfacebase/emergency_storage/atrium
	name = "\improper Atrium Emergency Storage"

// Main mining area
/area/tether/surfacebase/mining_main
	icon_state = "outpost_mine_main"
	holomap_color = HOLOMAP_AREACOLOR_CARGO
/area/tether/surfacebase/mining_main/airlock
	name = "\improper Mining Airlock"
/area/tether/surfacebase/mining_main/storage
	name = "\improper Mining Gear Storage"
/area/tether/surfacebase/mining_main/uxstorage
	name = "\improper Mining Secondary Storage"
/area/tether/surfacebase/mining_main/ore
	name = "\improper Mining Ore Storage"
/area/tether/surfacebase/mining_main/eva
	name = "\improper Mining EVA"
/area/tether/surfacebase/mining_main/refinery
	name = "\improper Mining Refinery"
/area/tether/surfacebase/mining_main/external
	name = "\improper Mining Refinery"
	is_outside = TRUE
/area/tether/surfacebase/mining_main/lobby
	name = "\improper Mining Lobby"
/area/quartermaster/belterdock
	name = "\improper Cargo Belter Access"
	icon_state = "mining"
/area/mine/explored/upper_level
	name = "Upper Level Mine"
	icon_state = "explored"
/area/mine/unexplored/upper_level
	name = "Upper Level Mine"
	icon_state = "unexplored"

// Mining Underdark
/area/mine/unexplored/underdark
	name = "\improper Mining Underdark"
	base_turf = /turf/exterior/barren
/area/mine/explored/underdark
	name = "\improper Mining Underdark"
	base_turf = /turf/exterior/barren

// Mining outpost areas
/area/outpost/mining_main/passage
	name = "\improper Mining Outpost Passage"
	is_outside = TRUE
/area/outpost/mining_main/airlock
	name = "\improper Mining Outpost Airlock"
/area/outpost/mining_main/break_room
	name = "\improper Mining Outpost Crew Area"
/area/outpost/mining_main/dorms
	name = "\improper Mining Outpost Dormitory"
/area/outpost/mining_main/maintenance
	name = "\improper Mining Outpost Maintenance"
/area/outpost/mining_main/storage
	name = "\improper Mining Outpost Gear Storage"

// Solars map areas
/area/tether/outpost/solars_outside
	name = "\improper Solar Farm"
	holomap_color = HOLOMAP_AREACOLOR_ENGINEERING
	area_flags = AREA_FLAG_EXTERNAL | AREA_FLAG_IS_NOT_PERSISTENT | AREA_FLAG_IS_BACKGROUND | AREA_FLAG_HIDE_FROM_HOLOMAP
	is_outside = TRUE

/area/tether/outpost/solars_shed
	name = "\improper Solar Farm Shed"
	holomap_color = HOLOMAP_AREACOLOR_ENGINEERING


/area/maintenance/substation
	holomap_color = HOLOMAP_AREACOLOR_ENGINEERING
/area/maintenance/substation/medsec
	name = "\improper MedSec Substation"
/area/maintenance/substation/mining
	name = "\improper Mining Substation"
/area/maintenance/substation/surface_civ
	name = "\improper Surface Civilian Substation"
/area/maintenance/substation/surface_atmos
	name = "\improper Surface Atmos Substation"
/area/maintenance/substation/civ_west
	name = "\improper Civilian West Substation"
/area/maintenance/tether_midpoint
	name = "\improper Lighthouse Midpoint Maint"


/area/tether/surfacebase/medical
	icon_state = "medical"
	holomap_color = HOLOMAP_AREACOLOR_MEDICAL
/area/tether/surfacebase/medical/triage
	name = "\improper Surface Triage"
/area/tether/surfacebase/medical/first_aid_west
	name = "\improper First Aid West"


/area/tether/surfacebase/security
	icon_state = "security"
	holomap_color = HOLOMAP_AREACOLOR_SECURITY
/area/tether/surfacebase/security/breakroom
	name = "\improper Surface Security Break Room"
/area/tether/surfacebase/security/lobby
	name = "\improper Surface Security Lobby"
/area/tether/surfacebase/security/common
	name = "\improper Surface Security Room"
/area/tether/surfacebase/security/armory
	name = "\improper Surface Armory"

/area/engineering/atmos
	name = "\improper Atmospherics"
	icon_state = "atmos"
	sound_env = LARGE_ENCLOSED
	req_access = list(access_atmospherics)

/area/engineering/atmos/monitoring
	name = "\improper Atmospherics Monitoring Room"
	icon_state = "atmos_monitoring"
	sound_env = STANDARD_STATION

/area/engineering/atmos/processing
	name = "\improper Atmospherics Processing"
	icon_state = "atmos"
	sound_env = LARGE_ENCLOSED

/area/engineering/atmos/storage
	name = "\improper Atmospherics Storage"
	icon_state = "atmos_storage"
	sound_env = SMALL_ENCLOSED

/area/engineering/atmos/intake
	name = "\improper Atmospherics Intake"
	icon_state = "atmos"
	sound_env = MOUNTAINS
	area_flags = AREA_FLAG_EXTERNAL | AREA_FLAG_IS_NOT_PERSISTENT | AREA_FLAG_IS_BACKGROUND | AREA_FLAG_HIDE_FROM_HOLOMAP
	is_outside = TRUE

/area/engineering/engine_gas
	name = "\improper Engine Gas Storage"
	icon_state = "engine_waste"
/area/engineering/lower/lobby
	name = "\improper Enginering Surface Lobby"
/area/engineering/lower/breakroom
	name = "\improper Enginering Surface Break Room"
/area/engineering/lower/atmos_lockers
	name = "\improper Engineering Atmos Locker Room"
/area/engineering/lower/atmos_eva
	name = "\improper Engineering Atmos EVA"

/area/gateway/prep_room
	name = "\improper Gateway Prep Room"
/area/crew_quarters/locker/laundry_arrival
	name = "\improper Arrivals Laundry"

/area/maintenance/lower
	icon_state = "fsmaint"

/area/maintenance/lower/xenoflora
	name = "\improper Xenoflora Maintenance"
/area/maintenance/lower/research
	name = "\improper Research Maintenance"
/area/maintenance/lower/atmos
	name = "\improper Atmospherics Maintenance"
/area/maintenance/lower/vacant_site
	name = "\improper Vacant Site Maintenance"
/area/maintenance/lower/atrium
	name = "\improper Atrium Maintenance"
/area/maintenance/lower/rnd
	name = "\improper RnD Maintenance"
/area/maintenance/lower/north
	name = "\improper North Maintenance"
/area/maintenance/lower/bar
	name = "\improper Bar Maintenance"
/area/maintenance/lower/mining
	name = "\improper Mining Maintenance"
/area/maintenance/lower/south
	name = "\improper South Maintenance"
/area/maintenance/lower/trash_pit
	name = "\improper Trash Pit"
/area/maintenance/lower/solars
	name = "\improper Solars Maintenance"
/area/maintenance/lower/mining_eva
	name = "\improper Mining EVA Maintenance"
/area/maintenance/lower/public_garden_maintenence
	name = "\improper Public Garden Maintenance"
/area/maintenance/lower/public_garden_maintenence/upper
	name = "\improper Upper Public Garden Maintenence"

// Research
/area/rnd/rdoffice
	name = "\improper Research Director's Office"
	icon_state = "head_quarters"
	area_flags = AREA_FLAG_IS_NOT_PERSISTENT
	req_access = list(access_rd)
/area/rnd/research_storage
	name = "\improper Research Storage"
	icon_state = "research_storage"
/area/rnd/research/testingrange
	name = "\improper Weapons Testing Range"
	icon_state = "firingrange"
/area/rnd/workshop
	name = "\improper Workshop"
	icon_state = "sci_workshop"
/area/rnd/xenobiology/xenoflora/lab_atmos
	name = "\improper Xenoflora Atmospherics Lab"
/area/rnd/breakroom
	name = "\improper Research Break Room"
	icon_state = "research"
/area/rnd/breakroom/outpost
	name = "\improper Research Outpost Break Room"
/area/rnd/reception_desk
	name = "\improper Research Reception Desk"
	icon_state = "research"
/area/rnd/external
	name = "\improper Research External Access"
	icon_state = "research"
	area_flags = AREA_FLAG_EXTERNAL | AREA_FLAG_IS_NOT_PERSISTENT | AREA_FLAG_IS_BACKGROUND | AREA_FLAG_HIDE_FROM_HOLOMAP
	is_outside = TRUE
/area/rnd/hallway
	name = "\improper Research Lower Hallway"
	icon_state = "research"
/area/rnd/anomaly_lab
	name = "\improper Anomaly Lab"
	icon_state = "research"
/area/rnd/xenoarch_storage
	name = "\improper Xenoarch Storage"
	icon_state = "research"

// Research Outpost
/area/outpost/research/hallway/resarch_outpost_northern_hallway
	name = "\improper Outpost - Northern Hallway"
	icon_state = "dk_yellow"

/area/outpost/research/hallway/resarch_outpost_eastern_hallway
	name = "\improper Outpost - Eastern Hallway"
	icon_state = "dk_yellow"

/area/outpost/research/hallway/resarch_outpost_southern_hallway
	name = "\improper Outpost - Southern Hallway"
	icon_state = "dk_yellow"

/area/outpost/research/hallway/resarch_outpost_western_hallway
	name = "\improper Outpost - Western Hallway"
	icon_state = "dk_yellow"

/area/outpost/research/hallway/resarch_outpost_storage_hallway
	name = "\improper Outpost - Hallway Storage"
	icon_state = "dk_yellow"

/area/outpost/research/crew_quarters/sleep/Dorm_1
	name = "\improper Outpost - Dorms 1"
	icon_state = "Sleep"

/area/outpost/research/crew_quarters/sleep/Dorm_2
	name = "\improper Outpost - Dorms 2"
	icon_state = "Sleep"

/area/outpost/research/crew_quarters/sleep/Dorm_3
	name = "\improper Outpost - Dorms 3"
	icon_state = "Sleep"

/area/outpost/research/medical/first_aid_south_west
	name = "\improper Outpost - First Aid South West"
	icon_state = "blue"

/area/outpost/research/storage/tools
	name = "\improper Outpost - Tool Storage"
	icon_state = "storage"

/area/outpost/research/toxins_canister_icyhoot
	name = "\improper Toxins Lab - Canister Heating and Cooling"
	icon_state = "research"

/area/outpost/research/simulator
	name = "\improper Toxins Lab - Explosive Effect Simulator"
	icon_state = "research"

/area/outpost/research/toxins_burn_chamber
	name = "\improper Toxins Lab - Burn Chamber"
	icon_state = "research"

/area/outpost/research/engineering/eva_atmospherics
	name = "\improper Outpost - EVA-Atmospherics"
	icon_state = "green"

/area/outpost/research/storage/surface_eva
	name = "\improper Outpost - Surface EVA"
	icon_state = "green"

/area/outpost/research/storage/surface_eva_storage
	name = "\improper Outpost - Surface EVA Storage"
	icon_state = "green"

/area/outpost/research/substation
	name = "\improper Outpost - Substation"

/area/outpost/research/breakroom
	name = "\improper Outpost - Breakroom"
	icon_state = "research"

/area/outpost/research/crew_quarters/showers
	name = "\improper Outpost - Crew Showers"
	icon_state = "recreation_area_restroom"

/area/outpost/research/materials_lab
	name = "\improper Outpost - Materials Lab"
	icon_state = "red"

/area/outpost/research/telescience_lab
	name = "\improper Outpost - Telescience Lab"
	icon_state = "yellow"

/area/outpost/research/toxins_mixing_lab
	name = "\improper Outpost - Toxins Lab"
	icon_state = "purple"

/area/outpost/research/atmospherics
	name = "\improper Outpost - Atmospherics"
	icon_state = "research"

/area/outpost/research/materials_chamber
	name = "\improper Materials - Chamber"
	icon_state = "red"

// Misc
/area/hallway/lower/third_south
	name = "\improper Hallway Third Floor South"
	icon_state = "hallC1"
/area/hallway/lower/first_west
	name = "\improper Hallway First Floor West"
	icon_state = "hallC1"

/area/storage/surface_eva
	icon_state = "storage"
	name = "\improper Surface EVA"
/area/storage/surface_eva/external
	name = "\improper Surface EVA Access"

/area/tether/surfacebase/shuttle_pad
	name = "\improper Lighthouse Shuttle Pad"
/area/tether/surfacebase/reading_room
	name = "\improper Reading Room"
/area/crew_quarters/freezer
	name = "\improper Kitchen Freezer"

/area/server
	name = "\improper Research Server Room"
	icon_state = "server"
	holomap_color = HOLOMAP_AREACOLOR_SCIENCE

/area/storage
	holomap_color = HOLOMAP_AREACOLOR_MAINTENANCE
/area/storage/art
	name = "Art Supply Storage"
	icon_state = "storage"

/area/storage/emergency_storage
	req_access = list(access_emergency_storage)
	icon_state = "emergencystorage"

/area/storage/emergency_storage/emergency3
	name = "Central Emergency Storage"

/area/storage/emergency_storage/emergency4
	name = "Civilian Emergency Storage"

/area/storage/primary
	name = "Primary Tool Storage"
	icon_state = "primarystorage"

/area/storage/surface_eva
/area/storage/surface_eva/external
	area_flags = AREA_FLAG_EXTERNAL | AREA_FLAG_IS_NOT_PERSISTENT | AREA_FLAG_IS_BACKGROUND | AREA_FLAG_HIDE_FROM_HOLOMAP
	is_outside = TRUE

/area/storage/tech
	name = "Technical Storage"
	icon_state = "auxstorage"

/area/storage/tools
	name = "Auxiliary Tool Storage"
	icon_state = "storage"


//
// Station Z Levels
//
// Note: Fore is NORTH

/area/tether/station/stairs_one
	name = "\improper Station Stairwell First Floor"
	icon_state = "dk_yellow"
	holomap_color = HOLOMAP_AREACOLOR_HALLWAYS
/area/tether/station/stairs_two
	name = "\improper Station Stairwell Second Floor"
	icon_state = "dk_yellow"
	holomap_color = HOLOMAP_AREACOLOR_HALLWAYS
/area/tether/station/stairs_three
	name = "\improper Station Stairwell Third Floor"
	icon_state = "dk_yellow"
	holomap_color = HOLOMAP_AREACOLOR_HALLWAYS
/area/tether/station/dock_one
	name = "\improper Dock One"
	icon_state = "dk_yellow"
	holomap_color = HOLOMAP_AREACOLOR_ESCAPE
/area/tether/station/dock_two
	name = "\improper Dock Two"
	icon_state = "dk_yellow"
	holomap_color = HOLOMAP_AREACOLOR_ESCAPE

/area/crew_quarters/showers
	name = "\improper Unisex Showers"
	icon_state = "recreation_area_restroom"

/area/crew_quarters/sleep/maintDorm1
	name = "\improper Construction Dorm 1"
	icon_state = "Sleep"

/area/crew_quarters/sleep/maintDorm2
	name = "\improper Construction Dorm 2"
	icon_state = "Sleep"

/area/crew_quarters/sleep/maintDorm3
	name = "\improper Construction Dorm 3"
	icon_state = "Sleep"

/area/crew_quarters/sleep/Dorm_1/holo
	name = "\improper Dorm 1 Holodeck"
	icon_state = "dk_yellow"
	requires_power = FALSE

/area/crew_quarters/sleep/Dorm_3/holo
	name = "\improper Dorm 3 Holodeck"
	icon_state = "dk_yellow"
	requires_power = FALSE

/area/crew_quarters/sleep/Dorm_5/holo
	name = "\improper Dorm 5 Holodeck"
	icon_state = "dk_yellow"
	requires_power = FALSE

/area/crew_quarters/sleep/Dorm_7/holo
	name = "\improper Dorm 7 Holodeck"
	icon_state = "dk_yellow"
	requires_power = FALSE

/area/holodeck/holodorm/source_basic
	name = "\improper Holodeck Source"
/area/holodeck/holodorm/source_desert
	name = "\improper Holodeck Source"
/area/holodeck/holodorm/source_seating
	name = "\improper Holodeck Source"
/area/holodeck/holodorm/source_beach
	name = "\improper Holodeck Source"
/area/holodeck/holodorm/source_garden
	name = "\improper Holodeck Source"
/area/holodeck/holodorm/source_boxing
	name = "\improper Holodeck Source"
/area/holodeck/holodorm/source_snow
	name = "\improper Holodeck Source"
/area/holodeck/holodorm/source_space
	name = "\improper Holodeck Source"
/area/holodeck/holodorm/source_off
	name = "\improper Holodeck Source"

//Holosurgery areas
/area/medical/surgery/holosurgery
	name = "\improper Holosurgery"
	icon_state = "Holodeck"
/area/holodeck/holodorm/source_emptysurgery
	name = "\improper Empty Surgery"
	icon_state = "Holodeck"
/area/holodeck/holodorm/source_standard
	name = "\improper Standard Suite"
	icon_state = "Holodeck"
/area/holodeck/holodorm/source_phoron
	name = "\improper Phoron Suite"
	icon_state = "Holodeck"
/area/holodeck/holodorm/source_zaddat
	name = "\improper Zaddat Suite"
	icon_state = "Holodeck"

// station

/area/ai
	name = "\improper AI Chamber"
	icon_state = "ai_chamber"
	ambience = AMBIENCE_AI
	holomap_color = HOLOMAP_AREACOLOR_SCIENCE

/area/ai/foyer
	name = "\improper AI Core Access"

/area/ai_cyborg_station
	name = "\improper Cyborg Station"
	icon_state = "ai_cyborg"
	sound_env = SMALL_ENCLOSED
	ambience = AMBIENCE_AI
	holomap_color = HOLOMAP_AREACOLOR_SCIENCE

/area/ai_monitored/storage/eva
	name = "EVA Storage"
	icon_state = "eva"
	holomap_color = HOLOMAP_AREACOLOR_COMMAND

/area/ai_server_room
	name = "Messaging Server Room"
	icon_state = "ai_server"
	sound_env = SMALL_ENCLOSED
	ambience = AMBIENCE_AI
	holomap_color = HOLOMAP_AREACOLOR_SCIENCE

/area/ai_upload
	name = "\improper AI Upload Chamber"
	icon_state = "ai_upload"
	ambience = AMBIENCE_AI
	holomap_color = HOLOMAP_AREACOLOR_SCIENCE

/area/ai_upload_foyer
	name = "AI Upload Access"
	icon_state = "ai_foyer"
	sound_env = SMALL_ENCLOSED
	ambience = AMBIENCE_AI
	holomap_color = HOLOMAP_AREACOLOR_SCIENCE

/area/bridge_hallway
	name = "\improper Bridge Hallway"
	icon_state = "bridge"
	holomap_color = HOLOMAP_AREACOLOR_COMMAND

/area/bridge/meeting_room
	name = "\improper Heads of Staff Meeting Room"
	icon_state = "bridge"
	ambience = list()
	sound_env = MEDIUM_SOFTFLOOR

/area/medical
	holomap_color = HOLOMAP_AREACOLOR_MEDICAL

/area/medical/virologyisolation
	name = "\improper Virology Isolation"
	icon_state = "virology"
/area/medical/recoveryrestroom
	name = "\improper Recovery Room Restroom"
	icon_state = "virology"

/area/security
	holomap_color = HOLOMAP_AREACOLOR_SECURITY
/area/security/hallway
	name = "\improper Security Hallway"
	icon_state = "security"
/area/security/hallwayaux
	name = "\improper Security Armory Hallway"
	icon_state = "security"
/area/security/forensics
	name = "\improper Forensics Lab"
	icon_state = "security"
/area/security/breakroom
	name = "\improper Security Breakroom"
	icon_state = "security"
/area/security/brig/visitation
	name = "\improper Visitation"
	icon_state = "security"
/area/security/brig/bathroom
	name = "\improper Brig Bathroom"
	icon_state = "security"
/area/security/armory/blue
	name = "\improper Armory - Blue"
	icon_state = "armory"
/area/security/armory/red
	name = "\improper Armory - Red"
	icon_state = "red2"
/area/security/observation
	name = "\improper Brig Observation"
	icon_state = "riot_control"
/area/security/eva
	name = "\improper Security EVA"
	icon_state = "security_equip_storage"
/area/security/recstorage
	name = "\improper Brig Recreation Storage"
	icon_state = "brig"
/area/security/nuke_storage
	name = "\improper Vault"
	icon_state = "nuke_storage"

/area/engineering
	holomap_color = HOLOMAP_AREACOLOR_ENGINEERING
/area/engineering/atmos/backup
	name = "\improper Backup Atmospherics"
/area/engineering/break_room
	name = "\improper Engineering Break Room"
	icon_state = "engineering_break"
	sound_env = MEDIUM_SOFTFLOOR
/area/engineering/drone_fabrication
	name = "\improper Engineering Drone Fabrication"
	icon_state = "drone_fab"
	sound_env = SMALL_ENCLOSED
/area/engineering/engine_airlock
	name = "\improper Engine Room Airlock"
	icon_state = "engine"
	holomap_color = HOLOMAP_AREACOLOR_AIRLOCK
/area/engineering/engine_eva
	name = "\improper Engine EVA"
	icon_state = "engine_eva"
/area/engineering/engine_room
	name = "\improper Engine Room"
	icon_state = "engine"
	sound_env = LARGE_ENCLOSED
/area/engineering/engine_smes
	name = "\improper Engineering SMES"
	icon_state = "engine_smes"
	sound_env = SMALL_ENCLOSED
/area/engineering/engineering_monitoring
	name = "\improper Engineering Monitoring Room"
	icon_state = "engine_monitoring"
/area/engineering/foyer
	name = "\improper Engineering Foyer"
	icon_state = "engineering_foyer"
/area/engineering/foyer_mezzenine
	name = "\improper Engineering Mezzenine"
/area/engineering/workshop
	name = "\improper Engineering Workshop"
	icon_state = "engineering_workshop"

/area/hallway/station
	icon_state = "hallC1"
/area/hallway/station/atrium
	name = "\improper Main Station Atrium"
/area/hallway/station/port
	name = "\improper Main Port Hallway"
/area/hallway/station/starboard
	name = "\improper Main Starboard Hallway"
/area/hallway/station/upper
	name = "\improper Main Upper Hallway"
/area/hallway/station/docks
	name = "\improper Docks Hallway"

/area/maintenance/station
	icon_state = "fsmaint"
/area/maintenance/station/bridge
	name = "\improper Bridge Maintenance"
/area/maintenance/station/eng_lower
	name = "\improper Engineering Lower Maintenance"
/area/maintenance/station/eng_upper
	name = "\improper Engineering Upper Maintenance"
/area/maintenance/station/medbay
	name = "\improper Medbay Maintenance"
/area/maintenance/station/cargo
	name = "\improper Cargo Maintenance"
/area/maintenance/station/elevator
	name = "\improper Elevator Maintenance"
/area/maintenance/station/sec_lower
	name = "\improper Security Lower Maintenance"
/area/maintenance/station/sec_upper
	name = "\improper Security Upper Maintenance"
/area/maintenance/station/micro
	name = "\improper Micro Maintenance"
/area/maintenance/station/ai
	name = "\improper AI Maintenance"
	sound_env = SEWER_PIPE

/area/tether/station/public_meeting_room
	name = "Public Meeting Room"
	icon_state = "blue"
	sound_env = SMALL_SOFTFLOOR

// Exploration Shuttle stuff //
/area/tether/station/excursion_dock
	name = "\improper Excursion Shuttle Dock"
	icon_state = "hangar"

/area/tether/station/explorer_prep
	name = "\improper Explorer Prep Room"
	icon_state = "locker"

/area/tether/station/explorer_entry
	name = "\improper Exploration Foyer"
	icon_state = "green"

/area/tether/station/explorer_meeting
	name = "\improper Explorer Meeting Room"
	icon_state = "northeast"

/area/tether/station/explorer_showers
	name = "\improper Explorer Showers"
	icon_state = "restrooms"

/area/tether/station/explorer_medical
	name = "\improper Exploration Med Station"
	icon_state = "medbay"

/area/tether/station/pathfinder_office
	name = "\improper Pathfinder's Office"

/area/shuttle/excursion
	name = "\improper Excursion Shuttle"
	icon_state = "shuttle2"
	base_turf = /turf/space

/area/shuttle/excursion/tether
	name = "\improper Excursion Shuttle - Lighthouse"
	base_turf = /turf/floor/reinforced

/area/tether/midpoint
	name = "\improper Lighthouse Midpoint"

// Telecommunications Satellite
/area/maintenance/substation/tcomms
	name = "\improper Telecomms Substation"

// Telecomms areas.
/area/tcomstorage
	name = "\improper Telecomms Storage"
	icon_state = "tcomstorage"
	ambience = AMBIENCE_ENGINEERING
	holomap_color = HOLOMAP_AREACOLOR_ENGINEERING

/area/tcommsat
	name = "\improper Telecomms"
	ambience = list('sound/ambience/ambisin2.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/signal.ogg')
	ambience = AMBIENCE_ENGINEERING
	holomap_color = HOLOMAP_AREACOLOR_ENGINEERING

/area/tcommsat/entrance
	name = "\improper Telecomms Entrance"
	icon_state = "tcomsatentrance"

/area/tcommsat/chamber
	name = "\improper Telecomms Central Compartment"
	icon_state = "tcomsatcham"

/area/tcommsat/computer
	name = "\improper Telecomms Control Room"
	icon_state = "tcomsatcomp"

/area/tcomlobby
	name = "\improper Telecomms Lobby"
	icon_state = "tcomsatlob"
	ambience = AMBIENCE_ENGINEERING
	holomap_color = HOLOMAP_AREACOLOR_ENGINEERING

// TODO: REPATH ALL THESE TO /area/tether
/area/chapel
	area_flags = AREA_FLAG_HOLY
/area/chapel/main
	name = "\improper Chapel"
	icon_state = "chapel"
	sound_env = LARGE_ENCLOSED
	ambience = list(
		'sound/ambience/ambicha1.ogg',
		'sound/ambience/ambicha2.ogg',
		'sound/ambience/ambicha3.ogg',
		'sound/ambience/ambicha4.ogg',
		'sound/music/traitor.ogg'
	)
/area/chapel/office
	name = "\improper Chapel Office"
	icon_state = "chapeloffice"
	req_access = list(access_chapel_office)
/area/crew_quarters/bar
	name = "\improper Bar"
	icon_state = "bar"
	sound_env = LARGE_SOFTFLOOR
/area/crew_quarters/captain
	name = "\improper Command - Captain's Office"
	icon_state = "captain"
	sound_env = MEDIUM_SOFTFLOOR
	req_access = list(access_captain)
/area/crew_quarters/kitchen
	name = "\improper Kitchen"
	icon_state = "kitchen"
	req_access = list(access_kitchen)
/area/crew_quarters/locker
	name = "\improper Locker Room"
	icon_state = "locker"
/area/crew_quarters/medbreak
	name = "\improper Break Room"
	icon_state = "medbay3"
	ambience = list('sound/ambience/signal.ogg')
	req_access = list(access_medical)
/area/crew_quarters/sleep
	name = "\improper Dormitories"
	icon_state = "Sleep"
/area/crew_quarters/sleep/cryo
	name = "\improper Cryogenic Storage"
	icon_state = "Sleep"
/area/crew_quarters/sleep/engi_wash
	name = "\improper Engineering Washroom"
	icon_state = "toilet"
	sound_env = SMALL_ENCLOSED
	holomap_color = HOLOMAP_AREACOLOR_ENGINEERING
/area/crew_quarters/toilet
	name = "\improper Dormitory Toilets"
	icon_state = "toilet"
	sound_env = SMALL_ENCLOSED
/area/engineering/engine_monitoring
	name = "\improper Engine Monitoring Room"
	icon_state = "engine_monitoring"
/area/engineering/locker_room
	name = "\improper Engineering Locker Room"
	icon_state = "engineering_locker"
/area/engineering/storage
	name = "\improper Engineering Storage"
	icon_state = "engineering_storage"
/area/gateway
	name = "\improper Gateway"
	icon_state = "teleporter"
/area/hydroponics
	name = "\improper Hydroponics"
	icon_state = "hydro"
	req_access = list(access_hydroponics)
/area/hydroponics/cafegarden
	name = "\improper Cafe Garden"
	icon_state = "garden"
	req_access = list()
/area/janitor
	name = "\improper Custodial Closet"
	icon_state = "janitor"
	req_access = list(access_janitor)
/area/library
	name = "\improper Library"
	icon_state = "library"
	sound_env = LARGE_SOFTFLOOR
/area/maintenance/asmaint2
	name = "Science Maintenance"
	icon_state = "asmaint"
/area/maintenance/cargo
	name = "\improper Cargo Maintenance"
	icon_state = "maint_cargo"
	req_access = list(list(access_cargo, access_maint_tunnels))
/area/maintenance/engineering
	name = "\improper Engineering Maintenance"
	icon_state = "maint_engineering"
/area/maintenance/engineering/pumpstation
	name = "Engineering Pump Station"
	icon_state = "maint_pumpstation"
/area/maintenance/evahallway
	name = "\improper EVA Maintenance"
	icon_state = "maint_eva"
	req_access = list(list(access_eva, access_maint_tunnels))
/area/maintenance/substation/cargo
	name = "Cargo Substation"
/area/maintenance/substation/civilian
/area/maintenance/substation/command
/area/maintenance/substation/engineering
	name = "Engineering Substation"
/area/maintenance/substation/medical
	name = "Medical Substation"
/area/maintenance/substation/research
	name = "Research Substation"
/area/maintenance/substation/security
	name = "Security Substation"
/area/medical/biostorage
	name = "\improper Secondary Storage"
	icon_state = "medbay4"
	ambience = list('sound/ambience/signal.ogg')
/area/medical/chemistry
	name = "\improper Chemistry"
	icon_state = "chem"
	req_access = list(access_chemistry)
/area/medical/morgue
	name = "\improper Morgue"
	icon_state = "morgue"
	ambience = list('sound/ambience/ambimo1.ogg','sound/ambience/ambimo2.ogg','sound/music/main.ogg')
	req_access = list(access_morgue)
/area/medical/medbay_primary_storage
	name = "\improper Medbay Primary Storage"
	icon_state = "medbay_primary_storage"
	ambience = list('sound/ambience/signal.ogg')

/area/medical/ward
	name = "\improper Recovery Ward"
	icon_state = "patients"

/area/medical/patient_a
	name = "\improper Patient A"
	icon_state = "medbay_patient_room_a"

/area/medical/patient_b
	name = "\improper Patient B"
	icon_state = "medbay_patient_room_b"

/area/medical/patient_c
	name = "\improper Patient C"
	icon_state = "medbay_patient_room_c"
/area/medical/psych
	name = "\improper Walk-in Psychiatry Clinic"
	icon_state = "medbay3"
	ambience = list('sound/ambience/signal.ogg')
	req_access = list(access_psychiatrist)
/area/medical/psych/inside
	name = "\improper Psychiatry Office"
/area/medical/reception
	name = "\improper Medbay Reception"
	icon_state = "medbay"
	ambience = list('sound/ambience/signal.ogg')
/area/medical/sleeper
	name = "\improper Emergency Treatment Centre"
	icon_state = "exam_room"
/area/medical/surgery
	name = "\improper Operating Theatre"
	icon_state = "surgery"
/area/medical/surgery_hallway
	name = "\improper Surgery Hallway"
	icon_state = "surgery_hallway"
/area/medical/virology
	name = "\improper Virology"
	icon_state = "virology"
/area/medical/virologyaccess
	name = "\improper Virology Access"
	icon_state = "virology"

/area/medical/resleeving
	name = "Resleeving Lab"
	icon_state = "genetics"

/area/hallway/secondary/escape/medical_escape_pod_hallway
	name = "\improper Medical Escape Pod Hallway"
	icon_state = "medical_escape_pod_hallway"

/area/quartermaster
	name = "\improper Quartermasters"
	icon_state = "quart"
	req_access = list(access_cargo)
	holomap_color = HOLOMAP_AREACOLOR_CARGO
/area/quartermaster/office
	name = "\improper Supply Office"
	icon_state = "quartoffice"
	req_access = list(list(access_cargo, access_mining))
/area/quartermaster/qm
	name = "\improper Cargo - Quartermaster's Office"
	icon_state = "quart"
	req_access = list(access_qm)
/area/quartermaster/storage
	name = "\improper Cargo Bay"
	icon_state = "quartstorage"
	sound_env = LARGE_ENCLOSED
/area/quartermaster/delivery
	name = "\improper Cargo - Delivery Office"
	icon_state = "quart"
	area_flags = AREA_FLAG_IS_NOT_PERSISTENT //So trash doesn't pile up too hard.
/area/quartermaster/foyer
	name = "\improper Cargo Bay Foyer"
	icon_state = "quartstorage"
/area/quartermaster/warehouse
	name = "\improper Cargo Warehouse"
	icon_state = "quartstorage"
/area/rnd
	holomap_color = HOLOMAP_AREACOLOR_SCIENCE
/area/rnd/xenobiology
	name = "\improper Xenobiology Lab"
	icon_state = "xeno_lab"
	req_access = list(access_xenobiology, access_research)
	secure = TRUE
/area/rnd/xenobiology/xenoflora
	name = "\improper Xenoflora Lab"
	icon_state = "xeno_f_lab"
/area/rnd/xenobiology/xenoflora_storage
	name = "\improper Xenoflora Storage"
	icon_state = "xeno_f_store"
/area/teleporter
	name = "\improper Teleporter"
	icon_state = "teleporter"
	req_access = list(access_teleporter)
/area/teleporter/departing
	name = "\improper Long-Range Teleporter"
	icon_state = "teleporter"
	ambience = list('sound/ambience/signal.ogg')

// Holodeck
/area/holodeck_control
	name = "\improper Holodeck Control"
	icon_state = "holodeck_control"
/area/holodeck
	name = "\improper Holodeck"
	icon_state = "Holodeck"
	dynamic_lighting = 0
	sound_env = LARGE_ENCLOSED
	area_flags = AREA_FLAG_IS_NOT_PERSISTENT
/area/holodeck/alphadeck
	name = "\improper Holodeck Alpha"

/area/holodeck/source_plating
	name = "\improper Holodeck - Off"

/area/holodeck/source_emptycourt
	name = "\improper Holodeck - Empty Court"
	sound_env = ARENA

/area/holodeck/source_boxingcourt
	name = "\improper Holodeck - Boxing Court"
	sound_env = ARENA

/area/holodeck/source_basketball
	name = "\improper Holodeck - Basketball Court"
	sound_env = ARENA

/area/holodeck/source_thunderdomecourt
	name = "\improper Holodeck - Thunderdome Court"
	requires_power = 0
	sound_env = ARENA

/area/holodeck/source_courtroom
	name = "\improper Holodeck - Courtroom"
	sound_env = AUDITORIUM

/area/holodeck/source_beach
	name = "\improper Holodeck - Beach"
	sound_env = PLAIN

/area/holodeck/source_wildlife
	name = "\improper Holodeck - Wildlife Simulation"

/area/holodeck/source_meetinghall
	name = "\improper Holodeck - Meeting Hall"
	sound_env = AUDITORIUM

/area/holodeck/source_theatre
	name = "\improper Holodeck - Theatre"
	sound_env = CONCERT_HALL

/area/holodeck/source_picnicarea
	name = "\improper Holodeck - Picnic Area"
	sound_env = PLAIN

/area/holodeck/source_snowfield
	name = "\improper Holodeck - Snow Field"
	sound_env = FOREST

/area/holodeck/source_desert
	name = "\improper Holodeck - Desert"
	sound_env = PLAIN

/area/holodeck/source_space
	name = "\improper Holodeck - Space"
	has_gravity = 0
	sound_env = SPACE

// Visitor/crew amenities
/area/bridge
	holomap_color = HOLOMAP_AREACOLOR_COMMAND
/area/bridge/secondary
	name = "\improper Secondary Command Office"
/area/chapel/chapel_morgue
	name = "\improper Chapel Morgue"
	icon_state = "chapel_morgue"
/area/crew_quarters/barrestroom
	name = "\improper Cafeteria Restroom"
	icon_state = "bar"
	sound_env = SMALL_ENCLOSED
/area/crew_quarters/medical_restroom
	name = "\improper Medbay Restroom"
	icon_state = "medbay_restroom"
	sound_env = SMALL_ENCLOSED
/area/crew_quarters/pool
	name = "\improper Pool"
	icon_state = "pool"

/area/crew_quarters/recreation_area
	name = "\improper Recreation Area"
	icon_state = "recreation_area"

/area/crew_quarters/recreation_area_restroom
	name = "\improper Recreation Area Restroom"
	icon_state = "recreation_area_restroom"
	sound_env = SMALL_ENCLOSED

/area/crew_quarters/recreation_area_restroom/showers
	name = "\improper Recreation Area Showers"

/area/crew_quarters/sleep/Dorm_1
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/crew_quarters/sleep/Dorm_2
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/crew_quarters/sleep/Dorm_3
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/crew_quarters/sleep/Dorm_4
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/crew_quarters/sleep/Dorm_5
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/crew_quarters/sleep/Dorm_6
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/crew_quarters/sleep/Dorm_7
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/crew_quarters/sleep/Dorm_8
	area_flags = AREA_FLAG_RAD_SHIELDED
/area/crew_quarters/visitor_lodging
	name = "\improper Visitor Lodging"
	icon_state = "visitor_lodging"

/area/crew_quarters/visitor_dining
	name = "\improper Visitor Dining"
	icon_state = "visitor_dinning"

/area/crew_quarters/visitor_laundry
	name = "\improper Visitor Laundry"
	icon_state = "visitor_laundry"
