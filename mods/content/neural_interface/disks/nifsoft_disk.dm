/obj/item/disk/nifsoft
	name = "\improper NIFsoft install disk"
	desc = "An install disk for compatible nanite-based software hosts. \
	When brought within 5cm of the skull, the disk's payload is automatically transferred."
	color = "#b7a317"
	label = "label_up"

/// Checks if we have packed NIFsofts to install.
/obj/item/disk/nifsoft/proc/can_install(mob/user, loud = TRUE)
	// must have at least one nifpak to install
	var/configuration_failure = FALSE // whether or not we're failing because of configuration
	for(var/pak_name in stored_files)
		var/datum/computer_file/data/nifpak/pak = stored_files[pak_name]
		var/decl/nifsoft_config_handler/config_handler = pak.get_config_handler()
		if(!pak.get_packed_program())
			continue
		if(!config_handler) // No configuration necessary.
			return TRUE
		if(config_handler.install_ready(pak, user, loud))
			return TRUE
		configuration_failure = TRUE // If we fail, it's only because of configuration.
	// no nifpaks, no installation
	if(loud)
		if(configuration_failure)
			to_chat(user, "\The [src] must be configured before it can be installed!")
		else
			to_chat(user, "\The [src] has no programs to install!")
	return FALSE

/// Checks if the target has a NIF that can have programs installed.
/obj/item/disk/nifsoft/proc/can_install_to(mob/target, mob/user, loud = TRUE)
	if(!ismob(target))
		return FALSE
	var/obj/item/organ/internal/augment/active/nif/target_nif = target.get_organ(BP_AUGMENT_HEAD, /obj/item/organ/internal/augment/active/nif)
	if(!istype(target_nif))
		if(loud)
			to_chat(user, "[target] doesn't have a NIF installed!")
		return FALSE
	var/datum/extension/interactive/os/computer = get_extension(target_nif, /datum/extension/interactive/os)
	var/datum/file_storage/disk/destination = computer?.mounted_storage["local"]
	var/datum/computer_file/directory/programs_directory = destination?.parse_directory(OS_PROGRAMS_DIR, TRUE)
	if(!programs_directory) // any of the three above failed
		if(loud)
			to_chat(user, "[target]'s NIF did not respond to pings.") // something's broken, but be unclear about what
		return FALSE // nowhere to install to on the NIF
	return TRUE

/// Installs the NIFsoft(s) on the disk.
/// Assumes you've done checks for things like the program directory already.
/obj/item/disk/nifsoft/proc/do_install(mob/target, mob/user)
	var/obj/item/organ/internal/augment/active/nif/target_nif = target.get_organ(BP_AUGMENT_HEAD, /obj/item/organ/internal/augment/active/nif)
	var/datum/extension/interactive/os/computer = get_extension(target_nif, /datum/extension/interactive/os)
	var/datum/file_storage/disk/destination = computer.mounted_storage["local"]
	var/datum/computer_file/directory/programs_directory = destination.parse_directory(OS_PROGRAMS_DIR, TRUE)
	var/time_to_upload = 5 SECONDS
	if(user == target)
		time_to_upload = 1 SECOND
		to_chat(user, SPAN_NOTICE("You start installing \the [src] into your NIF..."))
	else
		target.visible_message(SPAN_WARNING("[user] begins uploading \the [src] into [target]'s NIF!"), SPAN_DANGER("[user] begins uploading \the [src] into your NIF!"))
	if(!do_mob(user, target, time_to_upload))
		to_chat(user, SPAN_WARNING("You need to stay still to install \the [src]!"))
		return FALSE
	for(var/pak_name in stored_files)
		var/datum/computer_file/data/nifpak/pak = stored_files[pak_name]
		var/packed_program = pak.get_packed_program()
		if(!ispath(packed_program, /datum/computer_file/program/nifsoft))
			continue
		var/datum/computer_file/program/nifsoft/packed_nifsoft = new packed_program(pak.metadata) // Now we have the actual file.
		if(destination.store_file(packed_nifsoft, programs_directory, FALSE) == OS_FILE_SUCCESS)
			delete_file(pak_name) // Basic anti-piracy measure. Can be circumvented by adding write-protection.
			packed_nifsoft.on_install()
	// todo: name/icon change when all files are deleted
	// also some way to jailbreak/reuse it to either copy files or let you add new ones
	return TRUE

/obj/item/disk/nifsoft/use_on_mob(atom/target, mob/user)
	if(!user.Adjacent(target))
		return ..()
	if(can_install(user) && can_install_to(target, user))
		do_install(target, user)

var/global/nifsoft_salt = rand(1111, 9999)
var/global/list/nifsoft_hash_lookup = list()
var/global/list/nifsoft_reverse_hash_lookup = list()

/datum/computer_file/data/nifpak
	filetype = "PAK"
	read_only = FALSE // You can brick the packed program by editing it.
	do_not_edit = TRUE // But we want to warn people not to do that.
	// todo: add some drawback to piracy (duplicating/redistributing these)
	// maybe some kind of metadata DRM?

/datum/computer_file/data/nifpak/New(list/md = null, datum/computer_file/program/nifsoft/prog_to_pack)
	..()
	if(!ispath(prog_to_pack))
		log_debug("NIFpak created with no program; if this is not a clone of a user-modified disk this is an error!")
		return FALSE
	if(!global.nifsoft_hash_lookup[prog_to_pack])
		global.nifsoft_hash_lookup[prog_to_pack] = md5("[prog_to_pack][global.nifsoft_salt]")
		global.nifsoft_reverse_hash_lookup[global.nifsoft_hash_lookup[prog_to_pack]] = prog_to_pack
	stored_data = global.nifsoft_hash_lookup[prog_to_pack]
	filename = initial(prog_to_pack.filename)

/datum/computer_file/data/nifpak/GetCloneArgs()
	return list(metadata, get_packed_program())

/datum/computer_file/data/nifpak/proc/get_packed_program()
	return global.nifsoft_reverse_hash_lookup[stored_data]

/datum/computer_file/data/nifpak/proc/get_config_handler()
	RETURN_TYPE(/decl/nifsoft_config_handler)
	var/datum/computer_file/program/nifsoft/packed_program = get_packed_program()
	if(!packed_program)
		return null
	var/config_path = initial(packed_program.config_handler)
	if(!config_path)
		return null
	return GET_DECL(config_path)

/obj/item/disk/nifsoft/proc/make_nifpak(datum/computer_file/program/nifsoft/prog_to_pack)
	RETURN_TYPE(/datum/computer_file/data/nifpak)
	return new /datum/computer_file/data/nifpak(null, prog_to_pack)

/obj/item/disk/nifsoft/Initialize(ml, material_key)
	. = ..()
	load_programs()

/obj/item/disk/nifsoft/attack_self(mob/user)
	if(!user.check_dexterity(DEXTERITY_KEYBOARDS)) // Have to type to configure it.
		return ..()
	var/list/configurable_programs = list()
	for(var/pak_name in stored_files)
		var/datum/computer_file/data/nifpak/pak = stored_files[pak_name]
		var/datum/computer_file/program/nifsoft/packed_program = pak.get_packed_program()
		if(!packed_program)
			continue
		var/decl/nifsoft_config_handler/config_handler = pak.get_config_handler()
		if(!config_handler)
			continue
		configurable_programs[initial(packed_program.filedesc)] = pak_name
	if(!length(configurable_programs))
		return ..()
	var/choice = (length(configurable_programs) == 1) ? configurable_programs[1] : (input(user, "Configure which NIFsoft?", "NIFsoft Configuration") as null|anything in configurable_programs)
	if(!choice)
		return TRUE // canceled, no further action
	var/datum/computer_file/data/nifpak/configuring_pak = stored_files[configurable_programs[choice]]
	var/decl/nifsoft_config_handler/pak_config_handler = configuring_pak.get_config_handler()
	var/option = (length(pak_config_handler.options) == 1) ? pak_config_handler.options[1] : (input(user, "Configure which option?", "NIFsoft Configuration") as null|anything in pak_config_handler.options)
	if(!option)
		return TRUE // canceled
	if(!pak_config_handler.prompt_user(configuring_pak, user, option)) // something broke, notify the user
		to_chat(user, SPAN_WARNING("\The [src] reports an unspecified configuration error."))

/// Loads the default programs (bundle or single) onto the disk.
/// If exact_fit is true, the disk will be resized to have exactly enough capacity to hold the starting programs.
/obj/item/disk/nifsoft/proc/load_programs(exact_fit = TRUE)
	if(exact_fit && length(stored_files))
		block_capacity = initial(block_capacity) - free_blocks
		free_blocks = 0

// NIFsoft disks come in single and bundle formats.
/obj/item/disk/nifsoft/single
	abstract_type = /obj/item/disk/nifsoft/single
	/// The path of the NIFsoft this disk installs.
	var/datum/computer_file/program/nifsoft/installed_nifsoft

/obj/item/disk/nifsoft/single/load_programs()
	write_file(make_nifpak(installed_nifsoft))
	..()

/obj/item/disk/nifsoft/single/Initialize(ml, material_key)
	. = ..()
	SetName("[initial(name)] - [initial(installed_nifsoft.filedesc)]")
	desc = "[initial(desc)]\n[initial(installed_nifsoft.extended_desc)]"

/obj/item/disk/nifsoft/bundle
	abstract_type = /obj/item/disk/nifsoft/bundle
	var/bundle_desc
	/// The paths of the NIFsofts this disk installs.
	var/list/datum/computer_file/program/nifsoft/installed_nifsofts

/obj/item/disk/nifsoft/bundle/Initialize(ml, material_key)
	. = ..()
	desc = "[initial(desc)]\n[bundle_desc]"

/obj/item/disk/nifsoft/bundle/load_programs()
	for(var/nifsoft_to_install in installed_nifsofts)
		write_file(make_nifpak(nifsoft_to_install))
	..()
