/obj/screen/robot/radio
	name       = "radio"
	dir        = SOUTHWEST
	icon_state = "radio"
	screen_loc = ui_movi

/obj/screen/robot/radio/handle_click(mob/user, params)
	if(isrobot(user))
		var/mob/living/silicon/robot/R = user
		R.radio_menu()