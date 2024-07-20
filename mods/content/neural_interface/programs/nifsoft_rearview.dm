/datum/computer_file/program/nifsoft/rearview
	filename = "nifrear"
	filedesc = "Warparound Sensors"
	program_icon_state = "hostile"
	program_key_state = "generic_key"
	program_menu_icon = "search"
	extended_desc = "This program uses nanites to warp light and deliver a 360-degree view of the user's surroundings to their eyes. \
	May cause nausea, light sensitivity, and disorientation."
	size = 2
	usage_flags = PROGRAM_NIF

/datum/computer_file/program/nifsoft/rearview/on_startup(mob/living/user, datum/extension/interactive/os/new_host)
	. = ..()
	var/mob/living/human/owner = get_owner()
	if(owner)
		owner.SetFov(FALSE)
		owner.update_vision_cone()

/datum/computer_file/program/nifsoft/rearview/on_shutdown(forced = FALSE)
	. = ..()
	var/mob/living/human/owner = get_owner()
	if(owner)
		owner.SetFov(initial(owner.usefov))
		owner.update_vision_cone()

/datum/computer_file/program/nifsoft/rearview/ui_interact(mob/user, ui_key, datum/nanoui/ui, force_open)
	..()
	computer.minimize_program(user)
	return FALSE