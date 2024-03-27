/obj/machinery/gear_painter
	name = "\improper ColorMate"
	desc = "A machine to give your apparel a fresh new color! Recommended to use with white items for best results."
	icon = 'icons/obj/machines/gear_painter.dmi'
	icon_state = "colormate"
	density = TRUE
	anchored = TRUE
	/// The item to be colored.
	var/obj/item/inserted
	var/painting_color = COLOR_WHITE
	var/list/allowed_types = list(
		/obj/item/clothing,
		/obj/item/towel,
		/obj/item/storage/backpack,
		/obj/item/storage/belt,
		// todo: make color variant toys (plushies, etc) greyscaled?
		// todo: make headsets use greyscale and decals? handling for painting stripes, etc. on specific objects?
	)

/obj/machinery/gear_painter/on_update_icon()
	if(panel_open)
		icon_state = "colormate_open"
	else if(inoperable())
		icon_state = "colormate_off"
	else if(inserted)
		icon_state = "colormate_active"
	else
		icon_state = "colormate"

/obj/machinery/gear_painter/Destroy()
	dump_contents() // this will handle try_unset_paintable as well
	return ..()

/obj/machinery/gear_painter/proc/insert_paintable(obj/item/to_insert, mob/user)
	if(user)
		user.visible_message("<b>\The [user]</b> inserts \the [to_insert] into [src]'s receptable.", SPAN_NOTICE("You insert \the [to_insert] into [src]'s receptacle."))
		user.drop_from_inventory(to_insert)
	to_insert.forceMove(src)
	inserted = to_insert
	events_repository.register(/decl/observ/moved, to_insert, src, PROC_REF(try_unset_paintable))
	SSnano.update_uis(src)
	update_icon()

/obj/machinery/gear_painter/proc/try_unset_paintable(obj/item/removed)
	if(removed.loc == src)
		return
	// do not move it, this is called when it's already been removed
	inserted = null
	events_repository.unregister(/decl/observ/moved, removed, src, PROC_REF(try_unset_paintable))

/obj/machinery/gear_painter/attackby(obj/item/held_item, mob/user)
	if(!is_type_in_list(held_item, allowed_types))
		return ..()
	if(inserted)
		to_chat(user, SPAN_WARNING("The machine is full."))
		return TRUE
	if(inoperable())
		return TRUE
	insert_paintable(held_item, user)
	return TRUE

/obj/machinery/gear_painter/interface_interact(mob/user)
	ui_interact(user)
	return TRUE

/obj/machinery/gear_painter/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1)
	. = ..()
	var/list/data = list()
	if(inserted)
		data["item"] = inserted.name
		data["item_color"] = inserted.paint_color
	data["painting_color"] = painting_color
	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if(!ui)
		ui = new(user, src, name, "gear_painter.tmpl", name)
		ui.set_initial_data(data)
		ui.open()

/obj/machinery/gear_painter/OnTopic(mob/user, href_list, datum/topic_state/state)
	. = ..()
	if(.)
		return .

	add_fingerprint(usr)

	if(href_list["select"])
		var/newcolor = input(usr, "Choose a color.", "[name] color picking", painting_color) as color|null
		if(newcolor)
			painting_color = newcolor
		return TOPIC_REFRESH

	if(href_list["paint"])
		inserted.set_color(painting_color)
		playsound(src, 'sound/effects/spray3.ogg', 50, TRUE)
		return TOPIC_REFRESH

	if(href_list["clear"])
		inserted.set_color(null) // COLOR_WHITE works too, but null is clearer that we're unsetting
		playsound(src, 'sound/effects/spray3.ogg', 50, TRUE)
		return TOPIC_REFRESH

	if(href_list["eject"])
		dump_contents() // removes inserted, handled by try_unset_paintable
		return TOPIC_REFRESH
