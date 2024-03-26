/*
////////////////////////////
/  =--------------------=  /
/  == Tail Definitions ==  /
/  =--------------------=  /
////////////////////////////
*/
/decl/sprite_accessory_category/tail
	name                  = "Tail"
	base_accessory_type   = /decl/sprite_accessory/tail
	default_accessory     = /decl/sprite_accessory/tail
	uid                   = "acc_cat_tail"

/decl/sprite_accessory/tail
	abstract_type = /decl/sprite_accessory/tail
	name = "You should not see this..."
	icon = 'mods/content/genemodding/icons/mob/tails.dmi'
	accessory_category = SAC_TAIL
	color_blend = ICON_MULTIPLY // If null, don't recolor this at all.
	var/extra_overlay // Icon state of an additional overlay to blend in.

/* // This needs to be done in a better way. It probably doesn't even work currently?
/decl/sprite_accessory/tail/invisible
	name = "hide species-sprite tail"
	icon = null
	icon_state = null
	uid = "acc_tail_hide"
*/

/decl/sprite_accessory/tail/squirrel
	name = "squirrel, colorable"
	icon_state = "squirrel"
	uid = "acc_tail_squirrel_colorable"

/decl/sprite_accessory/tail/kitty
	name = "kitty, colorable, downwards"
	icon_state = "kittydown"
	uid = "acc_tail_kitty_down_colorable"

/decl/sprite_accessory/tail/kittyup
	name = "kitty, colorable, upwards"
	icon_state = "kittyup"
	uid = "acc_tail_kitty_up_colorable"

/decl/sprite_accessory/tail/tiger_white
	name = "tiger, colorable"
	icon_state = "tiger"
	extra_overlay = "inner"
	uid = "acc_tail_tiger_colorable"

/decl/sprite_accessory/tail/stripey
	name = "stripey taj, colorable"
	icon_state = "stripeytail"
	extra_overlay = "mark"
	uid = "acc_tail_stripey_cat_colorable"

/decl/sprite_accessory/tail/chameleon
	name = "Chameleon, colorable"
	icon_state = "chameleon"
	uid = "acc_tail_chameleon_colorable"

/decl/sprite_accessory/tail/bunny
	name = "bunny, colorable"
	icon_state = "bunny"
	color_blend = ICON_ADD
	uid = "acc_tail_bunny_colorable"

/decl/sprite_accessory/tail/bear
	name = "bear, colorable"
	icon_state = "bear"
	uid = "acc_tail_bear_colorable"

/decl/sprite_accessory/tail/dragon
	name = "dragon, colorable"
	icon_state = "dragon"
	uid = "acc_tail_dragon_colorable"

/decl/sprite_accessory/tail/wolf
	name = "wolf, colorable"
	icon_state = "wolf"
	extra_overlay = "inner"
	uid = "acc_tail_wolf_colorable"

/decl/sprite_accessory/tail/mouse
	name = "mouse, colorable"
	icon_state = "mouse"
	uid = "acc_tail_mouse_colorable"

/decl/sprite_accessory/tail/horse
	name = "horse tail, colorable"
	icon_state = "horse"
	uid = "acc_tail_horse_colorable"

/decl/sprite_accessory/tail/cow
	name = "cow tail, colorable"
	icon_state = "cow"
	uid = "acc_tail_cow_colorable"

/decl/sprite_accessory/tail/fantail
	name = "avian fantail, colorable"
	icon_state = "fantail"
	uid = "acc_tail_avian_fantail_colorable"

/decl/sprite_accessory/tail/wagtail
	name = "avian wagtail, colorable"
	icon_state = "wagtail"
	uid = "acc_tail_avian_wagtail_colorable"

/decl/sprite_accessory/tail/crossfox
	name = "cross fox"
	icon_state = "crossfox"
	color_blend = null
	uid = "acc_tail_crossfox"

/decl/sprite_accessory/tail/doublekitsune
	name = "double kitsune tail, colorable"
	icon_state = "doublekitsune"
	uid = "acc_tail_double_kitsune"

/decl/sprite_accessory/tail/spade_color
	name = "spade-tail (colorable)"
	icon_state = "spadetail-black"
	color_blend = ICON_ADD
	uid = "acc_tail_spade_colorable"

/decl/sprite_accessory/tail/eboop
	name = "EGN mech tail (dual color)"
	icon_state = "eboop"
	extra_overlay = "mark"
	uid = "acc_tail_egn_mech"

/decl/sprite_accessory/tail/ringtail
	name = "ringtail, colorable"
	icon_state = "ringtail"
	extra_overlay = "mark"
	uid = "acc_tail_ringtail_colorable"

/decl/sprite_accessory/tail/satyr
	name = "goat legs, colorable"
	icon_state = "satyr"
	uid = "acc_tail_goat_legs_colorable"

/decl/sprite_accessory/tail/curltail
	name = "curltail (vwag)"
	icon_state = "curltail"
	extra_overlay = "mark"
	uid = "acc_tail_curl_vwag"

/decl/sprite_accessory/tail/shorttail
	name = "shorttail (vwag)"
	icon_state = "straighttail"
	uid = "acc_tail_shorttail_vwag"

/decl/sprite_accessory/tail/sneptail
	name = "Snep/Furry Tail (vwag)"
	icon_state = "sneptail"
	extra_overlay = "mark"
	uid = "acc_tail_snep_vwag"

/decl/sprite_accessory/tail/tiger_new
	name = "tiger tail (vwag)"
	icon_state = "tigertail"
	extra_overlay = "mark"
	uid = "acc_tail_tiger_vwag"

/decl/sprite_accessory/tail/vulp_new
	name = "new vulp tail (vwag)"
	icon_state = "vulptail"
	extra_overlay = "mark"
	uid = "acc_tail_new_vulp_vwag"

/decl/sprite_accessory/tail/ztail
	name = "jagged flufftail"
	icon_state = "ztail"
	uid = "acc_tail_jagged_fluff"

/decl/sprite_accessory/tail/snaketail
	name = "snake tail, colorable"
	icon_state = "snaketail"
	uid = "acc_tail_snake_colorable"

/decl/sprite_accessory/tail/vulpan_alt
	name = "vulpkanin alt style, colorable"
	icon_state = "vulptail_alt"
	uid = "acc_tail_vulp_alt_colorable"

/decl/sprite_accessory/tail/sergaltaildc
	name = "sergal, dual-color"
	icon_state = "sergal"
	extra_overlay = "mark"
	uid = "acc_tail_sergal_dual"

/decl/sprite_accessory/tail/skunktail
	name = "skunk, dual-color"
	icon_state = "skunktail"
	extra_overlay = "mark"
	uid = "acc_tail_skunk_dual"

/decl/sprite_accessory/tail/deertail
	name = "deer, dual-color"
	icon_state = "deertail"
	extra_overlay = "mark"
	uid = "acc_tail_deer_dual"

/decl/sprite_accessory/tail/tajanim
	name = "animated tajaran tail"
	icon_state = "tajtail_loop1"
	uid = "acc_tail_taj_animated"

/decl/sprite_accessory/tail/tail_smooth
	name = "Smooth Lizard Tail, Colorable"
	icon_state = "tail_smooth"
	uid = "acc_tail_lizard_smooth_colorable"

/decl/sprite_accessory/tail/tripplekitsune_colorable_yw
	name = "Kitsune 3 tails - colorable"
	icon_state = "triplekitsune"
	extra_overlay = "tips"
	uid = "acc_tail_kitsune_triple_colorable"

/decl/sprite_accessory/tail/lizard_tail_smooth
	name = "Lizard Tail (Smooth)"
	icon_state = "lizard_tail_smooth"
	uid = "acc_tail_lizard_smooth"

/decl/sprite_accessory/tail/lizard_tail_dark_tiger
	name = "Lizard Tail (Dark Tiger)"
	icon_state = "lizard_tail_dark_tiger"
	uid = "acc_tail_lizard_dark_tiger"

/decl/sprite_accessory/tail/lizard_tail_light_tiger
	name = "Lizard Tail (Light Tiger)"
	icon_state = "lizard_tail_light_tiger"
	uid = "acc_tail_lizard_light_tiger"

/decl/sprite_accessory/tail/lizard_tail_spiked
	name = "Lizard Tail (Spiked)"
	icon_state = "lizard_tail_spiked"
	uid = "acc_tail_lizard_spiked"

/decl/sprite_accessory/tail/wolf_tail
	name = "Wolf Tail"
	icon_state = "wolf_tail"
	uid = "acc_tail_wolf"

/decl/sprite_accessory/tail/ninekitsune_colorable_yw
	name = "Kitsune 9 tails - colorable"
	icon_state = "ninekitsune"
	extra_overlay = "tips"
	uid = "acc_tail_kitsune_nine_colorable"

/decl/sprite_accessory/tail/vulpkanin_alt_color
	name = "Vulpkanin alt"
	icon_state = "vulpkanin_alt_color"
	extra_overlay = "tips"
	uid = "acc_tail_vulp_alt"

/decl/sprite_accessory/tail/raccoon_tail
	name = "Raccoon gray tail"
	icon_state = "raccoon_tail"
	uid = "acc_tail_raccoon_gray"

/decl/sprite_accessory/tail/Easterntail
	name = "Eastern Dragon (Animated)"
	icon_state = "easterntail"
	extra_overlay = "tips"
	uid = "acc_tail_eastern_dragon_animated"

/decl/sprite_accessory/tail/synthliz
	name = "Synthetic lizard tail"
	icon_state = "m_tail_synthliz_BEHIND"
	uid = "acc_tail_synth_lizard"

/decl/sprite_accessory/tail/synthliz_animated
	name = "Synthetic lizard tail, animated"
	icon_state = "m_tailwag_synthliz_BEHIND"
	uid = "acc_tail_synth_lizard_animated"

/decl/sprite_accessory/tail/segmentedtail
	name = "Segmented tail"
	icon_state = "segmentedtail"
	extra_overlay = "marking"
	uid = "acc_tail_segmented"

/decl/sprite_accessory/tail/segmentedtail/synth
	name = "Segmented tail, synth"
	icon_state = "segmentedtail"
	extra_overlay = "lights"
	uid = "acc_tail_segmented_synth"

/decl/sprite_accessory/tail/fox_tail_s
	name = "Fox tail"
	icon_state = "fox_tail"
	uid = "acc_tail_fox"

/decl/sprite_accessory/tail/fennec_tail_s
	name = "Fennec tail"
	icon_state = "fennec_tail"
	uid = "acc_tail_fennec"