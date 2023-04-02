
/*    ===== skills =====
	Skils work a lot differently then stats.  They have a hard limit that once you exceed it, you automatically pass.
	Otherwise, we run proc(skill) to see if you pass or not.
	I like this, because specific jobs can be given a garunteed chance to perform an action, while other will have to flouder through rng.
	Generated similarly to stats, just on a larger scale.  3 rand(1,34) are rolled, and totaled for each skill.  Main Skill(s) is set the higest
	rest are picked at random.
	There should be mainly used for specific actions by the player.  Are you skilled enough to construct this wall?  Are you skilled enough to
	bandage this patient?  I think this rule is adhered to mostly already in the doe.
*/

/mob
	//This is getting long fuuuucckk

	var/list/skills = list("melee" = 0, "ranged" = 0, "medical" = 0, "surgery" = 0, "engineering" = 0, "crafting" = 0, "cooking" = 0, "science" = 0, "cleaning" = 0, "gardening" = 0, "mining" = 0)

	//crit shit
	var/crit_success_chance = CRIT_SUCCESS_NORM
	var/crit_failure_chance = CRIT_FAILURE_NORM
	var/crit_success_modifier = 0
	var/crit_failure_modifier = 0
	var/crit_mood_modifier = 0

/mob/proc/get_success_chance()
	return crit_success_chance + crit_success_modifier + crit_mood_modifier

/mob/proc/get_failure_chance()
	return crit_failure_chance + crit_failure_modifier + crit_mood_modifier


/mob/proc/skillcheck(var/skill, var/requirement, var/message = null, var/skill_type = null)//1 - 100
	log_debug("[skill_type] check!  Skill value: [skill], DC [requirement] source: [src]") //Debuging
	//learn_skills(skill_type) We can't have nice things
	if(skill >= requirement)//If we already surpass the skill requirements no need to roll.
		if(prob(get_success_chance()))//Only thing we roll for is a crit success.
			return CRIT_SUCCESS
		return 1
	else
		if(prob(1))//Otherwise we roll to see if we pass.
			if(prob(get_success_chance()))//And again to see if we get a crit scucess.
				return CRIT_SUCCESS
			return 1
		else
			if(message)//If we don't have a message, just return failure
				to_chat(src, "<span class = 'warning'>[message]</span>")
			if(prob(get_failure_chance()))//And roll for a crit failure.
				return CRIT_FAILURE
			return 0

/mob/proc/learn_skills(var/skill_type)
	var/initial_skill = round(skills[skill_type])
	if(skills[skill_type] < 30 && stat_to_modifier(stats[STAT_IQ]) >= 0) //the minimum for reading
		skills[skill_type] += 0.01 * stat_to_modifier(stats[STAT_IQ])
	else //Learn slower past 30
		if(skills[skill_type] >= 70)
			return 0 //cant learn above 70 in any skill because this was abused
		else
			skills[skill_type] += 0.001
	if(round(skills[skill_type]) > initial_skill)
		to_chat(src,"You feel like live you've gained new insights.")

//Skill helpers.
/mob/proc/skillnumtodesc(var/skill)
	switch(skill)
		if(0 to 24)
			return "<small><i>unskilled</i></small>"
		if(25 to 44)
			return "alright"
		if(45 to 59)
			return "skilled"
		if(60 to 79)
			return "professional"
		if(80 to INFINITY)
			return "<b>godlike</b>"

// 3 rand(1,34) are rolled, and totaled for each skill.  Main Skill is set the higest, rest are picked at random.
/mob/proc/generate_skills(var/list/generate_skills)
	var/list/rand_skills = skills.Copy()
	//Roll a new random roll for each stat
	for(var/skill in generate_skills)
		skills[skill] = (40 + rand(1,40) + rand(1,40))
		rand_skills -= skill
	for(var/skill in rand_skills)
		skills[skill] = (rand(1,15) + rand(1,15) + rand(1,15))
/*
/mob/proc/add_skills(var/melee_val, var/ranged_val, var/medical_val, var/engineering_val)//To make adding skills quicker.
	if(melee_val)
		melee = melee_val
	if(ranged_val)
		ranged = ranged_val
	if(medical_val)
		medical = medical_val
	if(engineering_val)
		engineering = engineering_val
*/

/mob/living/carbon/human/verb/check_skills()//Debug tool for checking skills until I add the icon for it to the HUD.
	set name = "Check Skills"
	set category = "IC"

	var/message = "<big><b>Skills:</b></big>\n"
	for(var/skill in skills)
		if(skills[skill] > 0)
			message += "I am <b>[skillnumtodesc(skills[skill])]</b> at [skill].\n"
	to_chat(src, message)

/mob/living/carbon/human/verb/reset_stats_skills()
	for(var/stats in stats)
		if(stats[stat] > 20)
			stats[stat] = 20
	for(var/skill in skills)
		if(stats[stat] > 100)
			stats[stat] = 100
