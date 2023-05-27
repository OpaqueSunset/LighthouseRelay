/*
////////////////////////////
/  =--------------------=  /
/  == Ear Definitions  ==  /
/  =--------------------=  /
////////////////////////////
*/

/decl/sprite_accessory/ears
	name = "You should not see this..."
	icon = 'mods/content/genemodding/icons/mob/ears.dmi'
	do_colouration = TRUE // Set to 1 to blend (ICON_ADD) hair color
	blend = ICON_MULTIPLY // Only appliciable if do_colouration = TRUE
	var/extra_overlay // Icon state of an additional overlay to blend in.

/decl/sprite_accessory/ears/bee
	name = "bee antennae"
	icon_state = "bee"
	do_colouration = FALSE

/decl/sprite_accessory/ears/antennae
	name = "antennae, colorable"
	icon_state = "antennae"

/decl/sprite_accessory/ears/m_ipc_antenna_synth_horns_ADJ
	name = "Synth horns, plain"
	icon_state = "m_ipc_antenna_synth_horns_ADJ"
	extra_overlay = "m_ipc_antenna_synth_hornslight_ADJ"

/decl/sprite_accessory/ears/m_ipc_antenna_synth_thick_ADJ
	name = "Synth horns, thick"
	icon_state = "m_ipc_antenna_synth_thick_ADJ"
	extra_overlay = "m_ipc_antenna_synth_thicklight_ADJ"

/decl/sprite_accessory/ears/m_ipc_antenna_synth_curled_ADJ
	name = "Synth horns, curly"
	icon_state = "m_ipc_antenna_synth_curled_ADJ"

/decl/sprite_accessory/ears/curly_bug
	name = "curly antennae, colorable"
	icon_state = "curly_bug"

/decl/sprite_accessory/ears/dual_robot
	name = "synth antennae, colorable"
	icon_state = "dual_robot_antennae"

/decl/sprite_accessory/ears/right_robot
	name = "right synth, colorable"
	icon_state = "right_robot_antennae"

/decl/sprite_accessory/ears/left_robot
	name = "left synth, colorable"
	icon_state = "left_robot_antennae"

/decl/sprite_accessory/ears/oni_h1_c
	name = "oni horns, colorable"
	icon_state = "oni-h1_c"

/decl/sprite_accessory/ears/demon_horns1_c
	name = "demon horns, colorable"
	icon_state = "demon-horns1_c"

/decl/sprite_accessory/ears/demon_horns2
	name = "demon horns, colorable(outward)"
	icon_state = "demon-horns2"

/decl/sprite_accessory/ears/dragon_horns
	name = "dragon horns, colorable"
	icon_state = "dragon-horns"

/decl/sprite_accessory/ears/foxears
	name = "highlander zorren ears"
	icon_state = "foxears"
	do_colouration = FALSE

/decl/sprite_accessory/ears/fenears
	name = "flatland zorren ears"
	icon_state = "fenears"
	do_colouration = FALSE

/decl/sprite_accessory/ears/tajplain
	name = "Plain Tajaran Ears"
	icon_state = "ears_plain"

/decl/sprite_accessory/ears/foxearshc
	name = "highlander zorren ears, colorable"
	icon_state = "foxearshc"

/decl/sprite_accessory/ears/fenearshc
	name = "flatland zorren ears, colorable"
	icon_state = "fenearshc"
	extra_overlay = "fenears-inner"

/decl/sprite_accessory/ears/sergalhc
	name = "Sergal ears, colorable"
	icon_state = "serg_plain_s"

/decl/sprite_accessory/ears/mousehc
	name = "mouse, colorable"
	icon_state = "mouse"
	extra_overlay = "mouseinner"

/decl/sprite_accessory/ears/mousehcno
	name = "mouse, colorable, no inner"
	icon_state = "mouse"

/decl/sprite_accessory/ears/wolfhc
	name = "wolf, colorable"
	icon_state = "wolf"
	extra_overlay = "wolfinner"

/decl/sprite_accessory/ears/bearhc
	name = "bear, colorable"
	icon_state = "bear"

/decl/sprite_accessory/ears/smallbear
	name = "small bear"
	icon_state = "smallbear"

/decl/sprite_accessory/ears/squirrelhc
	name = "squirrel, colorable"
	icon_state = "squirrel"

/decl/sprite_accessory/ears/kittyhc
	name = "kitty, colorable"
	icon_state = "kitty"
	extra_overlay = "kittyinner"

/decl/sprite_accessory/ears/tajhc
	name = "tajaran ears, colorable"
	icon_state = "taj"

/decl/sprite_accessory/ears/bunnyhc
	name = "bunny, colorable"
	icon_state = "bunny"

/decl/sprite_accessory/ears/antlers
	name = "antlers"
	icon_state = "antlers"

/decl/sprite_accessory/ears/antlers_e
	name = "antlers with ears"
	icon_state = "cow-nohorns"
	extra_overlay = "antlers_mark"

/decl/sprite_accessory/ears/smallantlers
	name = "small antlers"
	icon_state = "smallantlers"

/decl/sprite_accessory/ears/smallantlers_e
	name = "small antlers with ears"
	icon_state = "smallantlers"
	extra_overlay = "deer"

/decl/sprite_accessory/ears/deer
	name = "deer ears"
	icon_state = "deer"

/decl/sprite_accessory/ears/cow
	name = "cow, horns"
	icon_state = "cow"
	do_colouration = FALSE

/decl/sprite_accessory/ears/cowc
	name = "cow, horns, colorable"
	icon_state = "cow-c"

/decl/sprite_accessory/ears/cow_nohorns
	name = "cow, no horns"
	icon_state = "cow-nohorns"

/decl/sprite_accessory/ears/caprahorns
	name = "caprine horns"
	icon_state = "caprahorns"

/decl/sprite_accessory/ears/otie
	name = "otie, colorable"
	icon_state = "otie"
	extra_overlay = "otie-inner"

/decl/sprite_accessory/ears/zears
	name = "jagged ears"
	icon_state = "zears"

/decl/sprite_accessory/ears/elfs
	name = "elven ears"
	icon_state = "elfs"

/decl/sprite_accessory/ears/sleek
	name = "sleek ears"
	icon_state = "sleek"

/decl/sprite_accessory/ears/drake
	name = "drake frills"
	icon_state = "drake"

/decl/sprite_accessory/ears/vulp
	name = "vulpkanin, dual-color"
	icon_state = "vulp"
	extra_overlay = "vulp-inner"

/decl/sprite_accessory/ears/bunny_floppy
	name = "floppy bunny ears (colorable)"
	icon_state = "floppy_bun"

/decl/sprite_accessory/ears/hyena
	name = "hyena, dual-color"
	icon_state = "hyena"
	extra_overlay = "hyena-inner"

/decl/sprite_accessory/ears/moth
	name = "moth antennae"
	icon_state = "moth"