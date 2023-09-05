/datum/map_template/engine
	abstract_type = /datum/map_template/engine
	template_flags = null
	modify_tag_vars = FALSE

/datum/map_template/engine/rust
	name = "R-UST Engine"
	mappaths = list("maps/tether/submaps/engine/engine_rust.dmm")

/datum/map_template/engine/singularity
	name = "Singularity Engine"
	mappaths = list("maps/tether/submaps/engine/engine_singulo.dmm")

/datum/map_template/engine/supermatter
	name = "Supermatter Engine"
	mappaths = list("maps/tether/submaps/engine/engine_sme.dmm")

/// Landmark for where to load in the engine on the map
/obj/abstract/landmark/map_load_mark/engine_loader
	map_template_names = list(
		// "R-UST Engine",
		// "Singularity Engine",
		// ^^ both of those are defunct atm
		"Supermatter Engine"
	)
	centered = FALSE
	/// A list of lists, where each list is a rectangle of turfs to clear in the form of (x1, y1, x2, y2)
	var/list/list/clean_turfs

/obj/abstract/landmark/map_load_mark/engine_loader/load_subtemplate()
	annihilate_bounds()
	return ..()

/obj/abstract/landmark/map_load_mark/engine_loader/proc/get_turfs_to_clean()
	. = list()
	for(var/list/coords in clean_turfs)
		. += block(locate(coords[1], coords[2], z), locate(coords[3], coords[4], z))

/obj/abstract/landmark/map_load_mark/engine_loader/proc/annihilate_bounds()
	var/deleted_atoms = 0
	admin_notice(SPAN_DANGER("Annihilating objects in engine loading location."), R_DEBUG)
	var/list/turfs_to_clean = get_turfs_to_clean()
	if(turfs_to_clean.len)
		for(var/x in 1 to 2) // Requires two passes to get everything.
			for(var/turf/T in turfs_to_clean)
				for(var/atom/movable/AM in T)
					++deleted_atoms
					qdel(AM)
	admin_notice(SPAN_DANGER("Annihilated [deleted_atoms] objects."), R_DEBUG)
