/obj/effect/fusion_particle_catcher
	icon = 'icons/effects/effects.dmi'
	density = TRUE
	anchored = TRUE
	invisibility = INVISIBILITY_ABSTRACT
	light_color = COLOR_BLUE
	is_spawnable_type = FALSE // invalid without parent passed

	var/obj/effect/fusion_em_field/parent
	var/mysize = 0

/obj/effect/fusion_particle_catcher/Destroy()
	. =..()
	parent.particle_catchers -= src
	parent = null

/obj/effect/fusion_particle_catcher/proc/SetSize(var/newsize)
	name = "collector [newsize]"
	mysize = newsize
	UpdateSize()

/obj/effect/fusion_particle_catcher/proc/AddParticles(var/name, var/quantity = 1)
	if(parent && parent.size >= mysize)
		parent.AddParticles(name, quantity)
		return 1
	return 0

/obj/effect/fusion_particle_catcher/proc/UpdateSize()
	if(parent.size >= mysize)
		set_density(1)
		SetName("collector [mysize] ON")
	else
		set_density(0)
		SetName("collector [mysize] OFF")

/obj/effect/fusion_particle_catcher/bullet_act(var/obj/item/projectile/Proj)
	parent.AddEnergy(parent.plasma_temperature < 1000 ? Proj.damage * 20 : Proj.damage) // quick and dirty hack to get the field up to power faster
	update_icon()
	return 0

/obj/effect/fusion_particle_catcher/CanPass(var/atom/movable/mover, var/turf/target, var/height=0, var/air_group=0)
	return !density || (!istype(mover, /obj/item/projectile) && !istype(mover, /obj/effect/accelerated_particle))

/obj/effect/fusion_particle_catcher/CanFluidPass(var/coming_from)
	return TRUE
