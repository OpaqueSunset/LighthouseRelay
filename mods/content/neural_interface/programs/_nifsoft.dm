// PROGRAM_NIF defined in code\__defines\computers.dm for easier bitflag conflict resolution
/datum/computer_file/program
	usage_flags = PROGRAM_ALL & ~(PROGRAM_PDA|PROGRAM_NIF) // Non-NIFsofts can't be installed on NIFs.

/datum/computer_file/program/nifsoft
	abstract_type = /datum/computer_file/program/nifsoft
	available_on_network = FALSE
