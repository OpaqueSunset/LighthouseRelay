//////////////////////////////////////////////////////////////////////////
//This is the file where all the stats and skills procs are kept.	    //
//Directly pulled from old Interbay. Credit to Matt.			  	    //
//																 	    //
//																 	    //
//Stats are pretty generic, skills are kind of specific. 				//
//You should just be able to plop in the proc call wherever you want.   //
//I tried to make it versitile.											//
// - Matt 																//
//////////////////////////////////////////////////////////////////////////

/decl/modpack/character_building
	name = "Stats, Skills & More"

//defines
#define CRIT_SUCCESS_NORM 1
#define CRIT_FAILURE_NORM 1
#define CRIT_SUCCESS 2
#define CRIT_FAILURE 3

#define STAT_ST "st"
#define STAT_DX "dx"
#define STAT_IQ "iq"
#define STAT_EN "en"

//To generate stats, follow the below template. -Carl
/*
/datum/job/example
	equip(var/mob/living/carbon/human/H)
		H.generate_stats(STAT_ST)
		H.generate_skills(list("melee","ranged","medical"))
		H.generate_skills(list("melee","ranged","medical","engineering"))
*/
