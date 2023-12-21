// Tram/gateway arrival point landmarks and decls
/obj/abstract/landmark/latejoin/tram
	spawn_decl = /decl/spawnpoint/tram

/decl/spawnpoint/tram
	name = "Tram Station"
	spawn_announcement = "has arrived on the tram"
	uid = "spawn_tether_tram"

/decl/spawnpoint/gateway
	name = "Gateway"
	spawn_announcement = "has completed translation from offsite gateway"
	uid = "spawn_tether_gateway"

/obj/abstract/landmark/latejoin/gateway
	spawn_decl = /decl/spawnpoint/gateway

/datum/map/tether
	allowed_latejoin_spawns = list(
		/decl/spawnpoint/tram,
		/decl/spawnpoint/gateway,
		/decl/spawnpoint/cryo,
		/decl/spawnpoint/cyborg
	)
	default_spawn = /decl/spawnpoint/tram