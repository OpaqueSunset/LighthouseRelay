/decl/modpack/centcomdb
	name = "CentcomDB Integration"

/decl/modpack/centcomdb/get_player_panel_options(mob/M)
	var/mkey = LAST_CKEY(M)
	var/list/bans = list()
	var/list/result = list()
	var/list/request = list()
	var/body = "<html><head><title>CentCom Ban DB Search</title></head>"
	body += "CentcomDB results for <b>[mkey]</b>"

	request = call(HTTP_POST_DLL_LOCATION, "send_get_request")("https://centcom.melonmesa.com/ban/search/[mkey]", "{}")
	result = json_decode(request)
	if (result["error"])
		log_debug("byhttp error: [result["error"]] ([result["error_code"]])")
		return "[result["error_code"]]"
	if(length(result["body"]))
		bans = json_decode(result["body"])
	if(!length(bans))
		body += "<center><b>0 bans detected for [mkey]</b></center><br>"
		return body
	body += "<center><b>[bans.len] ban\s detected for [mkey]</b></center>"
	for(var/ban in bans)
		body += "<b>Server: </b> [sanitize_text(ban["sourceName"])]<br>"
		body += "<b>RP Level: </b> [sanitize_text(ban["sourceRoleplayLevel"])]<br>"
		body += "<b>Type: </b> [sanitize_text(ban["type"])]<br>"
		body += "<b>Banned By: </b> [sanitize_text(ban["bannedBy"])]<br>"
		body += "<b>Reason: </b> [sanitize_text(ban["reason"])]<br>"
		body += "<b>Banned On: </b> [sanitize_text(ban["bannedOn"])]<br>"
		var/expiration = ban["expires"]
		body += "<b>Expires: </b> [expiration ? "[sanitize_text(expiration)]" : "Permanent"]<br>"
		if(ban["type"] == "job")
			body += "<b>Jobs: </b> "
			var/list/jobs = ban["jobs"]
			body += sanitize_text(jobs.Join(", "))
			body += "<br>"
		body += "<hr>"
	body += "<br>"

	return body