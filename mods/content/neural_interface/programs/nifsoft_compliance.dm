/datum/computer_file/program/nifsoft/compliance
	filename = "nifcompliance"
	filedesc = "Compliance"
	program_icon_state = "hostile"
	program_key_state = "generic_key"
	program_menu_icon = "search"
	extended_desc = "This program interfaces with the user's prefrontal cortex to control decisions and actions based on the supplied directives. Highly illegal."
	size = 2
	usage_flags = PROGRAM_NIF
	config_handler = /decl/nifsoft_config_handler/compliance

/datum/computer_file/program/nifsoft/compliance/on_install()
	to_chat(get_owner(), SPAN_DANGER("You are now bound by the following laws:"))
	to_chat(get_owner(), metadata["Laws"])
	to_chat(get_owner(), SPAN_NOTICE("To see these at any time, open the Compliance program in your NIF."))

/datum/computer_file/program/nifsoft/compliance/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1, var/datum/topic_state/state = global.default_topic_state)
	. = ..()
	if(!.)
		return
	var/list/data = computer.initial_data()
	data["laws"] = metadata["Laws"] ? digitalPencode2html(metadata["Laws"]) : "<span class='bad'>ERROR: NO LAWS FOUND</span>"

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "nifsoft_compliance.tmpl", "Compliance Module", 575, 700, state = state)
		ui.auto_update_layout = TRUE
		ui.set_initial_data(data)
		ui.open()

/decl/nifsoft_config_handler/compliance
	options = list("Laws" = IC_FORMAT_STRING)

/decl/nifsoft_config_handler/compliance/install_ready(datum/computer_file/data/nifpak/pak, user, loud = TRUE)
	. = ..()
	if(!.)
		return
	if(!length(read_pak(pak, "Laws")))
		if(loud)
			to_chat(user, SPAN_WARNING("You haven't set any laws yet!"))
		return FALSE