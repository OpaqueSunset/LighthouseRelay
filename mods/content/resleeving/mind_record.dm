#define MIND_RECORD_FIELD_CKEY "CKEY"
#define MIND_RECORD_FIELD_IDENTIFIER "IDENTIFIER"
#define MIND_RECORD_FIELD_ASPECTS "ASPECTS"
#define MIND_RECORD_FIELD_PRONOUNS "PRONOUNS"

/datum/computer_file/data/mind_record
	read_only = TRUE
	filetype = "MND"

/datum/computer_file/data/mind_record/proc/get_ckey()
	return LAZYACCESS(metadata, MIND_RECORD_FIELD_CKEY)

/datum/computer_file/data/mind_record/proc/get_identifier()
	return LAZYACCESS(metadata, MIND_RECORD_FIELD_IDENTIFIER)

/* // TODO: revisit once transfer_with_mind is in
/datum/computer_file/data/mind_record/proc/get_aspects()
	return LAZYACCESS(metadata, MIND_RECORD_FIELD_ASPECTS) */

/datum/computer_file/data/mind_record/proc/get_pronouns()
	return LAZYACCESS(metadata, MIND_RECORD_FIELD_PRONOUNS)

/datum/computer_file/data/mind_record/proc/get_associated_client()
	return global.ckey_directory[get_ckey()]

var/global/resleeving_salt = rand(1111, 9999) // used to make sure hashes aren't consistent between rounds
/datum/computer_file/data/mind_record/generate_file_data(mob/user)
	return {"
		<center>
			<h1>TRANSCORE MIND BACKUP</h1>
			<h3><span class='bad'>Unauthorized access or usage of this file is prohibited by law.</span></h3>
			[get_identifier()]
			[sha1("[get_identifier()][get_ckey()][global.resleeving_salt]")]
		</center>"}
	// we hash both the identifier (character name) and ckey so that someone rejoining on a later character doesn't get a hash collision

#define OS_MIND_RECORDS_DIR "mind_records"
/mob/living/proc/create_mind_record(upload = TRUE)
	if(!client)
		return
	var/list/metadata = list(
		(MIND_RECORD_FIELD_CKEY) = client.ckey,
		(MIND_RECORD_FIELD_IDENTIFIER) = real_name,
		(MIND_RECORD_FIELD_PRONOUNS) = get_pronouns()
	)
	var/datum/computer_file/data/mind_record/mind_backup = new(metadata)
	mind_backup.filename = replacetext(real_name, " ", "_")
	if(upload)
		var/datum/computer_network/network = get_local_network_at(get_turf(src))
		if(network)
			network.store_file(mind_backup, OS_MIND_RECORDS_DIR, TRUE, mainframe_role = MF_ROLE_TRANSCORE)
	return mind_backup

/obj/item/disk/transcore/mind
	name = "mind backup disk"
	desc = "A standard 3.5 inch floppy disk labeled for usage with TransCore-compatible mind backups."
	color = COLOR_DEEP_SKY_BLUE

/datum/fabricator_recipe/medical/transcore_mind
	path = /obj/item/disk/transcore/mind

/obj/item/storage/box/mind_record_disk/WillContain()
	return list(/obj/item/disk/transcore/mind = 7)