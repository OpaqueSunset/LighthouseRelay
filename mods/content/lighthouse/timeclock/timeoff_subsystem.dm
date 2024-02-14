// Write to database every 15 minutes.
SUBSYSTEM_DEF(timeoff)
	name = "PTO"
	wait = 15 MINUTES
	priority = 20
	flags = SS_BACKGROUND | SS_NO_INIT | SS_KEEP_TIMING
	runlevels = RUNLEVEL_GAME | RUNLEVEL_POSTGAME
	var/list/currentrun

/datum/controller/subsystem/timeoff/fire(resumed)
	if(!establish_db_connection())
		return
	/* TODO: readd check when modular config is implemented
	if(!config.time_off)
		return
	*/
	update_department_hours(resumed)

// Do PTO Accruals
/datum/controller/subsystem/timeoff/proc/update_department_hours(resumed = FALSE)
	if(!establish_db_connection())
		src.currentrun.Cut()
		return
	if(!resumed)
		src.currentrun = human_mob_list.Copy()

	//cache for sanic speed (lists are references anyways)
	var/list/currentrun = src.currentrun
	while (currentrun.len)
		var/mob/M = currentrun[currentrun.len--]
		if (QDELETED(M) || !istype(M) || !M.mind || !M.client || M.client.inactivity > wait)
			continue

		// Try and detect job and department of mob
		var/datum/job/J = detect_job(M)
		if(!istype(J) || !J.pto_type || !J.timeoff_factor)
			if (MC_TICK_CHECK)
				return
			continue

		var/department_earning = J.pto_type
		// Update client whatever
		var/client/C = M.client
		var/wait_in_hours = wait / (1 HOUR)
		var/pto_factored = wait_in_hours * J.timeoff_factor
		LAZYINITLIST(C.department_hours)
		var/dept_hours = C.department_hours
		dept_hours[department_earning] += pto_factored

		/* TODO: Re-enable when we have per-modpack config
		// Cap it
		dept_hours[department_earning] = clamp(dept_hours[department_earning], 0, config.pto_cap)
		*/

		// Okay we figured it out, let's update the database!
		var/sql_ckey = sql_sanitize_text(C.ckey)
		var/sql_dpt = sql_sanitize_text(department_earning)
		var/sql_bal = text2num("[C.department_hours[department_earning]]")
		global.dbcon.NewQuery(
			"INSERT INTO `player_hours` (ckey, department, hours) VALUES ([sql_ckey], [sql_dpt]], [sql_bal]]) ON DUPLICATE KEY UPDATE hours = VALUES(hours)"
		).Execute()

		if (MC_TICK_CHECK)
			return

// This proc tries to find the job datum of an arbitrary mob.
/datum/controller/subsystem/timeoff/proc/detect_job(var/mob/employee)
	// Records are usually the most reliable way to get what job someone is.
	var/datum/computer_file/report/crew_record/record = get_crewmember_record(employee.real_name)
	var/recorded_rank = record?.get_rank()
	if(recorded_rank)
		. = SSjobs.get_by_title(recorded_rank)
		if(.) return

	// They have a custom title, aren't crew, or someone deleted their record, so we need a fallback method.
	// Let's check the mind.
	if(employee.mind?.assigned_role)
		. = SSjobs.get_by_title(employee.mind.assigned_role)