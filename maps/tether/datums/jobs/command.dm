/datum/job/captain
	title = "Colony Director"
	alt_titles = list("Site Manager", "Overseer", "Director of Operations")
	department_types = list(/decl/department/command)
	total_positions = 1
	spawn_positions = 1
	supervisors = "company officials and Corporate Regulations"
	selection_color = "#1d1d4f"
	access = list() 			//See get_access()
	minimal_access = list() 	//See get_access()
	minimal_player_age = 14
	economic_power = 20
	ideal_character_age = 70
	outfit_type = /decl/hierarchy/outfit/job/captain
	head_position = TRUE
	req_admin_notify = TRUE
	disallow_jobhop = TRUE
	pto_type = PTO_COMMAND
	timeoff_factor = 5
	guestbanned = TRUE
	must_fill = TRUE
	not_random_selectable = TRUE
	min_skill = list(
		SKILL_LITERACY    = SKILL_ADEPT,
		SKILL_SCIENCE     = SKILL_ADEPT,
		SKILL_PILOT       = SKILL_ADEPT
	)
	max_skill = list(
		SKILL_PILOT       = SKILL_MAX,
		SKILL_SCIENCE     = SKILL_MAX
	)
	skill_points = 30
	software_on_spawn = list(
		/datum/computer_file/program/comm,
		/datum/computer_file/program/card_mod,
		/datum/computer_file/program/camera_monitor,
		/datum/computer_file/program/reports
	)

/datum/job/captain/get_access()
	return get_all_station_access()

/datum/job/captain/get_occupations_tab_sort_score()
	return ..() + 100

/datum/job/hop
	title = "Head of Personnel"
	department_types = list(
		/decl/department/command,
		/decl/department/civilian
	)
	total_positions = 1
	spawn_positions = 1
	supervisors = "the captain"
	selection_color = "#2f2f7f"
	minimal_player_age = 14
	economic_power = 10
	ideal_character_age = 50
	head_position = TRUE
	req_admin_notify = TRUE
	disallow_jobhop = TRUE
	pto_type = PTO_COMMAND
	guestbanned = TRUE
	not_random_selectable = TRUE
	access = list(
		access_security,
		access_sec_doors,
		access_brig,
		access_forensics_lockers,
		access_heads,
		access_medical,
		access_engine,
		access_change_ids,
		access_ai_upload,
		access_eva,
		access_bridge,
		access_all_personal_lockers,
		access_maint_tunnels,
		access_bar,
		access_janitor,
		access_construction,
		access_morgue,
		access_crematorium,
		access_kitchen,
		access_cargo,
		access_cargo_bot,
		access_mailsorting,
		access_qm,
		access_hydroponics,
		access_lawyer,
		access_chapel_office,
		access_library,
		access_research,
		access_mining,
		access_heads_vault,
		access_mining_station,
		access_hop,
		access_RC_announce,
		access_keycard_auth,
		access_gateway
	)
	minimal_access = list(
		access_security,
		access_sec_doors,
		access_brig,
		access_forensics_lockers,
		access_heads,
		access_medical,
		access_engine,
		access_change_ids,
		access_ai_upload,
		access_eva,
		access_bridge,
		access_all_personal_lockers,
		access_maint_tunnels,
		access_bar,
		access_janitor,
		access_construction,
		access_morgue,
		access_crematorium,
		access_kitchen,
		access_cargo,
		access_cargo_bot,
		access_mailsorting,
		access_qm,
		access_hydroponics,
		access_lawyer,
		access_chapel_office,
		access_library,
		access_research,
		access_mining,
		access_heads_vault,
		access_mining_station,
		access_hop,
		access_RC_announce,
		access_keycard_auth,
		access_gateway
	)
	alt_titles = list(
		"Deputy Director",
		"Crew Resources Officer",
		"Underseer"
	)
	outfit_type = /decl/hierarchy/outfit/job/hop
	min_skill = list(
		SKILL_LITERACY    = SKILL_ADEPT,
		SKILL_COMPUTER    = SKILL_BASIC,
		SKILL_PILOT       = SKILL_BASIC
	)
	max_skill = list(
		SKILL_PILOT       = SKILL_MAX,
		SKILL_SCIENCE     = SKILL_MAX
	)
	skill_points = 30

/datum/job/secretary
	title = "Command Secretary"
	department_types = list(/decl/department/command, /decl/department/service)
	disallow_jobhop = TRUE
	pto_type = PTO_COMMAND // you count! for now...
	total_positions = 2
	spawn_positions = 2
	supervisors = "Command staff"
	selection_color = "#2f2f7f"
	minimal_player_age = 5
	economic_power = 7
	skill_points = 24

	min_skill = list(
		SKILL_LITERACY    = SKILL_ADEPT,
		SKILL_COMPUTER    = SKILL_BASIC,
	)

	access = list(access_heads, access_keycard_auth)
	minimal_access = list(access_heads, access_keycard_auth)
	alt_titles = list("Bridge Officer")

	outfit_type = /decl/hierarchy/outfit/job/secretary
