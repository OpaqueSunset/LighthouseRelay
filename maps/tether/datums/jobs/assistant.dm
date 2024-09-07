/datum/job/visitor
	title = "Visitor"
	total_positions = -1
	spawn_positions = -1
	supervisors = "nobody! You don't work here"
	economic_power = 1
	access = list() // See /datum/job/visitor/get_access()
	minimal_access = list()
	outfit_type = /decl/outfit/job/generic/assistant
	department_types = list(/decl/department/civilian)
	timeoff_factor = 0

/datum/job/visitor/get_access()
	if(get_config_value(/decl/config/toggle/assistant_maint))
		return list(access_maint_tunnels)
	else
		return list()

/datum/job/visitor/intern
	title = "Intern"
	total_positions = -1
	spawn_positions = -1
	supervisors = "the staff from the department you're interning in"
	economic_power = 2
	selection_color = "#555555"
	access = list()
	minimal_access = list()
	department_types = list(/decl/department/civilian)
	alt_titles = list(
		"Assistant",
		"Apprentice Engineer" = /decl/outfit/job/engineering/apprentice,
		"Medical Intern" = /decl/outfit/job/medical/intern,
		"Lab Assistant" = /decl/outfit/job/science/labassistant,
		"Security Cadet" = /decl/outfit/job/generic/assistant/cadet,
		"Jr. Cargo Tech" = /decl/outfit/job/cargo/assistant,
		"Server" = /decl/outfit/job/service/server)
	timeoff_factor = 0 // Interns, noh