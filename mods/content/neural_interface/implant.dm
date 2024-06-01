// Taken mostly from cyberbrain augment code.
/obj/item/organ/internal/augment/active/nif
	name = "nanite interface framework"
	action_button_name = "Access NIF"
	icon_state = "cyberbrain" // TEMPORARY
	allowed_organs = list(BP_AUGMENT_HEAD)
	augment_flags = AUGMENTATION_ORGANIC | AUGMENTATION_MECHANIC
	origin_tech = "{'materials':2,'magnets':3,'engineering':3,'biotech':2,'programming':4}"

	var/list/default_hardware = list(
		/obj/item/stock_parts/computer/processor_unit/small,
		/obj/item/stock_parts/computer/hard_drive/small,
		/obj/item/stock_parts/computer/network_card,
		/obj/item/stock_parts/computer/battery_module/nano,
		/obj/item/stock_parts/computer/tesla_link
	)

/*
 *
 * Section for actual NIF mechanics.
 *
 */
/obj/item/organ/internal/augment/active/nif/Initialize()
	. = ..()

	START_PROCESSING(SSobj, src)
	set_extension(src, /datum/extension/interactive/os/device/implant/nif)
	set_extension(src, /datum/extension/assembly/modular_computer/nif)

	update_icon()

	install_default_hardware()

// SSobj processing stops on install due to the organ decay system. We don't want that. Restart it.
/obj/item/organ/internal/augment/active/nif/do_install(mob/living/carbon/human/target, obj/item/organ/external/affected, in_place, update_icon, detached)
	if((. = ..()))
		START_PROCESSING(SSobj, src)

/obj/item/organ/internal/augment/active/nif/get_contained_external_atoms()
	. = ..()
	var/datum/extension/assembly/assembly = get_extension(src, /datum/extension/assembly)
	if(assembly)
		LAZYREMOVE(., assembly.parts)

// Used to perform preset-specific hardware changes.
/obj/item/organ/internal/augment/active/nif/proc/install_default_hardware()
	var/datum/extension/assembly/assembly = get_extension(src, /datum/extension/assembly)
	for(var/T in default_hardware)
		assembly.try_install_component(null, new T(src))

/obj/item/organ/internal/augment/active/nif/activate()
	if(!can_activate())
		return

	var/datum/extension/assembly/modular_computer/assembly = get_extension(src, /datum/extension/assembly)
	var/datum/extension/interactive/os/os = get_extension(src, /datum/extension/interactive/os)
	if(assembly.enabled && assembly.screen_on)
		if(os)
			os.ui_interact(owner)
	else if(!assembly.enabled && assembly.screen_on)
		assembly.turn_on(owner)
		if(os && assembly.enabled && assembly.screen_on) // successfully turned on
			os.ui_interact(owner)

/obj/item/organ/internal/augment/active/nif/attackby(var/obj/item/W, var/mob/user)
	var/datum/extension/assembly/assembly = get_extension(src, /datum/extension/assembly)
	if(assembly.attackby(W, user))
		return
	return ..()

/obj/item/organ/internal/augment/active/nif/handle_mouse_drop(atom/over, mob/user)
	if(!istype(over, /obj/screen))
		attack_self(user)
		return TRUE
	. = ..()

/obj/item/organ/internal/augment/active/nif/Process()
	..()
	if(!is_broken() && !(status & ORGAN_DEAD))
		var/datum/extension/assembly/assembly = get_extension(src, /datum/extension/assembly)
		if(assembly)
			assembly.Process()
			if(!assembly.enabled)
				return
		var/datum/extension/interactive/os/os = get_extension(src, /datum/extension/interactive/os)
		if(os)
			os.Process()

// Hack to make status bar work
/obj/item/organ/internal/augment/active/nif/initial_data()
	. = ..()
	var/datum/extension/interactive/os/os = get_extension(src, /datum/extension/interactive/os)
	if(os)
		. += os.get_header_data()

/obj/item/organ/internal/augment/active/nif/get_contained_matter()
	. = ..()
	var/datum/extension/assembly/assembly = get_extension(src, /datum/extension/assembly)
	for(var/obj/part in assembly?.parts)
		. = MERGE_ASSOCS_WITH_NUM_VALUES(., part.get_contained_matter())

/*
 *
 * Section for assembly override for the NIF.
 *
 */
/datum/extension/assembly/modular_computer/nif
	hardware_flag = PROGRAM_NIF
	max_hardware_size = 1
	enabled_by_default = TRUE
	max_parts = list(
		PART_BATTERY 	= 1,
		PART_CPU		= 1,
		PART_NETWORK	= 1,
		PART_HDD		= 1,
		PART_AI			= 1,
		PART_TESLA		= 1
	)
	expected_type = /obj/item/organ/internal/augment/active/nif
	assembly_name = "nanite interface framework"
	force_synth = TRUE

/datum/extension/interactive/os/device/implant/nif
	os_name = "NIF"
	os_full_name = "Nanite Interface Framework v2.0.0-rc1"
	expected_type = /obj/item/organ/internal/augment/active/nif

/mob/getHUDsource(hudtype)
	if((. = ..()))
		return .
	var/obj/item/organ/internal/augment/active/nif/nif = get_organ(BP_AUGMENT_HEAD, /obj/item/organ/internal/augment/active/nif)
	if(!nif?.is_usable())
		return null
	var/datum/extension/assembly/assembly = get_extension(nif, /datum/extension/assembly)
	var/obj/item/stock_parts/computer/network_card/network_card = assembly.get_component(PART_NETWORK)
	var/datum/extension/interactive/os/os = get_extension(nif, /datum/extension/interactive/os)
	for(var/datum/computer_file/program/nifsoft/nif_hud/running_nifhud in os.running_programs)
		if(hudtype == running_nifhud.hudtype)
			return network_card // I hate this.

/* If we ever want to switch to returning the NIF instead of the network card, we have the following code.
// Checks for NIF networks. TODO: /atom/proc/get_network()?
/mob/getHUDnetwork(hudtype)
	if((. = ..()))
		return .
	var/obj/item/organ/internal/augment/active/nif/nif = getHUDsource(hudtype)
	if(!nif?.is_usable())
		return null
	var/datum/extension/interactive/os/os = get_extension(nif, /datum/extension/interactive/os)
	return os.get_network()
*/