/datum/computer_file/program/nifsoft/nif_hud
	filename = "nifar"
	filedesc = "AR Overlay"
	program_icon_state = "hostile"
	program_key_state = "generic_key"
	program_menu_icon = "search"
	extended_desc = "This program orders nanites to deliver augmented sensory information directly to your visual cortex. In other words, it lets you see a heads-up display."
	size = 2
	usage_flags = PROGRAM_NIF
	var/hudtype = null

/datum/computer_file/program/nifsoft/nif_hud/on_startup(mob/living/user, datum/extension/interactive/os/new_host)
	. = ..()
	computer.minimize_program(user)
	get_owner()?.update_ar_state(TRUE)

/datum/computer_file/program/nifsoft/nif_hud/on_shutdown(forced = FALSE)
	. = ..()
	get_owner()?.update_ar_state(FALSE)

/datum/computer_file/program/nifsoft/nif_hud/process_tick()
	var/obj/item/organ/internal/augment/active/nif/holder = computer.holder
	if(!istype(holder))
		return FALSE
	var/mob/living/human/owner = holder.owner
	if(!owner)
		return FALSE
	process_hud(owner, computer.get_network())

/datum/computer_file/program/nifsoft/nif_hud/ui_interact(mob/user, ui_key, datum/nanoui/ui, force_open)
	..()
	computer.minimize_program(user)
	return FALSE

/datum/computer_file/program/nifsoft/nif_hud/proc/process_hud(mob/owner, datum/network)
	return

// todo: add civ AR overlay for holograms

/datum/computer_file/program/nifsoft/nif_hud/med_hud
	filename = "nifmedihud"
	filedesc = "AR Overlay (Medical)"
	hudtype = HUD_MEDICAL

/datum/computer_file/program/nifsoft/nif_hud/sec_hud
	filename = "nifsechud"
	filedesc = "AR Overlay (Security)"
	hudtype = HUD_SECURITY

/datum/computer_file/program/nifsoft/nif_hud/jani_hud
	filename = "nifjanihud"
	filedesc = "AR Overlay (Janitorial)"
	hudtype = HUD_JANITOR

/datum/computer_file/program/nifsoft/nif_hud/med_hud/process_hud(mob/owner, datum/network)
	process_med_hud(owner, TRUE, network = network)

/datum/computer_file/program/nifsoft/nif_hud/sec_hud/process_hud(mob/owner, datum/network)
	process_sec_hud(owner, TRUE, network = network)

/datum/computer_file/program/nifsoft/nif_hud/jani_hud/process_hud(mob/owner, datum/network)
	process_jani_hud(owner)