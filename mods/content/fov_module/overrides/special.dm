/*
Filter effects below.
*/
/mob/proc/InitializeHud()
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
