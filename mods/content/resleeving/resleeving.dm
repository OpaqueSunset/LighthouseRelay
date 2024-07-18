/decl/modpack/lighthouse
	name = "Resleeving Content"
	desc = "A modpack adding resleeving and transhumanism-related content."
	author = "Lighthouse Station 13 development team"
	credits_crew_outcomes = list("RESLEEVED", "FORKED", "DEIFIC")
	credits_topics = list("RESLEEVING", "PLAYING GOD", "IMMORTALITY", "MIND FORKING", "TRANSHUMANISM")
	credits_nouns = list("CUSTOM SLEEVES")

// TODO: ADD REMOTE RECORD LOADING
#define MF_ROLE_TRANSCORE "TRANSCORE REPOSITORY"
#define OS_MIND_RECORDS_DIR "mind_records"
#define OS_BODY_RECORDS_DIR "body_records"

/hook/startup/proc/add_transcore_role()
	global.all_mainframe_roles |= MF_ROLE_TRANSCORE
	return TRUE

/obj/machinery/network/mainframe/transcore
	initial_roles = list(
		MF_ROLE_TRANSCORE,
		MF_ROLE_FILESERVER
	)

/datum/job
	var/start_with_transcore_backup = TRUE

/datum/controller/subsystem/jobs/equip_job_title(mob/living/human/worker, job_title, joined_late = FALSE)
	. = ..()
	var/datum/job/job = get_by_title(job_title)
	if(!job.start_with_transcore_backup)
		return
	var/decl/bodytype/worker_bodytype = worker.get_bodytype()
	// todo: check prefs
	if(!(worker_bodytype.body_flags & BODY_FLAG_NO_DNA)) // no dna, no body backup
		worker.create_body_record(upload = TRUE)
	if(worker_bodytype.has_organ[BP_BRAIN]) // todo: replace with a better check that still excludes posibrains/synths but not FBPs
		worker.create_mind_record(upload = TRUE)

/obj/machinery/computer/modular/preset/medical/resleeving
	default_software = list(
		/datum/computer_file/program/suit_sensors,
		/datum/computer_file/program/camera_monitor,
		/datum/computer_file/program/records,
		/datum/computer_file/program/wordprocessor
		// todo: add body designer?
	)
	autorun_program = /datum/computer_file/program/filemanager
	uncreated_component_parts = list(
		/obj/item/stock_parts/power/apc,
		/obj/item/stock_parts/computer/data_disk_drive
		)