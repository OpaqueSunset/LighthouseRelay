/////////////VISION CONE///////////////
//Vision cone code by, originally by Matt and Honkertron, rewritten by Chaoko99. This vision cone code allows for mobs and/or items to blocked out from a players field of vision.
//It makes use of planes and alpha masks only possible in 513 and above. Please see human_alt.dm and hud_alt.dm in the hud folder for more info on how this works.
///////////////////////////////////////

//"Made specially for Otuska"
// - Honker


// And now a note from Chaoko99 on what he did to the old vision cone code:
// "Kinda ripped all this out. Made a big fucking mess of the place, but this is overall cheaper. Probably breaks shit too.
// Refer to some earlier revision or interbay 2.0 for the original code."
// ~Chaoko99

/mob/proc/update_vision_cone()
	return

/mob/living/carbon/human/update_vision_cone()
	if(!src.client) //This doesn't actually hide shit from clientless mobs, so just keep them from running this.
		return
	check_fov()
	fov.dir = dir
	fov_mask.dir = dir
	var/list/viewsize = getviewsize(client.view)
	var/matrix/scaling_matrix = new()
	scaling_matrix.Scale(viewsize[1]/15, viewsize[2]/15)
	fov.transform = scaling_matrix
	fov_mask.transform = scaling_matrix

/mob/living/carbon/human/reload_fullscreen()
	update_vision_cone()
	return ..()

/mob/living/carbon/human/proc/SetFov(var/show)
	if(!show)
		hide_cone()
	else
		show_cone()

/mob/living/carbon/human/proc/check_fov()
	if(!src.client)
		return

	if(resting || lying || (client && client.eye != client.mob))
		src.fov.alpha = 0
		src.fov_mask.alpha = 0
		return

	else if(src.usefov)
		show_cone()

	else
		hide_cone()

//Making these generic procs so you can call them anywhere.
/mob/living/carbon/human/proc/show_cone()
	if(src.fov)
		src.fov.alpha = 255
		src.usefov = TRUE
		src.fov_mask.alpha = 255

/mob/living/carbon/human/proc/hide_cone()
	if(src.fov)
		src.fov.alpha = 0
		src.usefov = FALSE
		src.fov_mask.alpha = 0
