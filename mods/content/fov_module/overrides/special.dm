/*
Filter effects below.
*/
/mob/living/carbon/human/add_filter_effects()
	..()
	var/obj/screen/plane_master/vision_cone_target/VC = new //ALWAYS DEFINE THIS, WEIRD SHIT HAPPENS OTHERWISE
	var/obj/screen/plane_master/vision_cone/primary/mob = new//creating new masters to remove things from vision.
	var/obj/screen/plane_master/vision_cone/primary/lyingmob = new//ditto
	var/obj/screen/plane_master/vision_cone/primary/human = new//ditto
	var/obj/screen/plane_master/vision_cone/primary/lyinghuman = new//ditto
	//var/obj/screen/plane_master/vision_cone/primary
	//var/obj/screen/plane_master/vision_cone/primary/aboveturf = new
	var/obj/screen/plane_master/vision_cone/inverted/footsteps = new//This master specifically makes it so the footstep stuff ONLY appears where it can't be seen.

	//define what planes the masters dictate.
	mob.plane = MOB_PLANE
	lyingmob.plane = LYING_MOB_PLANE
	human.plane = HUMAN_PLANE
	lyinghuman.plane =LYING_HUMAN_PLANE
	//aboveturf.plane = ABOVE_TURF_PLANE
	footsteps.plane = FOOTSTEP_ALERT_PLANE

	client.screen += VC // Is this necessary? Yes.
	client.screen += mob
	client.screen += lyingmob
	client.screen += human
	client.screen += lyinghuman
	//client.screen += aboveturf //Comment this out if you don't like it
	client.screen += footsteps

/mob/proc/InitializeHud()
	..()
	add_filter_effects()

/mob/proc/add_filter_effects()
	var/obj/blur_planemaster/PM = new//This is the z-blur shit. It's HUD related so I put it here.
	var/obj/blur_planemaster/zmob = new
	var/obj/blur_planemaster/under = new
	var/obj/screen/plane_master/blur/bullet_plane/BP = new
	var/obj/screen/plane_master/blur/ghost_master/gm = new //So ghosts are spooky and blurry.
	//var/obj/screen/plane_master/humanAO/HM = new
	//var/obj/screen/plane_master/wallAO/WT = new
	//var/obj/screen/plane_master/objectAO/OB = new
	//var/obj/screen/plane_master/lying_human/LH = new
	//var/obj/screen/plane_master/mobAO/MO = new
	under.plane = UNDER_OPENSPACE_PLANE
	zmob.plane = OVER_OPENSPACE_PLANE
	//client.screen += LH
	//client.screen += OB
	//client.screen += WT
	//client.screen += HM
	//client.screen += MO
	client.screen += zmob
	client.screen += PM
	client.screen += under
	client.screen += gm
	client.screen += BP
