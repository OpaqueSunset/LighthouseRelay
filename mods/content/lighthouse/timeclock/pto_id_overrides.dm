/obj/item/card/id
	var/last_job_switch

/obj/item/card/id/Initialize()
	. = ..()
	last_job_switch = world.time