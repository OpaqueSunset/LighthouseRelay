// SleeveMate!
// Taken from CitRP. No support for infomorphs yet.
/obj/item/scanner/sleevemate
	name = "\improper SleeveMate 3700"
	desc = "A hand-held sleeve management tool for performing one-time backups and managing mindstates."
	icon = 'mods/content/resleeving/sleevemate.dmi'
	icon_state = "sleevemate"
	item_state = "healthanalyzer"
	material = /decl/material/solid/metal/aluminium
	origin_tech = @'{"magnets":2,"biotech":2}'
	use_delay = 4 SECONDS

	var/datum/computer_file/data/mind_record/stored_mind_record

/obj/item/scanner/sleevemate/is_valid_scan_target(atom/O)
	return ishuman(O)

/obj/item/scanner/sleevemate/attack_self(mob/living/user)
	if(!stored_mind_record)
		to_chat(user, SPAN_WARNING("No stored mind in \the [src]."))
		return

	var/choice = alert(user, "What would you like to do?", "Stored: [stored_mind_record.get_identifier()]", "Delete", "Backup", "Cancel")
	if(!stored_mind_record || user.get_active_held_item() != src)
		return
	switch(choice)
		if("Delete")
			to_chat(user, SPAN_NOTICE("Internal copy of [stored_mind_record.get_identifier()] deleted."))
			QDEL_NULL(stored_mind_record)
			update_icon()
		if("Backup")
			var/datum/computer_network/network = get_local_network_at(get_turf(src))
			if(network?.store_file(stored_mind_record, OS_MIND_RECORDS_DIR, TRUE, mainframe_role = MF_ROLE_TRANSCORE))
				to_chat(user, SPAN_NOTICE("Internal copy of [stored_mind_record.get_identifier()] backed up to database."))
			else
				to_chat(user, SPAN_WARNING("Unable to connect to local network."))
		if("Cancel")
			return

/obj/item/scanner/sleevemate/scan(atom/A, mob/user)
	scan_data = scan_mob(A, user)
	to_chat(user, "<hr>[scan_data]</hr>")

/obj/item/scanner/sleevemate/proc/scan_mob(mob/living/carbon/human/H, mob/living/user)
	. = "<br><br><span class='notice'><b>[src.name] Scan Results</b></span><br>"

	//Mind name
	. += "<b>Sleeved Mind:</b> "
	if(H.mind)
		. += "[H.mind.name]<br>"
	else
		. += "<span class='warning'>Unknown/None</span><br>"

	//Mind status
	. += "<b>Mind Status:</b> "
	if(H.client)
		. += "Healthy<br>"
	else
		. += "Space Sleep Disorder<br>"

	//Body status
	. += "<b>Sleeve Status:</b> "
	switch(H.stat)
		if(CONSCIOUS)
			. += "Alive<br>"
		if(UNCONSCIOUS)
			. += "Unconscious<br>"
		if(DEAD)
			. += "<span class='warning'>Deceased</span><br>"
		else
			. += "<span class='warning'>Unknown</span><br>"

	//Mind/body comparison
	. += "<b>Sleeve Pair:</b> "
	if(!H.ckey)
		. += "<span class='warning'>No mind in that body</span> [stored_mind_record != null ? "\[<a href='?src=\ref[src];target=\ref[H];mindupload=1'>Upload</a>\]" : null]<br>"
	else if(H.mind && ckey(H.mind.key) != H.ckey)
		. += "<span class='warning'>May not be correct body</span><br>"
	else if(H.mind && ckey(H.mind.key) == H.ckey)
		. += "Appears to be correct mind in body<br>"
	else
		. += "Unable to perform comparison<br>"

	//Actions
	. += "<br><b>-- Possible Actions --</b><br>"
	. += "<b>Mind-Scan (One Time): </b>\[<a href='?src=\ref[src];target=\ref[H];mindscan=1'>Perform</a>\]<br>"
	. += "<b>Body-Scan (One Time): </b>\[<a href='?src=\ref[src];target=\ref[H];bodyscan=1'>Perform</a>\]<br>"

	//Saving a mind
	. += "<b>Store Full Mind: </b>"
	if(stored_mind_record)
		. += "<span class='notice'>Already Stored</span> ([stored_mind_record.get_identifier()])<br>"
	else if(H.mind)
		. += "\[<a href='?src=\ref[src];target=\ref[H];mindsteal=1'>Perform</a>\]<br>"
	else
		. += "<span class='warning'>Unable</span><br>"

/obj/item/scanner/sleevemate/OnTopic(mob/user, href_list)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)

	//Sanity checking/href-hacking checking
	if(user.get_active_held_item() != src)
		to_chat(user, SPAN_WARNING("You're not holding \the [src]."))
		return

	var/target_ref = href_list["target"]
	var/mob/living/target = locate(target_ref)
	if(!target)
		to_chat(user, SPAN_WARNING("Unable to operate on that target."))
		return

	if(!user.Adjacent(target))
		to_chat(user, SPAN_WARNING("You are too far from that target."))
		return

	//The actual options
	if(href_list["mindscan"])
		if(!target.mind)
			to_chat(user, SPAN_WARNING("Target seems totally braindead."))
			return

		user.visible_message("[user] begins scanning [target]'s mind.", SPAN_NOTICE("You begin scanning [target]'s mind."))
		if(do_after(user, 8 SECONDS, target))
			var/datum/computer_file/data/mind_record/temp_record = target.create_mind_record(upload = FALSE) // upload it ourselves so that we can check success
			var/datum/computer_network/network = get_local_network_at(get_turf(src))
			if(network?.store_file(temp_record, OS_MIND_RECORDS_DIR, TRUE, mainframe_role = MF_ROLE_TRANSCORE))
				to_chat(user, SPAN_NOTICE("Mind backed up to remote server!"))
			else
				to_chat(user, SPAN_WARNING("Unable to upload to local network. Please check that a network with a TransCore system is currently operational in the local area."))
		else
			to_chat(user, SPAN_WARNING("You must remain close to your target!"))

		return

	if(href_list["bodyscan"])
		if(!ishuman(target))
			to_chat(user, SPAN_WARNING("Target's neurology is unrecognized or incompatible."))
			return

		var/mob/living/carbon/human/human_target = target
		user.visible_message("[user] begins scanning [target]'s body.", SPAN_NOTICE("You begin scanning [target]'s body."))
		if(do_after(user, 8 SECONDS, target))
			var/datum/computer_file/data/body_record/temp_record = human_target.create_body_record(upload = FALSE) // upload it ourselves so that we can check success
			var/datum/computer_network/network = get_local_network_at(get_turf(src))
			if(network?.store_file(temp_record, OS_BODY_RECORDS_DIR, TRUE, mainframe_role = MF_ROLE_TRANSCORE))
				to_chat(user, SPAN_NOTICE("Mind backed up to remote server!"))
			else
				to_chat(user, SPAN_WARNING("Unable to upload to local network. Please check that a network with a TransCore system is currently operational in the local area."))
			to_chat(user, SPAN_NOTICE("Body scanned!"))
		else
			to_chat(user, SPAN_WARNING("You must remain close to your target!"))

		return

	if(href_list["mindsteal"])
		if(!target.mind)
			to_chat(user, SPAN_WARNING("Target seems totally braindead."))
			return

		if(stored_mind_record)
			to_chat(user, SPAN_WARNING("There is already someone's mind stored inside!"))
			return

		var/choice = alert(user, "This will remove the target's mind from their body. The only way to put it back is via a SleeveMate. Continue?", "Confirmation", "Continue", "Cancel")
		if(choice == "Continue" && user.get_active_held_item() == src && user.Adjacent(target))

			user.visible_message(SPAN_WARNING("[user] begins downloading [target]'s mind!"), SPAN_NOTICE("You begin downloading [target]'s mind!"))
			if(do_after(user, 35 SECONDS, target)) //This is powerful, yo.
				if(!stored_mind_record && target.mind)
					stored_mind_record = target.create_mind_record(upload = FALSE)
					target.ghostize()
					stored_mind_record.get_mind()?.current = null
					update_icon()
					to_chat(user, SPAN_NOTICE("Mind downloaded!"))

		return

	if(href_list["mindupload"])
		if(!stored_mind_record)
			to_chat(user, SPAN_WARNING("\The [src] no longer has a stored mind."))
			return

		if(!istype(target) || target.mind)
			return

		user.visible_message(SPAN_WARNING("[user] begins uploading someone's mind into [target]!"), SPAN_NOTICE("You begin uploading a mind into [target]!"))
		if(do_after(user, 35 SECONDS, target))
			var/datum/mind/stored_mind = stored_mind_record?.get_mind()
			if(!stored_mind)
				to_chat(user, SPAN_WARNING("\The [src] no longer has a stored mind."))
				return
			stored_mind.active = TRUE
			stored_mind.transfer_to(target)
			QDEL_NULL(stored_mind_record)
			to_chat(user, SPAN_NOTICE("Mind transferred into [target]!"))
			update_icon()
