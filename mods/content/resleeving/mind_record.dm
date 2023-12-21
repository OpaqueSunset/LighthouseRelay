#define MIND_RECORD_FIELD_MIND "MIND"
#define MIND_RECORD_FIELD_ASPECTS "ASPECTS"
#define MIND_RECORD_FIELD_PRONOUNS "PRONOUNS"

/datum/computer_file/data/mind_record
	read_only = TRUE
	filetype = "MND"
	uncopyable = TRUE // must be consumed!

/datum/computer_file/data/mind_record/proc/get_ckey()
	return ckey(get_mind()?.key)

/datum/computer_file/data/mind_record/proc/get_identifier()
	return get_mind()?.name

/* // TODO: revisit once transfer_with_mind is in
/datum/computer_file/data/mind_record/proc/get_aspects()
	return LAZYACCESS(metadata, MIND_RECORD_FIELD_ASPECTS) */

/datum/computer_file/data/mind_record/proc/get_pronouns()
	return LAZYACCESS(metadata, MIND_RECORD_FIELD_PRONOUNS)

/// This exists mostly for hashing purposes.
/datum/computer_file/data/mind_record/proc/get_mind_refstring()
	var/weakref/mind_ref = LAZYACCESS(metadata, MIND_RECORD_FIELD_MIND)
	return mind_ref?.ref

/datum/computer_file/data/mind_record/proc/get_mind()
	RETURN_TYPE(/datum/mind)
	var/weakref/mind_ref = LAZYACCESS(metadata, MIND_RECORD_FIELD_MIND)
	return mind_ref.resolve()

/datum/computer_file/data/mind_record/proc/get_associated_client()
	RETURN_TYPE(/client)
	return global.ckey_directory[get_ckey()]

var/global/resleeving_salt = rand(1111, 9999) // used to make sure hashes aren't consistent between rounds
/datum/computer_file/data/mind_record/generate_file_data(mob/user)
	return {"
		<center>
			<h1>TRANSCORE MIND BACKUP</h1>
			<h3><span class='bad'>Unauthorized access or usage of this file is prohibited by law.</span></h3>
			[get_identifier()]
			[sha1("[get_mind_refstring()][global.resleeving_salt]")]
		</center>"}

/mob/living/proc/create_mind_record(upload = TRUE)
	if(!mind)
		return
	var/list/metadata = list(
		(MIND_RECORD_FIELD_MIND) = weakref(mind),
		(MIND_RECORD_FIELD_PRONOUNS) = get_pronouns()
		// TODO: aspects
	)
	var/datum/computer_file/data/mind_record/mind_backup = new(metadata)
	mind_backup.filename = "[replacetext(real_name, " ", "_")].MND"
	if(upload)
		var/datum/computer_network/network = get_local_network_at(get_turf(src))
		if(network)
			network.store_file(mind_backup, OS_MIND_RECORDS_DIR, TRUE, mainframe_role = MF_ROLE_TRANSCORE)
	return mind_backup

/// Transfers the stored mind to a mob and deletes itself.
/datum/computer_file/data/mind_record/proc/transfer_to_mob(mob/target)
	var/datum/mind/stored_mind = get_mind()
	if(!stored_mind)
		return FALSE
	stored_mind.active = TRUE
	stored_mind.transfer_to(target)
	// todo: handle transfer-with-mind aspects here someday
	var/decl/pronouns/stored_pronouns = get_pronouns()
	if(stored_pronouns)
		target.set_gender(stored_pronouns.name)
	remove_from_holder()
	return TRUE