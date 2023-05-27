/*
////////////////////////////
/  =--------------------=  /
/  == Tail Definitions ==  /
/  =--------------------=  /
////////////////////////////
*/

/decl/sprite_accessory/tail
	name = "You should not see this..."
	icon = 'mods/content/genemodding/icons/mob/tails.dmi'
	do_colouration = TRUE //Set to 1 to enable coloration using the tail color.

	blend = ICON_MULTIPLY // Only appliciable if do_coloration = 1
	var/extra_overlay // Icon state of an additional overlay to blend in.

/decl/sprite_accessory/tail/invisible
	name = "hide species-sprite tail"
	icon = null
	icon_state = null

/decl/sprite_accessory/tail/squirrel
	name = "squirrel, colorable"
	icon_state = "squirrel"

/decl/sprite_accessory/tail/kitty
	name = "kitty, colorable, downwards"
	icon_state = "kittydown"

/decl/sprite_accessory/tail/kittyup
	name = "kitty, colorable, upwards"
	icon_state = "kittyup"

/decl/sprite_accessory/tail/tiger_white
	name = "tiger, colorable"
	icon_state = "tiger"
	extra_overlay = "inner"

/decl/sprite_accessory/tail/stripey
	name = "stripey taj, colorable"
	icon_state = "stripeytail"
	extra_overlay = "mark"

/decl/sprite_accessory/tail/chameleon
	name = "Chameleon, colorable"
	icon_state = "chameleon"

/decl/sprite_accessory/tail/bunny
	name = "bunny, colorable"
	icon_state = "bunny"
	do_colouration = TRUE
	blend = ICON_ADD

/decl/sprite_accessory/tail/bear
	name = "bear, colorable"
	icon_state = "bear"

/decl/sprite_accessory/tail/dragon
	name = "dragon, colorable"
	icon_state = "dragon"

/decl/sprite_accessory/tail/wolf
	name = "wolf, colorable"
	icon_state = "wolf"
	extra_overlay = "inner"

/decl/sprite_accessory/tail/mouse
	name = "mouse, colorable"
	icon_state = "mouse"

/decl/sprite_accessory/tail/horse
	name = "horse tail, colorable"
	icon_state = "horse"

/decl/sprite_accessory/tail/cow
	name = "cow tail, colorable"
	icon_state = "cow"

/decl/sprite_accessory/tail/fantail
	name = "avian fantail, colorable"
	icon_state = "fantail"

/decl/sprite_accessory/tail/wagtail
	name = "avian wagtail, colorable"
	icon_state = "wagtail"

/decl/sprite_accessory/tail/crossfox
	name = "cross fox"
	icon_state = "crossfox"
	do_colouration = FALSE

/decl/sprite_accessory/tail/doublekitsune
	name = "double kitsune tail, colorable"
	icon_state = "doublekitsune"

/decl/sprite_accessory/tail/spade_color
	name = "spade-tail (colorable)"
	icon_state = "spadetail-black"
	blend = ICON_ADD

/decl/sprite_accessory/tail/eboop
	name = "EGN mech tail (dual color)"
	icon_state = "eboop"
	extra_overlay = "mark"

/decl/sprite_accessory/tail/ringtail
	name = "ringtail, colorable"
	icon_state = "ringtail"
	extra_overlay = "mark"

/decl/sprite_accessory/tail/satyr
	name = "goat legs, colorable"
	icon_state = "satyr"

/decl/sprite_accessory/tail/curltail
	name = "curltail (vwag)"
	icon_state = "curltail"
	extra_overlay = "mark"

/decl/sprite_accessory/tail/shorttail
	name = "shorttail (vwag)"
	icon_state = "straighttail"

/decl/sprite_accessory/tail/sneptail
	name = "Snep/Furry Tail (vwag)"
	icon_state = "sneptail"
	extra_overlay = "mark"

/decl/sprite_accessory/tail/tiger_new
	name = "tiger tail (vwag)"
	icon_state = "tigertail"
	extra_overlay = "mark"

/decl/sprite_accessory/tail/vulp_new
	name = "new vulp tail (vwag)"
	icon_state = "vulptail"
	extra_overlay = "mark"

/decl/sprite_accessory/tail/ztail
	name = "jagged flufftail"
	icon_state = "ztail"

/decl/sprite_accessory/tail/snaketail
	name = "snake tail, colorable"
	icon_state = "snaketail"

/decl/sprite_accessory/tail/vulpan_alt
	name = "vulpkanin alt style, colorable"
	icon_state = "vulptail_alt"

/decl/sprite_accessory/tail/sergaltaildc
	name = "sergal, dual-color"
	icon_state = "sergal"
	extra_overlay = "mark"

/decl/sprite_accessory/tail/skunktail
	name = "skunk, dual-color"
	icon_state = "skunktail"
	extra_overlay = "mark"

/decl/sprite_accessory/tail/deertail
	name = "deer, dual-color"
	icon_state = "deertail"
	extra_overlay = "mark"

/decl/sprite_accessory/tail/tajanim
	name = "animated tajaran tail"
	icon_state = "tajtail_loop1"

/decl/sprite_accessory/tail/tail_smooth
	name = "Smooth Lizard Tail, Colorable"
	icon_state = "tail_smooth"

/decl/sprite_accessory/tail/tripplekitsune_colorable_yw
	name = "Kitsune 3 tails - colorable"
	icon_state = "triplekitsune"
	extra_overlay = "tips"

/decl/sprite_accessory/tail/lizard_tail_smooth
	name = "Lizard Tail (Smooth)"
	icon_state = "lizard_tail_smooth"

/decl/sprite_accessory/tail/lizard_tail_dark_tiger
	name = "Lizard Tail (Dark Tiger)"
	icon_state = "lizard_tail_dark_tiger"

/decl/sprite_accessory/tail/lizard_tail_light_tiger
	name = "Lizard Tail (Light Tiger)"
	icon_state = "lizard_tail_light_tiger"

/decl/sprite_accessory/tail/lizard_tail_spiked
	name = "Lizard Tail (Spiked)"
	icon_state = "lizard_tail_spiked"

/decl/sprite_accessory/tail/wolf_tail
	name = "Wolf Tail"
	icon_state = "wolf_tail"

/decl/sprite_accessory/tail/ninekitsune_colorable_yw
	name = "Kitsune 9 tails - colorable"
	icon_state = "ninekitsune"
	extra_overlay = "tips"

/decl/sprite_accessory/tail/vulpkanin_alt_color
	name = "Vulpkanin alt"
	icon_state = "vulpkanin_alt_color"
	extra_overlay = "tips"

/decl/sprite_accessory/tail/raccoon_tail
	name = "Raccoon gray tail"
	icon_state = "raccoon_tail"

/decl/sprite_accessory/tail/Easterntail
	name = "Eastern Dragon (Animated)"
	icon_state = "easterntail"
	extra_overlay = "tips"

/decl/sprite_accessory/tail/synthliz
	name = "Synthetic lizard tail"
	icon_state = "m_tail_synthliz_BEHIND"

/decl/sprite_accessory/tail/synthliz_animated
	name = "Synthetic lizard tail, animated"
	icon_state = "m_tailwag_synthliz_BEHIND"

/decl/sprite_accessory/tail/segmentedtail
	name = "Segmented tail"
	icon_state = "segmentedtail"
	extra_overlay = "marking"

/decl/sprite_accessory/tail/segmentedtail/synth
	name = "Segmented tail, synth"
	icon_state = "segmentedtail"
	extra_overlay = "lights"

/decl/sprite_accessory/tail/fox_tail_s
	name = "Fox tail"
	icon_state = "fox_tail"

/decl/sprite_accessory/tail/fennec_tail_s
	name = "Fennec tail"
	icon_state = "fennec_tail"