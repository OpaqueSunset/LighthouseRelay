//
// "Off-duty" jobs are for people who want to do nothing and have earned it.
//

/datum/job/offduty
	abstract_type = /datum/job/offduty
	available_by_default = FALSE
	timeoff_factor = -1
	total_positions = -1
	supervisors = "nobody! Enjoy your time off"
	selection_color = "#9b633e"
	access = list()
	minimal_access = list()
	outfit_type = /decl/outfit/job/generic/assistant
	description = "Off-duty crew has no responsibilities or authority and is just here to spend their \"well-deserved\" time off."

/datum/job/offduty/get_access()
	if(get_config_value(/decl/config/toggle/assistant_maint))
		return list(access_maint_tunnels)
	else
		return list()

/datum/job/offduty/civilian
	title = "Off-duty Worker"
	department_types = list(/decl/department/civilian)
	selection_color = "#9b633e"

/datum/job/offduty/cargo
	title = "Off-duty Cargo"
	pto_type = PTO_CARGO
	department_types = list(/decl/department/supply)
	selection_color = "#9b633e"

/datum/job/offduty/engineering
	title = "Off-duty Engineer"
	pto_type = PTO_ENGINEERING
	department_types = list(/decl/department/engineering)
	selection_color = "#5b4d20"

/datum/job/offduty/medical
	title = "Off-duty Medic"
	pto_type = PTO_MEDICAL
	department_types = list(/decl/department/medical)
	selection_color = "#013d3b"

/datum/job/offduty/science
	title = "Off-duty Scientist"
	pto_type = PTO_SCIENCE
	department_types = list(/decl/department/science)
	selection_color = "#633d63"

/datum/job/offduty/security
	title = "Off-duty Officer"
	pto_type = PTO_SECURITY
	department_types = list(/decl/department/security)
	selection_color = "#601c1c"


/datum/job/offduty/security
	title = "Off-duty Command"
	pto_type = PTO_COMMAND
	department_types = list(/decl/department/command)
	selection_color = "#9b633e"
