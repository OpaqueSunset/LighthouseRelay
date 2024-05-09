/mob/proc/update_vision_cone()
	return

/mob/living/carbon/human/update_vision_cone()
	if(!client)
		return
	check_fov()
	fov.dir = dir
	fov_mask.dir = dir
	if(!client.prefs) // Needed to get the selected icon size
		return
	var/matrix/scaling_matrix = new()
	scaling_matrix.Scale(client.prefs.icon_size/32, client.prefs.icon_size/32)
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

	if(current_posture.prone || (client && client.eye != client.mob))
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
