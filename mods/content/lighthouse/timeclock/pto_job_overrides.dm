// These use const instead of define so that they're available no matter
// where/when this file is included, as long as it's included somewhere.
var/global/const/PTO_CARGO = "Cargo"
var/global/const/PTO_CIVILIAN = "Civilian"
var/global/const/PTO_COMMAND = "Command"
var/global/const/PTO_CYBORG = "Cyborg"
var/global/const/PTO_ENGINEERING = "Engineering"
var/global/const/PTO_EXPLORATION = "Exploration"
var/global/const/PTO_MEDICAL = "Medical"
var/global/const/PTO_SCIENCE = "Science"
var/global/const/PTO_SECURITY = "Security"

/datum/job
	var/pto_type = PTO_CIVILIAN
	var/disallow_jobhop = FALSE
	/// Number of hours of PTO given per hour of playtime
	var/timeoff_factor = 1