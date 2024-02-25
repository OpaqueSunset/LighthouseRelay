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
	outfit_type = /decl/hierarchy/outfit/job/generic/assistant

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
	department_types = list(/decl/department/supply)
	selection_color = "#9b633e"

/datum/job/offduty/engineering
	title = "Off-duty Engineer"
	department_types = list(/decl/department/engineering)
	selection_color = "#5b4d20"

/datum/job/offduty/medical
	title = "Off-duty Medic"
	department_types = list(/decl/department/medical)
	selection_color = "#013d3b"

/datum/job/offduty/science
	title = "Off-duty Scientist"
	department_types = list(/decl/department/science)
	selection_color = "#633d63"

/datum/job/offduty/security
	title = "Off-duty Officer"
	department_types = list(/decl/department/security)
	selection_color = "#601c1c"
