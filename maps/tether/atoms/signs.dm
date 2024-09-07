/obj/structure/sign/department/tether
	abstract_type = /obj/structure/sign/department/tether
	icon = 'maps/tether/icons/obj/signs.dmi'

/obj/structure/sign/department/tether/ai
	name = "\improper AI"
	icon_state = "ai"

/obj/structure/sign/department/tether/bar
	name = "\improper BAR"
	icon_state = "bar"

/obj/structure/sign/department/tether/biblio
	name = "\improper LIBRARY"
	icon_state = "biblio"

/obj/structure/sign/department/tether/chapel
	name = "\improper CHAPEL"
	icon_state = "chapel"

/obj/structure/sign/department/tether/commander
	name = "\improper COMMANDER"
	icon_state = "commander"

/obj/structure/sign/department/tether/conference_room
	name = "\improper CONFERENCE"
	icon_state = "conference_room"

/obj/structure/sign/department/tether/engine
	name = "\improper ENGINE"
	icon_state = "engine"

/obj/structure/sign/department/tether/interrogation
	name = "\improper INTERROGATION"
	icon_state = "interrogation"

/obj/structure/sign/department/tether/medbay
	name = "\improper MEDBAY"
	icon_state = "medbay"

/obj/structure/sign/department/tether/morgue
	name = "\improper MORGUE"
	icon_state = "morgue"

/obj/structure/sign/department/tether/operational
	name = "\improper SURGERY"
	icon_state = "operational"

/obj/structure/sign/department/tether/prison
	name = "\improper PRISON"
	icon_state = "prison"

/obj/structure/sign/department/tether/robo
	name = "\improper ROBOTICS"
	icon_state = "robo"

/obj/structure/sign/department/tether/toxins
	name = "\improper TOXINS"
	icon_state = "toxins"

/obj/structure/sign/department/tether/virology
	name = "\improper VIROLOGY"
	icon_state = "virology"

/obj/structure/sign/department/tether/xenolab
	name = "\improper XENOLAB"
	icon_state = "xenolab"

/obj/structure/sign/mining
	name = "\improper NanoTrasen mining corps sign"
	desc = "A sign of relief for weary miners, and a warning for would-be competitors to Nanotrasen's mining claims."
	icon = 'maps/tether/icons/obj/survival_pod.dmi'
	icon_state = "ntpod"

/obj/structure/sign/mining/survival
	name = "shelter sign"
	desc = "A high visibility sign designating a safe shelter."
	icon = 'maps/tether/icons/obj/survival_pod.dmi'
	icon_state = "survival"

/obj/structure/sign/nanotrasen
	icon = 'maps/tether/icons/obj/signs.dmi'
	name = "\improper NanoTrasen"
	desc = "An old metal sign which reads 'NanoTrasen'."
	icon_state = "NT"

/obj/structure/sign/nanotrasen/get_codex_value()
	var/decl/background_detail/faction/nano = GET_DECL(/decl/background_detail/faction/nanotrasen)
	var/decl/background_category/background_cat = GET_DECL(nano.category)
	return "[nano.name] ([lowertext(background_cat.name)])"

/obj/structure/sign/directions/elevator
	name = "\improper Elevator"
	icon = 'maps/tether/icons/obj/signs.dmi'
	icon_state = "direction_elv"