/mob/proc/has_personal_goal(var/goal_type)
	if(mind) return locate(goal_type) in mind.goals

/mob/proc/update_personal_goal(var/goal_type, var/progress)
	var/datum/goal/goal = has_personal_goal(goal_type)
	if(goal)
		goal.update_progress(progress)

/mob/verb/show_goals_verb()

	set name = "Show Goals"
	set desc = "Shows your round goals."
	set category = "IC"

	show_goals(TRUE, TRUE)

/mob/proc/show_goals(var/show_success = FALSE, var/allow_modification = FALSE)

	if(!mind)
		to_chat(src, SPAN_WARNING("You are mindless and cannot have goals."))
		return

	//No goals to display
	if(!(allow_modification || LAZYLEN(mind.goals)) && !(LAZYLEN(mind.assigned_job?.department_types)))
		return

	to_chat(src, "<hr>")
	if(LAZYLEN(mind.goals))
		to_chat(src, SPAN_NOTICE("<font size = 3><b>This round, you have the following personal goals:</b></font><br>[jointext(mind.summarize_goals(show_success, allow_modification, mind.current), "<br>")]"))
	else
		to_chat(src, SPAN_NOTICE("<font size = 3><b>You have no personal goals this round.</b></font>"))
	if(allow_modification && LAZYLEN(mind.goals) < 5)
		to_chat(src, SPAN_NOTICE("<a href='byond://?src=\ref[mind];add_goal=1;add_goal_caller=\ref[mind.current]'>Add Random Goal</a>"))

	for(var/dept_key in mind.assigned_job?.department_types)
		var/decl/department/dept = SSjobs.get_department_by_type(dept_key)
		if(dept)
			if(LAZYLEN(dept.goals))
				to_chat(src, SPAN_NOTICE("<br><br><font size = 3><b>This round, [dept.name] has the following [dept.noun_adj] goals:</b></font><br>[jointext(dept.summarize_goals(show_success), "<br>")]"))
			else
				to_chat(src, SPAN_NOTICE("<br><br><font size = 3><b>[dept.name] has no [dept.noun_adj] goals this round.</b></font>"))

	if(LAZYLEN(mind.goals))
		to_chat(mind.current, SPAN_NOTICE("<br><br>You can check your round goals with the <b>Show Goals</b> verb."))

	to_chat(src, "<hr>")
