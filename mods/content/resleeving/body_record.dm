#define BODY_RECORD_FIELD_SNAPSHOT "SNAPSHOT"
#define BODY_RECORD_FIELD_BODYTYPE "BODYTYPE"
#define BODY_RECORD_FIELD_ASPECTS "ASPECTS"
#define BODY_RECORD_FIELD_GENEMODS "GENEMODS"
#define BODY_RECORD_GENEMOD_TAIL "TAIL"
#define BODY_RECORD_GENEMOD_EARS "EARS"
#define BODY_RECORD_GENEMOD_COLOR "COLOR"
#define BODY_RECORD_GENEMOD_COLOR_EXTRA "COLOR_EXTRA"
#define BODY_RECORD_GENEMOD_STYLE "STYLE"

/datum/computer_file/data/body_record
	read_only = TRUE
	filetype = "BDY"

/datum/computer_file/data/body_record/proc/get_snapshot()
	return LAZYACCESS(metadata, BODY_RECORD_FIELD_SNAPSHOT)

/datum/computer_file/data/body_record/proc/get_bodytype_string()
	return LAZYACCESS(metadata, BODY_RECORD_FIELD_BODYTYPE)

/datum/computer_file/data/body_record/proc/get_species()
	var/datum/mob_snapshot/our_snapshot = get_snapshot()
	if(!our_snapshot)
		return null
	return get_species_by_key(our_snapshot.root_species)

/datum/computer_file/data/body_record/proc/get_bodytype_decl()
	var/decl/species/our_species = get_species()
	if(!our_species)
		return null
	return our_species.get_bodytype_by_name(get_bodytype_string())

/datum/computer_file/data/body_record/generate_file_data(mob/user)
	var/datum/mob_snapshot/our_snapshot = get_snapshot()
	return {"
		<center>
			<h2>TRANSCORE BODY RECORD</h1>
			<h3>Open Genetic Record Format v1.1</h3>
			<hr>
			<p>[our_snapshot.real_name]</p>
			<p>[our_snapshot.fingerprint]</p>
			<p>[md5(our_snapshot.genetic_conditions)]</p>
			<p>[our_snapshot.unique_enzymes]</p>
			<p>[our_snapshot.root_species]</p>
			<p>[our_snapshot.root_bodytype]</p>
			<p>[get_bodytype_string()]</p>
		</center>"}

/mob/living/human/proc/get_body_record_metadata()
	var/list/metadata = list()
	metadata[BODY_RECORD_FIELD_SNAPSHOT] = new /datum/mob_snapshot(src)
	var/bodytype_string = get_bodytype()?.name
	if(bodytype_string)
		metadata[BODY_RECORD_FIELD_BODYTYPE] = bodytype_string
	return metadata

/mob/living/human/proc/create_body_record(upload = TRUE)
	// todo: implement BODY_RECORD_FIELD_ASPECTS for storing physical aspects, EXCLUDE things like prosthetics
	var/datum/computer_file/data/body_record/body_record = new(get_body_record_metadata())
	body_record.filename = "[replacetext(real_name, " ", "_")].BDY"
	if(upload)
		var/datum/computer_network/network = get_local_network_at(get_turf(src))
		if(network)
			network.store_file(body_record, OS_BODY_RECORDS_DIR, TRUE, mainframe_role = MF_ROLE_TRANSCORE)
	return body_record

/obj/item/disk/transcore
	name = "transcore record disk"
	desc = "A standard 3.5 inch floppy disk labeled for usage with TransCore-compatible mind and body records."
	color = COLOR_DEEP_SKY_BLUE
	label = "label_dna"
	origin_tech = "{'biotech':2}"

/datum/fabricator_recipe/medical/transcore_disk
	path = /obj/item/disk/transcore

/obj/item/box/transcore_record_disk/WillContain()
	return list(/obj/item/disk/transcore = 7)

/datum/computer_file/data/body_record/proc/create_human(location)
	var/mob/living/human/our_human = new /mob/living/human(location, null, get_snapshot())
	our_human.update_hair(update_icons = TRUE)
	return our_human

#ifdef CONTENT_PACK_GENEMODDING
/mob/living/human/get_body_record_metadata()
	var/list/metadata = ..()
	if(tail_style)
		LAZYINITLIST(metadata[BODY_RECORD_FIELD_GENEMODS])
		LAZYINITLIST(metadata[BODY_RECORD_FIELD_GENEMODS][BODY_RECORD_GENEMOD_TAIL])
		LAZYSET(metadata[BODY_RECORD_FIELD_GENEMODS][BODY_RECORD_GENEMOD_TAIL], BODY_RECORD_GENEMOD_STYLE, tail_style.uid)
		LAZYSET(metadata[BODY_RECORD_FIELD_GENEMODS][BODY_RECORD_GENEMOD_TAIL], BODY_RECORD_GENEMOD_COLOR, tail_color)
		LAZYSET(metadata[BODY_RECORD_FIELD_GENEMODS][BODY_RECORD_GENEMOD_TAIL], BODY_RECORD_GENEMOD_COLOR_EXTRA, tail_color_extra)
	if(ear_style)
		LAZYINITLIST(metadata[BODY_RECORD_FIELD_GENEMODS])
		LAZYINITLIST(metadata[BODY_RECORD_FIELD_GENEMODS][BODY_RECORD_GENEMOD_EARS])
		LAZYSET(metadata[BODY_RECORD_FIELD_GENEMODS][BODY_RECORD_GENEMOD_EARS], BODY_RECORD_GENEMOD_STYLE, ear_style.uid)
		LAZYSET(metadata[BODY_RECORD_FIELD_GENEMODS][BODY_RECORD_GENEMOD_EARS], BODY_RECORD_GENEMOD_COLOR, ear_color)
		LAZYSET(metadata[BODY_RECORD_FIELD_GENEMODS][BODY_RECORD_GENEMOD_EARS], BODY_RECORD_GENEMOD_COLOR_EXTRA, ear_color_extra)
	return metadata

/datum/computer_file/data/body_record/proc/get_tail_metadata()
	if(!LAZYACCESS(metadata, BODY_RECORD_FIELD_GENEMODS))
		return
	return LAZYACCESS(metadata[BODY_RECORD_FIELD_GENEMODS], BODY_RECORD_GENEMOD_TAIL)

/datum/computer_file/data/body_record/proc/get_ears_metadata()
	if(!LAZYACCESS(metadata, BODY_RECORD_FIELD_GENEMODS))
		return
	return LAZYACCESS(metadata[BODY_RECORD_FIELD_GENEMODS], BODY_RECORD_GENEMOD_EARS)

/datum/computer_file/data/body_record/create_human(location)
	var/mob/living/human/our_human = ..()
	var/list/tail_data = get_tail_metadata()
	if(tail_data?[BODY_RECORD_GENEMOD_STYLE])
		our_human.tail_style = decls_repository.get_decl_by_id(tail_data[BODY_RECORD_GENEMOD_STYLE])
		our_human.tail_color = tail_data[BODY_RECORD_GENEMOD_COLOR]
		our_human.tail_color_extra = tail_data[BODY_RECORD_GENEMOD_COLOR_EXTRA]
	our_human.sync_tail_to_style(update_icon = FALSE)
	var/list/ear_data = get_ears_metadata()
	if(ear_data?[BODY_RECORD_GENEMOD_STYLE])
		our_human.ear_style = decls_repository.get_decl_by_id(ear_data[BODY_RECORD_GENEMOD_STYLE])
		our_human.ear_color = ear_data[BODY_RECORD_GENEMOD_COLOR]
		our_human.ear_color_extra = ear_data[BODY_RECORD_GENEMOD_COLOR_EXTRA]
	return our_human
#endif