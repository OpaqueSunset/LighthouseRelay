/obj/item/handcuffs/fuzzy
	name = "fluffy cuffs"
	icon = 'maps/tether/icons/obj/fluffyhandcuffs.dmi'
	desc = "Use this to keep... 'prisoners' in line."
	breakouttime = 3 SECONDS

// todo: port legcuffs upstream, then readd
/*
/obj/item/handcuffs/legcuffs/fuzzy
	name = "fluffy legcuffs"
	icon = 'maps/tether/icons/obj/fluffylegcuffs.dmi'
 */

//
// Collars, ported from Citadel RP
//

/obj/item/clothing/neck/choker //A colorable, tagless choker
	name = "plain choker"
	slot_flags = SLOT_OVER_BODY
	desc = "A simple, plain choker. Or maybe it's a collar? Use in-hand to customize it."
	icon = 'maps/tether/icons/obj/clothing/choker.dmi'
	obj_flags = OBJ_FLAG_HOLLOW
	var/customized = FALSE
	var/static/list/allowed_descriptors = list(
		"plain",
		"simple",
		"ornate",
		"elegant",
		"opulent",
	)
	var/static/list/allowed_materials = list(
		/decl/material/solid/organic/leather,
		/decl/material/solid/organic/leather/synth,
		/decl/material/solid/organic/cloth,
		/decl/material/solid/organic/plastic,
		/decl/material/solid/metal/stainlesssteel,
		/decl/material/solid/metal/silver,
		/decl/material/solid/metal/gold,
		/decl/material/solid/metal/platinum
	)
	var/static/list/allowed_necklace_types = list(
		"choker",
		"collar",
		"necklace"
	)

/obj/item/clothing/neck/choker/attack_self(mob/user)
	. = ..()
	if(.)
		return
	if(!customized)
		var/design = input(user,"Descriptor?","Pick descriptor","") as null|anything in allowed_descriptors
		if(!design)
			to_chat(user, SPAN_NOTICE("You decide not to finalize your choker yet."))
			return
		var/list/materials = decls_repository.get_decls(allowed_materials)
		var/list/material_choices = list()
		for(var/mat_key in materials)
			material_choices[materials[mat_key]] = mat_key
		var/new_material = material_choices[input(user,"Material?","Pick material","") as null|anything in material_choices]
		if(!new_material)
			to_chat(user, SPAN_NOTICE("You decide not to finalize your choker yet."))
			return
		var/necklace_type = input(user,"Type?","Pick type","") as null|anything in allowed_necklace_types
		if(!necklace_type)
			to_chat(user, SPAN_NOTICE("You decide not to finalize your choker yet."))
			return
		set_material(new_material)
		matter = null // regenerate matter entirely
		create_matter()
		color = material.color
		name = "[design] [material.adjective_name] [necklace_type]"
		desc = "A [necklace_type], made of [material.use_name]. It's rather [design]."
		customized = TRUE
		to_chat(user, SPAN_NOTICE("[src] has now been customized."))
	else
		to_chat(user, SPAN_NOTICE("[src] has already been customized!"))

/obj/item/clothing/neck/collar
	abstract_type = /obj/item/clothing/neck/collar
	slot_flags = SLOT_OVER_BODY
	obj_flags = OBJ_FLAG_HOLLOW
	var/writtenon = FALSE

/obj/item/clothing/neck/collar/silver
	name = "silver tag collar"
	desc = "A collar for your little pets... or the big ones."
	icon = 'maps/tether/icons/obj/clothing/collars/silver_collar.dmi'

/obj/item/clothing/neck/collar/gold
	name = "golden tag collar"
	desc = "A collar for your little pets... or the big ones."
	icon = 'maps/tether/icons/obj/clothing/collars/gold_collar.dmi'

/obj/item/clothing/neck/collar/bell
	name = "bell collar"
	desc = "A collar with a tiny bell hanging from it, purrfect furr kitties."
	icon = 'maps/tether/icons/obj/clothing/collars/bell_collar.dmi'
	var/jingled = FALSE

/obj/item/clothing/neck/collar/bell/verb/jinglebell()
	set name = "Jingle Bell"
	set category = "Object"
	set src in usr
	if(!istype(usr, /mob/living) || usr.restrained() || usr.incapacitated())
		return

	if(!jingled)
		usr.audible_message("<b>[usr]</b> jingles \the [src]'s bell.", SPAN_NOTICE("You jingle \the [src]'s bell."), "<b>[usr]</b> plays with \the [src]'s bell.")
		jingled = TRUE
		addtimer(CALLBACK(src, PROC_REF(jingledreset)), 5 SECONDS)
	return

/obj/item/clothing/neck/collar/bell/proc/jingledreset()
	jingled = FALSE

/obj/item/clothing/neck/collar/shock
	name = "shock collar"
	desc = "A collar used to deter hungry predators."
	icon = 'maps/tether/icons/obj/clothing/collars/shock_collar.dmi'
	obj_flags = OBJ_FLAG_HOLLOW | OBJ_FLAG_CONDUCTIBLE
	var/on = FALSE // starts off to encourage people to set non-default frequencies and codes.
	var/frequency = 1449
	var/code = 2
	var/datum/radio_frequency/radio_connection

/obj/item/clothing/neck/collar/shock/Initialize(mapload)
	. = ..()
	radio_connection = radio_controller.add_object(src, frequency, RADIO_CHAT) // Makes it so you don't need to change the frequency off of default for it to work.

/obj/item/clothing/neck/collar/shock/Destroy() //Clean up your toys when you're done.
	radio_controller.remove_object(src, frequency)
	radio_connection = null //Don't delete this, this is a shared object.
	return ..()

/obj/item/clothing/neck/collar/shock/proc/set_frequency(new_frequency)
	radio_controller.remove_object(src, frequency)
	frequency = new_frequency
	radio_connection = radio_controller.add_object(src, frequency, RADIO_CHAT)

/obj/item/clothing/neck/collar/shock/Topic(href, href_list)
	if(CanUseTopic(usr, global.hands_topic_state, href_list) == STATUS_INTERACTIVE)
		usr.set_machine(src)
		if(href_list["freq"])
			var/new_frequency = sanitize_frequency(frequency + text2num(href_list["freq"]))
			set_frequency(new_frequency)
		if(href_list["tag"])
			var/str = copytext(reject_bad_text(input(usr,"Tag text?","Set tag","")),1,MAX_LNAME_LEN)
			if(!str || !length(str))
				to_chat(usr, SPAN_NOTICE("[name]'s tag set to be blank."))
				name = initial(name)
				desc = initial(desc)
			else
				to_chat(usr, SPAN_NOTICE("You set the [name]'s tag to '[str]'."))
				name = initial(name) + " ([str])"
				desc = initial(desc) + " The tag says \"[str]\"."
		else
			if(href_list["code"])
				code = clamp(round(code + text2num(href_list["code"])), 1, 100)
			else
				if(href_list["power"])
					on = !on
					update_icon()
		attack_self(usr)
	else
		close_browser(usr, "window=radio")
		return
	return

/obj/item/clothing/neck/collar/shock/receive_signal(datum/signal/signal)
	if(!signal || signal.encryption != code)
		return

	if(on)
		var/turf/spark_loc = get_turf(src)
		var/mob/victim = null
		if(ismob(loc))
			victim = loc
		if(ismob(loc.loc))
			victim = loc.loc // This is about as terse as I can make my solution to the whole 'collar won't work when attached as accessory' thing.
		spark_at(spark_loc, 3, cardinal_only = TRUE, holder = victim)
		if(victim)
			to_chat(victim, SPAN_DANGER("You feel a sharp shock!"))
			victim.set_status(STAT_WEAK, 5 SECONDS)
	return

/obj/item/clothing/neck/collar/shock/on_update_icon()
	// overlays are cut in /obj/item/on_update_icon()
	. = ..()
	if(on)
		add_overlay("world_on")

/obj/item/clothing/neck/collar/shock/attack_self(mob/user)
	if(!istype(user, /mob/living/carbon/human))
		return
	user.set_machine(src)
	var/dat = {"<TT>
			<A href='?src=\ref[src];power=1'>Turn [on ? "Off" : "On"]</A><BR>
			<B>Frequency/Code</B> for collar:<BR>
			Frequency:
			<A href='byond://?src=\ref[src];freq=-10'>-</A>
			<A href='byond://?src=\ref[src];freq=-2'>-</A> [format_frequency(frequency)]
			<A href='byond://?src=\ref[src];freq=2'>+</A>
			<A href='byond://?src=\ref[src];freq=10'>+</A><BR>

			Code:
			<A href='byond://?src=\ref[src];code=-5'>-</A>
			<A href='byond://?src=\ref[src];code=-1'>-</A> [code]
			<A href='byond://?src=\ref[src];code=1'>+</A>
			<A href='byond://?src=\ref[src];code=5'>+</A><BR>

			Tag:
			<A href='?src=\ref[src];tag=1'>Set tag</A><BR>
			</TT>"}
	show_browser(user, dat, "window=radio")
	onclose(user, "radio")
	return

/obj/item/clothing/neck/collar/spike
	name = "spiked collar"
	desc = "A collar with spikes that look as sharp as your teeth."
	icon = 'maps/tether/icons/obj/clothing/collars/spike_collar.dmi'

/obj/item/clothing/neck/collar/pink
	name = "pink collar"
	desc = "This collar will make your pets look FA-BU-LOUS."
	icon = 'maps/tether/icons/obj/clothing/collars/pink_collar.dmi'

/obj/item/clothing/neck/collar/holo
	name = "holo-collar"
	desc = "An expensive holo-collar for the modern day pet."
	icon = 'maps/tether/icons/obj/clothing/collars/holo_collar.dmi'
	material = /decl/material/solid/metal/stainlesssteel
	obj_flags = OBJ_FLAG_HOLLOW | OBJ_FLAG_CONDUCTIBLE

/obj/item/clothing/neck/collar/silvercolor
	name = "dyeable silver tag collar"
	desc = "A collar for your little pets... or the big ones."
	icon = 'maps/tether/icons/obj/clothing/collars/colorized_collar.dmi'
	material = /decl/material/solid/organic/cloth
	paint_color = COLOR_BLACK
	matter = list(
		/decl/material/solid/metal/silver = MATTER_AMOUNT_TRACE
	)

/obj/item/clothing/neck/collar/cowbell
	name = "cowbell collar"
	desc = "A collar for your little pets... or the big ones."
	icon = 'maps/tether/icons/obj/clothing/collars/cowbell_collar.dmi'

/////////////////////////
// Collar interactions //
/////////////////////////

/obj/item/clothing/neck/collar/attack_self(mob/user)
	. = ..()
	if(.)
		return
	if(istype(src,/obj/item/clothing/neck/collar/holo))
		to_chat(user, SPAN_NOTICE("[name]'s interface is projected onto your hand."))
	else
		if(writtenon)
			to_chat(user, SPAN_NOTICE("You need a pen or a screwdriver to edit the tag on this collar."))
			return
		to_chat(user, SPAN_NOTICE("You adjust the [name]'s tag."))

	var/str = copytext(reject_bad_text(input(user,"Tag text?","Set tag","")),1,MAX_LNAME_LEN)

	if(!str || !length(str))
		to_chat(user, SPAN_NOTICE("[name]'s tag set to be blank."))
		name = initial(name)
		desc = initial(desc)
	else
		to_chat(user, SPAN_NOTICE("You set the [name]'s tag to '[str]'."))
		initialize_tag(str)

/obj/item/clothing/neck/collar/proc/initialize_tag(tag, writemethod = "engraved")
	name = initial(name) + " ([tag])"
	desc = initial(desc) + " \"[tag]\" has been [writemethod] on the tag."
	writtenon = TRUE

/obj/item/clothing/neck/collar/holo/initialize_tag(var/tag)
	..()
	desc = initial(desc) + " The tag says \"[tag]\"."

/obj/item/clothing/neck/collar/attackby(obj/item/I, mob/user)
	if(IS_SCREWDRIVER(I))
		update_collartag(user, I, "scratched out", "scratch out", "engraved")
		return TRUE

	if(IS_PEN(I))
		update_collartag(user, I, "crossed out", "cross out", "written")
		return TRUE

	return ..()

/obj/item/clothing/neck/collar/proc/update_collartag(mob/user, obj/item/I, erasemethod, erasing, writemethod)
	if(!(isturf(src.loc) || user.is_holding_offhand(src)))
		to_chat(user, SPAN_WARNING("You need to hold the collar or set it down in order to write on the tag!"))
		return
	if(user.incapacitated() || user.restrained())
		return

	var/str = copytext(reject_bad_text(input(user,"Tag text?","Set tag","")),1,MAX_LNAME_LEN)

	if(!length(str))
		if(!writtenon)
			to_chat(user, SPAN_NOTICE("You don't write anything."))
		else
			to_chat(user, SPAN_NOTICE("You [erasing] the words with the [I]."))
			name = initial(name)
			desc = initial(desc) + " The tag has had the words [erasemethod]."
	else
		if(!writtenon)
			to_chat(user, SPAN_NOTICE("You write '[str]' on the tag with the [I]."))
			initialize_tag(str, writemethod)
		else
			to_chat(user, SPAN_NOTICE("You [erasing] the words on the tag with the [I], and write '[str]'."))
			name = initial(name) + " ([str])"
			desc = initial(desc) + " Something has been [erasemethod] on the tag, and it now has \"[str]\" [writemethod] on it."

// Costumes
/obj/item/clothing/under/dress/maid
	name = "maid costume"
	desc = "Maid in China."
	icon = 'maps/tether/icons/obj/clothing/costume/maid.dmi'

/obj/item/clothing/under/dress/maid/janitor
	name = "maid uniform"
	desc = "A simple maid uniform for housekeeping."
	icon = 'maps/tether/icons/obj/clothing/costume/janitor_maid.dmi'

/obj/item/clothing/under/dress/maid/sexy
	name = "sexy maid costume"
	desc = "You must be a bit risque teasing all of them in a maid uniform!"
	icon = 'maps/tether/icons/obj/clothing/costume/sexy_maid.dmi'

//KotetsuRedwood:Latex Maid Dresses, for everyone to 'enjoy'. :3c
/obj/item/clothing/under/dress/maid/latex
	name = "latex maid dress"
	desc = "Squeak! A shiny outfit for cleaning, made by people with dirty minds."
	icon = 'maps/tether/icons/obj/clothing/costume/latex_maid.dmi'
	bodytype_equip_flags = BODY_FLAG_HUMANOID | BODY_FLAG_AVIAN