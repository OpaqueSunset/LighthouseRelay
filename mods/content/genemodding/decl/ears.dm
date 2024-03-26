/*
////////////////////////////
/  =--------------------=  /
/  == Ear Definitions  ==  /
/  =--------------------=  /
////////////////////////////
*/
/decl/sprite_accessory_category/ears
	name                  = "Ears"
	base_accessory_type   = /decl/sprite_accessory/ears
	default_accessory     = /decl/sprite_accessory/ears/none
	uid                   = "acc_cat_ears"

/decl/sprite_accessory/ears
	abstract_type = /decl/sprite_accessory/ears
	name = "You should not see this..."
	icon = 'mods/content/genemodding/icons/mob/ears.dmi'
	color_blend = ICON_MULTIPLY
	hidden_by_gear_slot = slot_head_str
	hidden_by_gear_flag = BLOCK_HEAD_HAIR
	accessory_category = SAC_EARS
	var/extra_overlay // Icon state of an additional overlay to blend in.

/decl/sprite_accessory/ears/get_cached_accessory_icon(obj/item/organ/external/organ, color = COLOR_WHITE, color_extra = null)
	ASSERT(istext(color) && (length(color) == 7 || length(color) == 9))
	if(!icon_state)
		return null
	LAZYINITLIST(cached_icons[organ.bodytype])
	LAZYINITLIST(cached_icons[organ.bodytype][organ.organ_tag])
	var/key = color
	if(extra_overlay && !isnull(color_blend) && color_extra)
		ASSERT(istext(color_extra) && (length(color_extra) == 7 || length(color_extra) == 9))
		key = "[key][color_extra]"
	var/icon/accessory_icon = cached_icons[organ.bodytype][organ.organ_tag][key]
	if(!accessory_icon)
		accessory_icon = icon(get_accessory_icon(organ), icon_state) // make a new one to avoid mutating the base
		if(!accessory_icon)
			cached_icons[organ.bodytype][organ.organ_tag][key] = null
			return null
		if(mask_to_bodypart)
			accessory_icon.Blend(get_limb_mask_for(organ.bodytype, organ.organ_tag), ICON_MULTIPLY)
		if(!isnull(color) && !isnull(color_blend))
			accessory_icon.Blend(color, color_blend)
		if(extra_overlay)
			var/icon/overlay = icon(icon, extra_overlay)
			if(!isnull(color_extra) && !isnull(color_blend))
				overlay.Blend(color_extra, color_blend)
			accessory_icon.Blend(overlay, ICON_OVERLAY)
		cached_icons[organ.bodytype][organ.organ_tag][key] = accessory_icon
	return accessory_icon

/decl/sprite_accessory/ears/none
	name           = "Normal Ears"
	icon_state     = "nothing"
	draw_accessory = FALSE
	grooming_flags = FALSE
	uid            = "acc_ears_nothing"
/decl/sprite_accessory/ears/bee
	name = "bee antennae"
	icon_state = "bee"
	color_blend = null
	uid = "acc_ears_bee"

/decl/sprite_accessory/ears/antennae
	name = "antennae, colorable"
	icon_state = "antennae"
	uid = "acc_ears_antennae"

/decl/sprite_accessory/ears/m_ipc_antenna_synth_horns_ADJ
	name = "Synth horns, plain"
	icon_state = "m_ipc_antenna_synth_horns_ADJ"
	extra_overlay = "m_ipc_antenna_synth_hornslight_ADJ"
	uid = "acc_ears_antenna_synth_horns_plain"

/decl/sprite_accessory/ears/m_ipc_antenna_synth_thick_ADJ
	name = "Synth horns, thick"
	icon_state = "m_ipc_antenna_synth_thick_ADJ"
	extra_overlay = "m_ipc_antenna_synth_thicklight_ADJ"
	uid = "acc_ears_antenna_synth_thick"

/decl/sprite_accessory/ears/m_ipc_antenna_synth_curled_ADJ
	name = "Synth horns, curly"
	icon_state = "m_ipc_antenna_synth_curled_ADJ"
	uid = "acc_ears_antenna_synth_curled"

/decl/sprite_accessory/ears/curly_bug
	name = "curly antennae, colorable"
	icon_state = "curly_bug"
	uid = "acc_ears_curly_bug"

/decl/sprite_accessory/ears/dual_robot
	name = "synth antennae, colorable"
	icon_state = "dual_robot_antennae"
	uid = "acc_ears_dual_robot_antennae"

/decl/sprite_accessory/ears/right_robot
	name = "right synth, colorable"
	icon_state = "right_robot_antennae"
	uid = "acc_ears_right_robot_antennae"

/decl/sprite_accessory/ears/left_robot
	name = "left synth, colorable"
	icon_state = "left_robot_antennae"
	uid = "acc_ears_left_robot_antennae"

/decl/sprite_accessory/ears/oni_h1_c
	name = "oni horns, colorable"
	icon_state = "oni-h1_c"
	uid = "acc_ears_oni_horns_colorable"

/decl/sprite_accessory/ears/demon_horns1_c
	name = "demon horns, colorable"
	icon_state = "demon-horns1_c"
	uid = "acc_ears_demon_horns_colorable"

/decl/sprite_accessory/ears/demon_horns2
	name = "demon horns, colorable(outward)"
	icon_state = "demon-horns2"
	uid = "acc_ears_outward_demon_horns_colorable"

/decl/sprite_accessory/ears/dragon_horns
	name = "dragon horns, colorable"
	icon_state = "dragon-horns"
	uid = "acc_ears_dragon_horns_colorable"

/decl/sprite_accessory/ears/foxears
	name = "highlander zorren ears"
	icon_state = "foxears"
	color_blend = null
	uid = "acc_ears_zorren_fox"

/decl/sprite_accessory/ears/fenears
	name = "flatland zorren ears"
	icon_state = "fenears"
	color_blend = null
	uid = "acc_ears_zorren_fennec"

/decl/sprite_accessory/ears/tajplain
	name = "Plain Tajaran Ears"
	icon_state = "ears_plain"
	uid = "acc_ears_taj_plain"

/decl/sprite_accessory/ears/foxearshc
	name = "highlander zorren ears, colorable"
	icon_state = "foxearshc"
	uid = "acc_ears_zorren_fox_colorable"

/decl/sprite_accessory/ears/fenearshc
	name = "flatland zorren ears, colorable"
	icon_state = "fenearshc"
	extra_overlay = "fenears-inner"
	uid = "acc_ears_zorren_fennec_colorable"

/decl/sprite_accessory/ears/sergalhc
	name = "Sergal ears, colorable"
	icon_state = "serg_plain"
	uid = "acc_ears_sergal_colorable"

/decl/sprite_accessory/ears/mousehc
	name = "mouse, colorable"
	icon_state = "mouse"
	extra_overlay = "mouseinner"
	uid = "acc_ears_mouse_colorable"

/decl/sprite_accessory/ears/mousehcno
	name = "mouse, colorable, no inner"
	icon_state = "mouse"
	uid = "acc_ears_mouse_colorable_no_inner"

/decl/sprite_accessory/ears/wolfhc
	name = "wolf, colorable"
	icon_state = "wolf"
	extra_overlay = "wolfinner"
	uid = "acc_ears_wolf_colorable"

/decl/sprite_accessory/ears/bearhc
	name = "bear, colorable"
	icon_state = "bear"
	uid = "acc_ears_bear_colorable"

/decl/sprite_accessory/ears/smallbear
	name = "small bear"
	icon_state = "smallbear"
	uid = "acc_ears_small_bear"

/decl/sprite_accessory/ears/squirrelhc
	name = "squirrel, colorable"
	icon_state = "squirrel"
	uid = "acc_ears_squirrel_colorable"

/decl/sprite_accessory/ears/kittyhc
	name = "kitty, colorable"
	icon_state = "kitty"
	extra_overlay = "kittyinner"
	uid = "acc_ears_kitty_colorable"

/decl/sprite_accessory/ears/tajhc
	name = "tajaran ears, colorable"
	icon_state = "taj"
	uid = "acc_ears_taj_colorable"

/decl/sprite_accessory/ears/bunnyhc
	name = "bunny, colorable"
	icon_state = "bunny"
	uid = "acc_ears_bunny_colorable"

/decl/sprite_accessory/ears/antlers
	name = "antlers"
	icon_state = "antlers"
	uid = "acc_ears_antlers_colorable"

/decl/sprite_accessory/ears/antlers_e
	name = "antlers with ears"
	icon_state = "cow-nohorns"
	extra_overlay = "antlers_mark"
	uid = "acc_ears_antlers_with_ears"

/decl/sprite_accessory/ears/smallantlers
	name = "small antlers"
	icon_state = "smallantlers"
	uid = "acc_ears_antlers_small"

/decl/sprite_accessory/ears/smallantlers_e
	name = "small antlers with ears"
	icon_state = "smallantlers"
	extra_overlay = "deer"
	uid = "acc_ears_antlers_small_with_ears"

/decl/sprite_accessory/ears/deer
	name = "deer ears"
	icon_state = "deer"
	uid = "acc_ears_deer"

/decl/sprite_accessory/ears/cow
	name = "cow, horns"
	icon_state = "cow"
	color_blend = null
	uid = "acc_ears_cow_horns"

/decl/sprite_accessory/ears/cowc
	name = "cow, horns, colorable"
	icon_state = "cow-c"
	uid = "acc_ears_cow_horns_colorable"

/decl/sprite_accessory/ears/cow_nohorns
	name = "cow, no horns"
	icon_state = "cow-nohorns"
	uid = "acc_ears_cow_no_horns"

/decl/sprite_accessory/ears/caprahorns
	name = "caprine horns"
	icon_state = "caprahorns"
	uid = "acc_ears_caprine_horns"

/decl/sprite_accessory/ears/otie
	name = "otie, colorable"
	icon_state = "otie"
	extra_overlay = "otie-inner"
	uid = "acc_ears_otie_colorable"

/decl/sprite_accessory/ears/zears
	name = "jagged ears"
	icon_state = "zears"
	uid = "acc_ears_jagged_ears"

/decl/sprite_accessory/ears/elfs
	name = "elven ears"
	icon_state = "elfs"
	uid = "acc_ears_elf"

/decl/sprite_accessory/ears/sleek
	name = "sleek ears"
	icon_state = "sleek"
	uid = "acc_ears_sleek"

/decl/sprite_accessory/ears/drake
	name = "drake frills"
	icon_state = "drake"
	uid = "acc_ears_drake_frills"

/decl/sprite_accessory/ears/vulp
	name = "vulpkanin, dual-color"
	icon_state = "vulp"
	extra_overlay = "vulp-inner"
	uid = "acc_ears_vulp_dual"

/decl/sprite_accessory/ears/bunny_floppy
	name = "floppy bunny ears (colorable)"
	icon_state = "floppy_bun"
	uid = "acc_ears_floppy_bunny"

/decl/sprite_accessory/ears/hyena
	name = "hyena, dual-color"
	icon_state = "hyena"
	extra_overlay = "hyena-inner"
	uid = "acc_ears_hyena_dual"

/decl/sprite_accessory/ears/moth
	name = "moth antennae"
	icon_state = "moth"
	uid = "acc_ears_moth_antennae"