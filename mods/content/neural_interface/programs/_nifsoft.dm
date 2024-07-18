// PROGRAM_NIF defined in code\__defines\computers.dm for easier bitflag conflict resolution
/datum/computer_file/program
	usage_flags = PROGRAM_ALL & ~(PROGRAM_PDA|PROGRAM_NIF) // Non-NIFsofts can't be installed on NIFs.

/datum/computer_file/program/nifsoft
	abstract_type = /datum/computer_file/program/nifsoft
	available_on_network = FALSE
	var/config_handler = null /// Null or a /decl/nifsoft_config_handler subtype.

/datum/computer_file/program/nifsoft/proc/get_nif()
	RETURN_TYPE(/obj/item/organ/internal/augment/active/nif)
	var/obj/item/stock_parts/computer/hard_drive = holder?.resolve()
	if(!istype(hard_drive))
		return null
	var/obj/item/organ/internal/augment/active/nif/our_nif = hard_drive.loc
	if(istype(our_nif))
		return our_nif

/datum/computer_file/program/nifsoft/proc/get_owner()
	RETURN_TYPE(/mob/living/human)
	return get_nif()?.owner

/datum/computer_file/program/nifsoft/proc/on_install()
	return

/decl/nifsoft_config_handler
	abstract_type = /decl/nifsoft_config_handler
	var/list/options /// Associative mapping of config option names to IC defines like IC_FORMAT_NUMBER
	var/list/enums /// Associative mapping of IC_FORMAT_LIST config options to their predefined options.

/decl/nifsoft_config_handler/proc/read_pak(datum/computer_file/data/nifpak/pak, option_name)
	return LAZYACCESS(pak.metadata, option_name)

/decl/nifsoft_config_handler/proc/update_pak(datum/computer_file/data/nifpak/pak, option_name, value)
	LAZYSET(pak.metadata, option_name, value)

/decl/nifsoft_config_handler/proc/install_ready(datum/computer_file/data/nifpak/pak)
	return TRUE

/decl/nifsoft_config_handler/proc/prompt_user(datum/computer_file/data/nifpak/pak, mob/user, option_name)
	. = FALSE
	var/old_value = read_pak(pak, option_name)
	var/new_value
	switch(options[option_name])
		if(IC_FORMAT_STRING)
			new_value = input(user, "Set [option_name] to...", "[option_name] configuration", old_value) as message
		if(IC_FORMAT_NUMBER)
			new_value = input(user, "Set [option_name] to...", "[option_name] configuration", old_value) as num
		if(IC_FORMAT_COLOR)
			new_value = input(user, "Set [option_name] to...", "[option_name] configuration", old_value) as color
		if(IC_FORMAT_BOOLEAN)
			new_value = !read_pak(pak, option_name)
			to_chat(user, SPAN_NOTICE("You switch the [option_name] setting to [new_value ? "on" : "off"]."))
			return TRUE
		if(IC_FORMAT_LIST)
			if(!enums[option_name])
				CRASH("[json_encode(option_name)] used IC_FORMAT_LIST with no enums set!")
			new_value = input(user, "Set [option_name] to...", "[option_name] configuration", old_value) as anything in enums
		if(null)
			CRASH("Nonexistent option [json_encode(option_name)] passed to [type]/prompt_user()!")
		else
			CRASH("Invalid option type [json_encode(options[option_name])] set for option [json_encode(option_name)] on [type]!")
	update_pak(pak, option_name, new_value)
	return TRUE
