/mob
	/// Used for augmented vision, required on /mob because both ghosts and living mobs can have it.
	/// AR images and AR-only (observer-like) mobs are on this plane.
	var/obj/screen/ar_plane_master/ar_master

/mob/InitializeHud()
	..()
	refresh_ar_master()

/obj/screen/ar_plane_master
	screen_loc = "CENTER"
	plane = AR_PLANE
	appearance_flags = PLANE_MASTER
	vis_flags = 0
	mouse_opacity = MOUSE_OPACITY_UNCLICKABLE	//Normally unclickable
	requires_ui_style = FALSE
	var/visible = FALSE

/obj/screen/ar_plane_master/proc/set_visible(new_state)
	visible = new_state
	if(visible)
		alpha = 255
		mouse_opacity = MOUSE_OPACITY_NORMAL
	else
		alpha = 0
		mouse_opacity = MOUSE_OPACITY_UNCLICKABLE

/mob/Destroy()
	QDEL_NULL(ar_master)
	return ..()

/mob/proc/refresh_ar_master()
	if(!ar_master)
		ar_master = new (null, src)
	if(client)
		client.screen |= ar_master
	sync_ar_state()

/// Displays the actual AR images based on whether the AR plane is visible.
/mob/proc/sync_ar_state()
	var/decl/appearance_handler/augmented_reality/AR = GET_DECL(/decl/appearance_handler/augmented_reality)
	var/state = ar_master?.visible
	if(state)
		AR.DisplayAllAltAppearancesTo(src)
	else
		AR.HideAllAltAppearancesFrom(src) // if not already in viewers, this is cheap

/mob/proc/update_ar_state(new_state)
	refresh_ar_master()
	ar_master.set_visible(new_state)
	sync_ar_state()

/mob/hud_reset(full_reset)
	. = ..()
	if(client && !full_reset)
		refresh_ar_master()

// AR can be gained in two ways:
// 1) AR glasses (unimplemented atm)
// 2) AR overlay NIFsoft
/decl/appearance_handler/augmented_reality
	priority = 16 // Should probably override cardborg stuff, if that ever applies?
