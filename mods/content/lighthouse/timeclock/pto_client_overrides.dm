/client
	///Track hours of leave accured for each PTO department.
	var/list/department_hours = list()

/client/log_client_to_db()
	. = ..()
	var/DBQuery/query_hours = global.dbcon.NewQuery(
		"SELECT department, hours FROM `player_hours` WHERE ckey = [sql_sanitize_text(src.ckey)]"
	)
	while(query_hours.NextRow())
		LAZYINITLIST(department_hours)
		department_hours[query_hours.item[1]] = text2num(query_hours.item[2])