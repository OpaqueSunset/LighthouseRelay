/obj/item/disk/nifsoft
	name = "\improper NIFsoft install disk"
	desc = "An install disk for compatible nanite-based software hosts. \
	When brought within 5cm of the skull, the disk's payload is automatically transferred."
	color = COLOR_OLIVE
	label = "label_up"

/// Checks if we have packed NIFsofts to install.
/obj/item/disk/nifsoft/proc/can_install(mob/user, loud = TRUE)
	// must have at least one nifpak to install
	for(var/pak_name in stored_files)
		var/datum/computer_file/data/nifpak/pak = stored_files[pak_name]
		// todo: add metadata and configuration checks here
		// mainly for stuff like compliance disk laws
		if(pak.get_packed_program())
			return TRUE
	// no nifpaks, no installation
	if(loud)
		to_chat(user, "[src] has no programs to install!")
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
		var/datum/computer_file/program/nifsoft/packed_nifsoft = new packed_program() // Now we have the actual file.
		if(destination.store_file(packed_nifsoft, programs_directory, FALSE) == OS_FILE_SUCCESS)
			delete_file(pak_name) // Basic anti-piracy measure. Can be circumvented by adding write-protection.
	// todo: name/icon change when all files are deleted
	// also some way to jailbreak/reuse it to either copy files or let you add new ones
	return TRUE

/obj/item/disk/nifsoft/afterattack(atom/target, mob/user, adjacent, click_parameters)
	if(!adjacent)
		return
	if(can_install(user) && can_install_to(target, user))
		do_install(target, user)
		return
	return ..()

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

/datum/computer_file/data/nifpak/proc/get_packed_program()
	return global.nifsoft_reverse_hash_lookup[stored_data]

/obj/item/disk/nifsoft/proc/make_nifpak(datum/computer_file/program/nifsoft/prog_to_pack)
	return new /datum/computer_file/data/nifpak(null, prog_to_pack)

/obj/item/disk/nifsoft/Initialize(ml, material_key)
	. = ..()
	load_programs()

/// Loads the default programs (bundle or single) onto the disk.
/// If exact_fit is true, the disk will be resized to have exactly enough capacity to hold the starting programs.
/obj/item/disk/nifsoft/proc/load_programs(exact_fit = TRUE)
	if(exact_fit)
		block_capacity = initial(block_capacity) - free_blocks

// NIFsoft disks come in single and bundle formats.
/obj/item/disk/nifsoft/single
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

// TODO: add disk configuration based on contained programs rather than the type of the disk
// maybe use file metadata for it?
// until then, replacing other install disk contents with compliance programs won't work properly
/obj/item/disk/nifsoft/single/compliance
	installed_nifsoft = null // todo: add compliance disk program
	var/laws

// TODO: move checks and configuration to compliance disk program
/obj/item/disk/nifsoft/single/compliance/can_install(mob/user, loud = TRUE)
	if(!length(laws))
		if(loud)
			to_chat(user, SPAN_WARNING("You haven't set any laws yet!"))
		return FALSE
	return ..()

/obj/item/disk/nifsoft/single/compliance/attack_self(mob/user)
	var/newlaws = input(user,"Input laws:","Compliance Laws",laws) as message
	newlaws = sanitize(newlaws, MAX_PAPER_MESSAGE_LEN)
	if(newlaws)
		to_chat(user,"You set the laws to:<br>[SPAN_NOTICE(newlaws)]")
		laws = newlaws

/obj/item/disk/nifsoft/single/sechud
	installed_nifsoft = /datum/computer_file/program/nifsoft/nif_hud/sec_hud

/obj/item/disk/nifsoft/bundle/medical
	name = "\improper NIFsoft install disk - Medical"
	bundle_desc = "A bundle of useful medical-related NIF software."
	installed_nifsofts = list(
		/datum/computer_file/program/nifsoft/nif_hud/med_hud,
		/datum/computer_file/program/nifsoft/suit_sensors,
		// todo: self-body-scanner
	)