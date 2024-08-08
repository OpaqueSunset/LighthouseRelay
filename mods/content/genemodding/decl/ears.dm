/*
////////////////////////////
/  =--------------------=  /
/  == Ear Definitions  ==  /
/  =--------------------=  /
////////////////////////////
*/
/decl/sprite_accessory/ears
	icon = 'mods/content/genemodding/icons/mob/ears.dmi'

/decl/sprite_accessory/ears/bee
	name = "bee antennae"
	icon_state = "bee"
	color_blend = null
	uid = "acc_ears_bee"

/decl/sprite_accessory/ears/antennae
	name = "antennae, colorable"
	icon_state = "antennae"
	accessory_metadata_types = list(SAM_COLOR)
	uid = "acc_ears_antennae"

/decl/sprite_accessory/ears/m_ipc_antenna_synth_horns_ADJ
	name = "Synth horns, plain"
	icon_state = "m_ipc_antenna_synth_horns_ADJ"
	accessory_metadata_types = list(SAM_COLOR, SAM_COLOR_INNER)
	uid = "acc_ears_antenna_synth_horns_plain"

/decl/sprite_accessory/ears/m_ipc_antenna_synth_thick_ADJ
	name = "Synth horns, thick"
	icon_state = "m_ipc_antenna_synth_thick_ADJ"
	accessory_metadata_types = list(SAM_COLOR, SAM_COLOR_INNER)
	uid = "acc_ears_antenna_synth_thick"

/decl/sprite_accessory/ears/m_ipc_antenna_synth_curled_ADJ
	name = "Synth horns, curly"
	icon_state = "m_ipc_antenna_synth_curled_ADJ"
	accessory_metadata_types = list(SAM_COLOR)
	uid = "acc_ears_antenna_synth_curled"

/decl/sprite_accessory/ears/curly_bug
	name = "curly antennae, colorable"
	icon_state = "curly_bug"
	accessory_metadata_types = list(SAM_COLOR)
	uid = "acc_ears_curly_bug"

/decl/sprite_accessory/ears/dual_robot
	name = "synth antennae, colorable"
	icon_state = "dual_robot_antennae"
	accessory_metadata_types = list(SAM_COLOR)
	uid = "acc_ears_dual_robot_antennae"

/decl/sprite_accessory/ears/right_robot
	name = "right synth, colorable"
	icon_state = "right_robot_antennae"
	accessory_metadata_types = list(SAM_COLOR)
	uid = "acc_ears_right_robot_antennae"

/decl/sprite_accessory/ears/left_robot
	name = "left synth, colorable"
	icon_state = "left_robot_antennae"
	accessory_metadata_types = list(SAM_COLOR)
	uid = "acc_ears_left_robot_antennae"

/decl/sprite_accessory/ears/oni_h1_c
	name = "oni horns, colorable"
	icon_state = "oni-h1_c"
	accessory_metadata_types = list(SAM_COLOR)
	uid = "acc_ears_oni_horns_colorable"

/decl/sprite_accessory/ears/demon_horns1_c
	name = "demon horns, colorable"
	icon_state = "demon-horns1_c"
	accessory_metadata_types = list(SAM_COLOR)
	uid = "acc_ears_demon_horns_colorable"

/decl/sprite_accessory/ears/demon_horns2
	name = "demon horns, colorable(outward)"
	icon_state = "demon-horns2"
	accessory_metadata_types = list(SAM_COLOR)
	uid = "acc_ears_outward_demon_horns_colorable"

/decl/sprite_accessory/ears/dragon_horns
	name = "dragon horns, colorable"
	icon_state = "dragon-horns"
	accessory_metadata_types = list(SAM_COLOR)
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
	accessory_metadata_types = list(SAM_COLOR)
	uid = "acc_ears_taj_plain"

/decl/sprite_accessory/ears/foxearshc
	name = "highlander zorren ears, colorable"
	icon_state = "foxearshc"
	accessory_metadata_types = list(SAM_COLOR)
	uid = "acc_ears_zorren_fox_colorable"

/decl/sprite_accessory/ears/fenearshc
	name = "flatland zorren ears, colorable"
	icon_state = "fenearshc"
	accessory_metadata_types = list(SAM_COLOR, SAM_COLOR_INNER)
	uid = "acc_ears_zorren_fennec_colorable"

/decl/sprite_accessory/ears/sergalhc
	name = "Sergal ears, colorable"
	icon_state = "serg_plain"
	accessory_metadata_types = list(SAM_COLOR)
	uid = "acc_ears_sergal_colorable"

/decl/sprite_accessory/ears/mousehc
	name = "mouse, colorable"
	icon_state = "mouse"
	accessory_metadata_types = list(SAM_COLOR, SAM_COLOR_INNER)
	uid = "acc_ears_mouse_colorable"

/decl/sprite_accessory/ears/mousehcno
	name = "mouse, colorable, no inner"
	icon_state = "mouse"
	accessory_metadata_types = list(SAM_COLOR)
	uid = "acc_ears_mouse_colorable_no_inner"

/decl/sprite_accessory/ears/wolfhc
	name = "wolf, colorable"
	icon_state = "wolf"
	accessory_metadata_types = list(SAM_COLOR, SAM_COLOR_INNER)
	uid = "acc_ears_wolf_colorable"

/decl/sprite_accessory/ears/bearhc
	name = "bear, colorable"
	icon_state = "bear"
	accessory_metadata_types = list(SAM_COLOR)
	uid = "acc_ears_bear_colorable"

/decl/sprite_accessory/ears/smallbear
	name = "small bear"
	icon_state = "smallbear"
	accessory_metadata_types = list(SAM_COLOR)
	uid = "acc_ears_small_bear"

/decl/sprite_accessory/ears/squirrelhc
	name = "squirrel, colorable"
	icon_state = "squirrel"
	accessory_metadata_types = list(SAM_COLOR)
	uid = "acc_ears_squirrel_colorable"

/decl/sprite_accessory/ears/kittyhc
	name = "kitty, colorable"
	icon_state = "kitty"
	accessory_metadata_types = list(SAM_COLOR, SAM_COLOR_INNER)
	uid = "acc_ears_kitty_colorable"

/decl/sprite_accessory/ears/tajhc
	name = "tajaran ears, colorable"
	icon_state = "taj"
	accessory_metadata_types = list(SAM_COLOR)
	uid = "acc_ears_taj_colorable"

/decl/sprite_accessory/ears/bunnyhc
	name = "bunny, colorable"
	icon_state = "bunny"
	accessory_metadata_types = list(SAM_COLOR)
	uid = "acc_ears_bunny_colorable"

/decl/sprite_accessory/ears/antlers
	name = "antlers"
	icon_state = "antlers"
	accessory_metadata_types = list(SAM_COLOR)
	uid = "acc_ears_antlers_colorable"

/decl/sprite_accessory/ears/antlers_e
	name = "antlers with ears"
	icon_state = "antlers-with-ears"
	accessory_metadata_types = list(SAM_COLOR, SAM_COLOR_INNER)
	uid = "acc_ears_antlers_with_ears"

/decl/sprite_accessory/ears/smallantlers
	name = "small antlers"
	icon_state = "smallantlers"
	accessory_metadata_types = list(SAM_COLOR)
	uid = "acc_ears_antlers_small"

/decl/sprite_accessory/ears/smallantlers_e
	name = "small antlers with ears"
	icon_state = "smallantlers"
	accessory_metadata_types = list(SAM_COLOR, SAM_COLOR_INNER)
	uid = "acc_ears_antlers_small_with_ears"

/decl/sprite_accessory/ears/deer
	name = "deer ears"
	icon_state = "deer"
	accessory_metadata_types = list(SAM_COLOR)
	uid = "acc_ears_deer"

/decl/sprite_accessory/ears/cow
	name = "cow, horns"
	icon_state = "cow"
	color_blend = null
	uid = "acc_ears_cow_horns"

/decl/sprite_accessory/ears/cowc
	name = "cow, horns, colorable"
	icon_state = "cow-c"
	accessory_metadata_types = list(SAM_COLOR)
	uid = "acc_ears_cow_horns_colorable"

/decl/sprite_accessory/ears/cow_nohorns
	name = "cow, no horns"
	icon_state = "cow-nohorns"
	accessory_metadata_types = list(SAM_COLOR)
	uid = "acc_ears_cow_no_horns"

/decl/sprite_accessory/ears/caprahorns
	name = "caprine horns, colorable"
	icon_state = "caprahorns"
	accessory_metadata_types = list(SAM_COLOR)
	uid = "acc_ears_caprine_horns"

/decl/sprite_accessory/ears/otie
	name = "otie, colorable"
	icon_state = "otie"
	accessory_metadata_types = list(SAM_COLOR, SAM_COLOR_INNER)
	uid = "acc_ears_otie_colorable"

/decl/sprite_accessory/ears/zears
	name = "jagged ears"
	icon_state = "zears"
	accessory_metadata_types = list(SAM_COLOR)
	uid = "acc_ears_jagged_ears"

/decl/sprite_accessory/ears/elfs
	name = "elven ears"
	icon_state = "elfs"
	accessory_metadata_types = list(SAM_COLOR)
	uid = "acc_ears_elf"

/decl/sprite_accessory/ears/sleek
	name = "sleek ears"
	icon_state = "sleek"
	accessory_metadata_types = list(SAM_COLOR)
	uid = "acc_ears_sleek"

/decl/sprite_accessory/ears/drake
	name = "drake frills"
	icon_state = "drake"
	accessory_metadata_types = list(SAM_COLOR)
	uid = "acc_ears_drake_frills"

/decl/sprite_accessory/ears/vulp
	name = "vulpkanin, dual-color"
	icon_state = "vulp"
	accessory_metadata_types = list(SAM_COLOR, SAM_COLOR_INNER)
	uid = "acc_ears_vulp_dual"

/decl/sprite_accessory/ears/bunny_floppy
	name = "floppy bunny ears (colorable)"
	icon_state = "floppy_bun"
	accessory_metadata_types = list(SAM_COLOR)
	uid = "acc_ears_floppy_bunny"

/decl/sprite_accessory/ears/hyena
	name = "hyena, dual-color"
	icon_state = "hyena"
	accessory_metadata_types = list(SAM_COLOR, SAM_COLOR_INNER)
	uid = "acc_ears_hyena_dual"

/decl/sprite_accessory/ears/moth
	name = "moth antennae"
	icon_state = "moth"
	accessory_metadata_types = list(SAM_COLOR)
	uid = "acc_ears_moth_antennae"