///////////
// Foods //
///////////
//Subtypes of /obj/item/food are food items that people consume whole. The key points are that they are created
//	already filled with reagents and are destroyed when empty. Additionally, they make a "munching" noise when eaten.

//Food can hold a maximum of 50 units Generally speaking, you don't want to go over 40
//	total for the item because you want to leave space for extra condiments. If you want an effect, add a reagent for
//	it. Try to stick to existing reagents when possible (so if you want a stronger healing effect, just use regenerative serum).

/obj/item/food
	name = "snack"
	desc = "Yummy!"
	icon = 'icons/obj/food.dmi'
	icon_state = null
	randpixel = 6
	item_flags = null
	material = /decl/material/liquid/nutriment
	center_of_mass = @'{"x":16,"y":16}'
	w_class = ITEM_SIZE_SMALL
	abstract_type = /obj/item/food
	needs_attack_dexterity = DEXTERITY_NONE

	/// The maximum reagent volume of this food. Used in initialize_reagents.
	var/volume = 50
	/// Indicates the food should give a stress effect on eating.
	// This is set to 1 if the food is created by a recipe, -1 if the food is raw.
	var/cooked_food = FOOD_PREPARED
	var/bitesize = 1
	var/bitecount = 0
	var/slice_path
	var/slice_num
	var/dry = FALSE
	var/nutriment_amt = 0
	var/nutriment_type = /decl/material/liquid/nutriment // Used to determine which base nutriment type is spawned for this item.
	// List of flavours and flavour strengths.
	// The flavour strength text is determined by the ratio of flavour strengths in the snack.
	var/list/nutriment_desc
	var/list/eat_sound = 'sound/items/eatfood.ogg'
	var/filling_color = "#ffffff" //Used by sandwiches.
	var/trash
	var/obj/item/plate/plate
	var/list/attack_products //Items you can craft together. Like bomb making, but with food and less screwdrivers.
	// Uses format list(ingredient = result_type). The ingredient can be a typepath or a grown_tag string (used for plants)
	var/batter_coating = null // coating typepath, NOT decl instance
	var/do_coating_prefix = TRUE ///If 0, we wont do "battered thing" or similar prefixes. Mainly for recipes that include batter but have a special name
	/**
	 * Used for foods that are "cooked" without being made into a specific recipe or combination.
	 * Generally applied during modification cooking with oven/fryer.
	 * Used to stop deep-fried meat from looking like slightly tanned raw meat, and make it actually look cooked.
	 */
	var/cooked_icon = null
	/// A type used when cloning this food item for utensils.
	var/utensil_food_type
	/// A set of utensil flags determining which utensil interactions are valid with this food.
	var/utensil_flags = UTENSIL_FLAG_SCOOP | UTENSIL_FLAG_COLLECT


//Code for dipping food in batter
/**
 * Perform checks, then apply any applicable coatings.
 *
 * @param dip /obj The object to attempt to dip src into.
 * @param user /mob The mob attempting to dip src into dip.
 *
 * @return TRUE if coating applied, FALSE otherwise
 */
/obj/item/food/proc/attempt_apply_coating(var/obj/dip, var/mob/user)
	if(!dip || !ATOM_IS_OPEN_CONTAINER(dip) || istype(dip, /obj/item/food) || !Adjacent(user))
		return
	for (var/reagent_type in dip.reagents?.reagent_volumes)
		if(!ispath(reagent_type, /decl/material/liquid/nutriment/batter))
			continue
		return apply_coating(dip.reagents, reagent_type, user)

//This proc handles drawing coatings out of a container when this food is dipped into it
/obj/item/food/proc/apply_coating(var/datum/reagents/holder, var/applied_coating, var/mob/user)
	if (batter_coating)
		var/decl/material/coating_reagent = GET_DECL(batter_coating)
		to_chat(user, "[src] is already coated in [coating_reagent.name]!")
		return FALSE

	var/decl/material/liquid/nutriment/batter/applied_coating_reagent = GET_DECL(applied_coating)

	//Calculate the reagents of the coating needed
	var/req = 0
	for (var/r in reagents.reagent_volumes)
		if (ispath(r, /decl/material/liquid/nutriment))
			req += reagents.reagent_volumes[r] * 0.2
		else
			req += reagents.reagent_volumes[r] * 0.1

	req += w_class*0.5

	if (!req)
		//the food has no reagents left, it's probably getting deleted soon
		return FALSE

	if (holder.reagent_volumes[applied_coating] < req)
		to_chat(user, SPAN_WARNING("There's not enough [applied_coating_reagent.name] to coat [src]!"))
		return FALSE

	//First make sure there's space for our batter
	if (REAGENTS_FREE_SPACE(reagents) < req+5)
		var/extra = req+5 - REAGENTS_FREE_SPACE(reagents)
		reagents.maximum_volume += extra

	//Suck the coating out of the holder
	holder.trans_to_holder(reagents, req)

	if (!REAGENT_VOLUME(reagents, applied_coating))
		return

	batter_coating = applied_coating
	var/icon/I = icon(icon, icon_state, dir)
	color = "#ffffff" //Some fruits use the color var. Reset this so it doesnt tint the batter
	I.Blend(new /icon('icons/obj/food_custom.dmi', rgb(255,255,255)),ICON_ADD)
	I.Blend(new /icon('icons/obj/food_custom.dmi', applied_coating_reagent.icon_raw),ICON_MULTIPLY)
	var/image/J = image(I)
	J.alpha = 200
	J.blend_mode = BLEND_OVERLAY
	add_overlay(J)

	if (user)
		user.visible_message(SPAN_NOTICE("[user] dips [src] into \the [applied_coating_reagent.name]"), SPAN_NOTICE("You dip [src] into \the [applied_coating_reagent.name]"))

	return TRUE

//Called by cooking machines. This is mainly intended to set properties on the food that differ between raw/cooked
/obj/item/food/proc/cook()
	cooked_food = FOOD_COOKED
	if (batter_coating)
		cut_overlays()
		var/decl/material/liquid/nutriment/batter/our_coating = GET_DECL(batter_coating)
		var/icon/I = icon(icon, icon_state, dir)
		color = COLOR_WHITE //Some fruits use the color var
		I.Blend(new /icon('icons/obj/food_custom.dmi', rgb(255,255,255)),ICON_ADD)
		I.Blend(new /icon('icons/obj/food_custom.dmi', our_coating.icon_cooked),ICON_MULTIPLY)
		var/image/J = image(I)
		J.alpha = 200
		add_overlay(J)

		if (do_coating_prefix)
			SetName("[our_coating.coated_adj] [name]")

	for (var/r in reagents.reagent_volumes)
		if (ispath(r, /decl/material/liquid/nutriment/batter))
			LAZYINITLIST(reagents.reagent_data)
			LAZYSET(reagents.reagent_data[r], "cooked", TRUE)

/obj/item/food/populate_reagents()
	. = ..()
	for(var/reagent_type in reagents.reagent_volumes)
		if(ispath(reagent_type, /decl/material/liquid/nutriment/batter))
			LAZYINITLIST(reagents.reagent_data)
			// add a new reagent_data entry for each reagent type
			LAZYSET(reagents.reagent_data[reagent_type], "cooked", TRUE) // batter starts cooked in compile-time foods

/obj/item/food/Initialize(ml, material_key, skip_plate = FALSE)
	. = ..()
	if(cooked_food == FOOD_RAW)
		name = "raw [name]"

	if(skip_plate)
		plate = null
	else if(ispath(plate))
		plate = new plate(src)
	else if(!istype(plate))
		plate = null

	initialize_reagents()
	if(isnull(utensil_food_type))
		utensil_food_type = type
	if(slice_path && slice_num)
		utensil_flags |= UTENSIL_FLAG_SLICE

/obj/item/food/initialize_reagents(populate = TRUE)
	if(!reagents)
		create_reagents(volume)
	else
		reagents.maximum_volume = max(reagents.maximum_volume, volume)
	return ..()

/obj/item/chems/on_reagent_change()
	if((. = ..()))
		update_icon()

/obj/item/food/can_be_injected_by(var/atom/injector)
	return TRUE

// Does not rely on ATOM_IS_OPEN_CONTAINER because we want to be able to pour in but not out.
/obj/item/food/can_be_poured_into(atom/source)
	return (reagents?.maximum_volume > 0)

/obj/item/food/attack_self(mob/user)
	if(is_edible(user) && handle_eaten_by_mob(user, user) != EATEN_INVALID)
		return TRUE
	return ..()

/obj/item/food/dragged_onto(var/mob/user)
	return attack_self(user)

/obj/item/food/examine(mob/user, distance)
	. = ..()

	if(distance > 1)
		return

	if(backyard_grilling_rawness > 0 && backyard_grilling_rawness != initial(backyard_grilling_rawness))
		to_chat(user, "\The [src] is [get_backyard_grilling_text()].")

	if(plate)
		to_chat(user, SPAN_NOTICE("\The [src] has been arranged on \a [plate]."))

	if (bitecount==0)
		return
	else if (bitecount==1)
		to_chat(user, SPAN_NOTICE("\The [src] was bitten by someone!"))
	else if (bitecount<=3)
		to_chat(user, SPAN_NOTICE("\The [src] was bitten [bitecount] time\s!"))
	else
		to_chat(user, SPAN_NOTICE("\The [src] was bitten multiple times!"))

/obj/item/food/proc/is_sliceable()
	return (slice_num && slice_path && slice_num > 0)

/obj/item/food/proc/drop_plate(var/drop_loc)
	if(istype(plate))
		plate.dropInto(drop_loc || loc)
		plate.make_dirty(src)
	plate = null

/obj/item/food/physically_destroyed()
	drop_plate()
	return ..()

/obj/item/food/Destroy()
	QDEL_NULL(plate)
	trash = null
	if(contents)
		for(var/atom/movable/something in contents)
			something.dropInto(loc)
	. = ..()

/obj/item/food/proc/update_food_appearance_from(var/obj/item/donor, var/food_color, var/copy_donor_appearance = TRUE)
	filling_color = food_color
	if(copy_donor_appearance)
		appearance = donor
		color = food_color
		if(istype(donor, /obj/item/holder))
			var/matrix/M = matrix()
			M.Turn(90)
			M.Translate(1,-6)
			transform = M
	update_icon()

/obj/item/food/on_update_icon()
	underlays.Cut()
	. = ..()
	//Since other things that don't have filling override this, slap it into its own proc to avoid the overhead of scanning through the icon file
	apply_filling_overlay() //#TODO: Maybe generalise food item icons.
	// If we have a plate, add it to our icon.
	if(plate)
		var/image/I = new
		I.appearance = plate
		I.layer = FLOAT_LAYER
		I.plane = FLOAT_PLANE
		I.pixel_x = 0
		I.pixel_y = 0
		I.pixel_z = 0
		I.pixel_w = 0
		I.appearance_flags |= RESET_TRANSFORM|RESET_COLOR
		underlays += list(I)

/obj/item/food/proc/apply_filling_overlay()
	if(check_state_in_icon("[icon_state]_filling", icon))
		add_overlay(overlay_image(icon, "[icon_state]_filling", filling_color))

//Since we automatically create some reagents types for the nutriments, make sure we call this proc when overriding it
/obj/item/food/populate_reagents()
	. = ..()
	SHOULD_CALL_PARENT(TRUE)
	if(nutriment_amt && nutriment_type)
		// Ensure our taste data is in the expected format.
		if(nutriment_desc)
			if(!islist(nutriment_desc))
				nutriment_desc = list(nutriment_desc)
			for(var/taste in nutriment_desc)
				if(nutriment_desc[taste] <= 0)
					nutriment_desc[taste] = 1
		add_to_reagents(nutriment_type, nutriment_amt, get_nutriment_data())

/obj/item/food/proc/get_nutriment_data()
	if(nutriment_desc)
		return list("taste" = nutriment_desc)

/obj/item/food/proc/set_nutriment_data(list/newdata)
	if(reagents?.total_volume && reagents.has_reagent(nutriment_type, 1))
		LAZYINITLIST(reagents.reagent_data)
		reagents.reagent_data[nutriment_type] = newdata
