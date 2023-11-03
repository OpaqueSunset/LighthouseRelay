/*
////////////////////////////
/  =--------------------=  /
/  ==  Virgo Markings  ==  /
/  =--------------------=  /
////////////////////////////
*/

/decl/sprite_accessory/marking/genemodder
	abstract_type = /decl/sprite_accessory/marking/genemodder
	icon = 'mods/content/genemodding/icons/mob/human_races/markings.dmi'
	blend = ICON_MULTIPLY
	species_allowed = null

/decl/sprite_accessory/marking/genemodder/vulp_belly
	name = "belly fur (Vulp)"
	icon_state = "vulp_belly"
	body_parts = list(BP_CHEST,BP_GROIN)
	uid = "acc_modder_vulp_belly"

/decl/sprite_accessory/marking/genemodder/vulp_fullbelly
	name = "full belly fur (Vulp)"
	icon_state = "vulp_fullbelly"
	body_parts = list(BP_CHEST,BP_GROIN)
	uid = "acc_modder_vulp_fullbelly"

/decl/sprite_accessory/marking/genemodder/vulp_crest
	name = "belly crest (Vulp)"
	icon_state = "vulp_crest"
	body_parts = list(BP_CHEST,BP_GROIN)
	uid = "acc_modder_vulp_crest"

/decl/sprite_accessory/marking/genemodder/vulp_nose
	name = "nose (Vulp)"
	icon_state = "vulp_nose"
	body_parts = list(BP_HEAD)
	uid = "acc_modder_vulp_nose"

/decl/sprite_accessory/marking/genemodder/snoutstripe
	name = "snout stripe (Vulp)"
	icon_state = "snoutstripe"
	body_parts = list(BP_HEAD)
	uid = "acc_modder_vulp_snoutstripe"

/decl/sprite_accessory/marking/genemodder/vulp_face
	name = "face (Vulp)"
	icon_state = "vulp_face"
	body_parts = list(BP_HEAD)
	uid = "acc_modder_vulp_face"

/decl/sprite_accessory/marking/genemodder/vulp_earsface
	name = "ears and face (Vulp)"
	icon_state = "vulp_earsface"
	body_parts = list(BP_HEAD)
	uid = "acc_modder_vulp_earsface"

/decl/sprite_accessory/marking/genemodder/vulp_all
	name = "all head highlights (Vulp)"
	icon_state = "vulp_all"
	body_parts = list(BP_HEAD)
	uid = "acc_modder_vulp_all_head"

/decl/sprite_accessory/marking/genemodder/sergal_full
	name = "Sergal Markings"
	icon_state = "sergal_full"
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_CHEST,BP_HEAD)
	uid = "acc_modder_sergal_full"

/decl/sprite_accessory/marking/genemodder/sergal_full_female
	name = "Sergal Markings (Female)"
	icon_state = "sergal_full_female"
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_CHEST,BP_HEAD)
	uid = "acc_modder_sergal_full_female"

/decl/sprite_accessory/marking/genemodder/monoeye
	name = "Monoeye"
	icon_state = "monoeye"
	blend = ICON_ADD
	body_parts = list(BP_HEAD)
	uid = "acc_modder_monoeye"

/decl/sprite_accessory/marking/genemodder/spidereyes
	name = "Spider Eyes"
	icon_state = "spidereyes"
	blend = ICON_ADD
	body_parts = list(BP_HEAD)
	uid = "acc_modder_spidereyes"

/decl/sprite_accessory/marking/genemodder/vasseyes
	name = "Vassilisan Eyes"
	icon_state = "vasseyes"
	blend = ICON_ADD
	body_parts = list(BP_HEAD)
	uid = "acc_modder_vasseyes"

/decl/sprite_accessory/marking/genemodder/vasseyesalt
	name = "Vassilisan Eyes (Alt)"
	icon_state = "vasseyesalt"
	blend = ICON_ADD
	body_parts = list(BP_HEAD)
	uid = "acc_modder_vasseyesalt"

/decl/sprite_accessory/marking/genemodder/sergaleyes
	name = "Sergal Eyes"
	icon_state = "eyes_sergal"
	blend = ICON_ADD
	body_parts = list(BP_HEAD)
	uid = "acc_modder_sergaleyes"

/decl/sprite_accessory/marking/genemodder/brows
	name = "Eyebrows"
	icon_state = "brows"
	body_parts = list(BP_HEAD)
	uid = "acc_modder_eyebrows"

/decl/sprite_accessory/marking/genemodder/spots
	name = "Spots"
	icon_state = "spots"
	blend = ICON_ADD
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_CHEST)
	uid = "acc_modder_spots"

/decl/sprite_accessory/marking/genemodder/shaggy_mane
	name = "Shaggy mane/feathers"
	icon_state = "shaggy"
	body_parts = list(BP_CHEST)
	uid = "acc_modder_shaggy_mane"

/decl/sprite_accessory/marking/genemodder/jagged_teeth
	name = "Jagged teeth"
	icon_state = "jagged"
	blend = ICON_ADD
	body_parts = list(BP_HEAD)
	uid = "acc_modder_jagged_teeth"

/decl/sprite_accessory/marking/genemodder/saber_teeth
	name = "Saber teeth"
	icon_state = "saber"
	blend = ICON_ADD
	body_parts = list(BP_HEAD)
	uid = "acc_modder_saber_teeth"

/decl/sprite_accessory/marking/genemodder/fangs
	name = "Fangs"
	icon_state = "fangs"
	blend = ICON_ADD
	body_parts = list(BP_HEAD)
	uid = "acc_modder_fangs"

/decl/sprite_accessory/marking/genemodder/tusks
	name = "Tusks"
	icon_state = "tusks"
	blend = ICON_ADD
	body_parts = list(BP_HEAD)
	uid = "acc_modder_tusks"

/decl/sprite_accessory/marking/genemodder/otie_face
	name = "Otie face"
	icon_state = "otieface"
	body_parts = list(BP_HEAD)
	uid = "acc_modder_otie_face"

/decl/sprite_accessory/marking/genemodder/otie_nose
	name = "Otie nose"
	icon_state = "otie_nose"
	body_parts = list(BP_HEAD)
	uid = "acc_modder_otie_nose"

/decl/sprite_accessory/marking/genemodder/otienose_lite
	name = "Short otie nose"
	icon_state = "otienose_lite"
	body_parts = list(BP_HEAD)
	uid = "acc_modder_otie_nose_lite"

/decl/sprite_accessory/marking/genemodder/backstripes
	name = "Back stripes"
	icon_state = "otiestripes"
	body_parts = list(BP_CHEST,BP_HEAD)
	uid = "acc_modder_otie_back_stripes"

/decl/sprite_accessory/marking/genemodder/belly_butt
	name = "Belly and butt"
	icon_state = "bellyandbutt"
	body_parts = list(BP_GROIN,BP_CHEST)
	uid = "acc_modder_belly_butt"

/decl/sprite_accessory/marking/genemodder/fingers_toes
	name = "Fingers and toes"
	icon_state = "fingerstoes"
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_HAND,BP_R_HAND)
	uid = "acc_modder_fingers_toes"

/decl/sprite_accessory/marking/genemodder/otie_socks
	name = "Fingerless socks"
	icon_state = "otiesocks"
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND)
	uid = "acc_modder_otie_socks"

/decl/sprite_accessory/marking/genemodder/corvid_beak
	name = "Corvid beak"
	icon_state = "corvidbeak"
	body_parts = list(BP_HEAD)
	uid = "acc_modder_corvid_beak"

/decl/sprite_accessory/marking/genemodder/corvid_belly
	name = "Corvid belly"
	icon_state = "corvidbelly"
	body_parts = list(BP_GROIN,BP_CHEST,BP_HEAD)
	uid = "acc_modder_corvid_belly"

/decl/sprite_accessory/marking/genemodder/cow_body
	name = "Cow markings"
	icon_state = "cowbody"
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_CHEST,BP_HEAD)
	uid = "acc_modder_cow_body"

/decl/sprite_accessory/marking/genemodder/cow_nose
	name = "Cow nose"
	icon_state = "cownose"
	body_parts = list(BP_HEAD)
	uid = "acc_modder_cow_nose"

/decl/sprite_accessory/marking/genemodder/zmask
	name = "Eye mask"
	icon_state = "zmask"
	body_parts = list(BP_HEAD)
	uid = "acc_modder_zorren_eye_mask"

/decl/sprite_accessory/marking/genemodder/zbody
	name = "Thick jagged stripes"
	icon_state = "zbody"
	body_parts = list(BP_L_LEG,BP_R_LEG,BP_GROIN,BP_CHEST)
	uid = "acc_modder_jagged_body"

/decl/sprite_accessory/marking/genemodder/znose
	name = "Jagged snout"
	icon_state = "znose"
	body_parts = list(BP_HEAD)
	uid = "acc_modder_jagged_snout"

/decl/sprite_accessory/marking/genemodder/otter_nose
	name = "Otter nose"
	icon_state = "otternose"
	body_parts = list(BP_HEAD)
	uid = "acc_modder_otter_nose"

/decl/sprite_accessory/marking/genemodder/otter_face
	name = "Otter face"
	icon_state = "otterface"
	body_parts = list(BP_HEAD)
	uid = "acc_modder_otter_face"

/decl/sprite_accessory/marking/genemodder/deer_face
	name = "Deer face"
	icon_state = "deerface"
	body_parts = list(BP_HEAD)
	uid = "acc_modder_deer_face"

/decl/sprite_accessory/marking/genemodder/sharkface
	name = "Akula snout"
	icon_state = "sharkface"
	body_parts = list(BP_HEAD)
	uid = "acc_modder_akula_snout"

/decl/sprite_accessory/marking/genemodder/sheppy_face
	name = "Shepherd snout"
	icon_state = "shepface"
	body_parts = list(BP_HEAD)
	uid = "acc_modder_sheppy_face"

/decl/sprite_accessory/marking/genemodder/sheppy_back
	name = "Shepherd back"
	icon_state = "shepback"
	body_parts = list(BP_CHEST,BP_GROIN)
	uid = "acc_modder_sheppy_back"

/decl/sprite_accessory/marking/genemodder/zorren_belly_male
	name = "Zorren Male Torso"
	icon_state = "zorren_belly"
	body_parts = list(BP_CHEST,BP_GROIN)
	uid = "acc_modder_zorren_belly"

/decl/sprite_accessory/marking/genemodder/zorren_belly_female
	name = "Zorren Female Torso"
	icon_state = "zorren_belly_female"
	body_parts = list(BP_CHEST,BP_GROIN)
	uid = "acc_modder_zorren_belly_female"

/decl/sprite_accessory/marking/genemodder/zorren_back_patch
	name = "Zorren Back Patch"
	icon_state = "zorren_backpatch"
	body_parts = list(BP_CHEST)
	uid = "acc_modder_zorren_back_patch"

/decl/sprite_accessory/marking/genemodder/zorren_face_male
	name = "Zorren Male Face"
	icon_state = "zorren_face"
	body_parts = list(BP_HEAD)
	required_gender = MALE
	uid = "acc_modder_zorren_face_male"

/decl/sprite_accessory/marking/genemodder/zorren_face_female
	name = "Zorren Female Face"
	icon_state = "zorren_face_female"
	body_parts = list(BP_HEAD)
	required_gender = FEMALE
	uid = "acc_modder_zorren_face_female"

/decl/sprite_accessory/marking/genemodder/zorren_muzzle_male
	name = "Zorren Male Muzzle"
	icon_state = "zorren_muzzle"
	body_parts = list(BP_HEAD)
	required_gender = MALE
	uid = "acc_modder_zorren_muzzle_male"

/decl/sprite_accessory/marking/genemodder/zorren_muzzle_female
	name = "Zorren Female Muzzle"
	icon_state = "zorren_muzzle_female"
	body_parts = list(BP_HEAD)
	required_gender = FEMALE
	uid = "acc_modder_zorren_muzzle_female"

/decl/sprite_accessory/marking/genemodder/zorren_socks
	name = "Zorren Socks"
	icon_state = "zorren_socks"
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND)
	uid = "acc_modder_zorren_socks"

/decl/sprite_accessory/marking/genemodder/zorren_longsocks
	name = "Zorren Longsocks"
	icon_state = "zorren_longsocks"
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND)
	uid = "acc_modder_zorren_longsocks"

/decl/sprite_accessory/marking/genemodder/harpy_feathers
	name = "Rapala leg Feather"
	icon_state = "harpy-feathers"
	body_parts = list(BP_L_LEG,BP_R_LEG)
	uid = "acc_modder_harpy_feathers"

/decl/sprite_accessory/marking/genemodder/harpy_legs
	name = "Rapala leg coloring"
	icon_state = "harpy-leg"
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG)
	uid = "acc_modder_harpy_legs"

/decl/sprite_accessory/marking/genemodder/chooves
	name = "Cloven hooves"
	icon_state = "chooves"
	body_parts = list(BP_L_FOOT,BP_R_FOOT)
	uid = "acc_modder_cloven_hooves"

/decl/sprite_accessory/marking/genemodder/body_tone
	name = "Body toning (for emergency contrast loss)"
	icon_state = "btone"
	blend = ICON_ADD
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_CHEST)
	uid = "acc_modder_body_tone"

/decl/sprite_accessory/marking/genemodder/gloss
	name = "Full body gloss"
	icon_state = "gloss"
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_CHEST,BP_HEAD)
	uid = "acc_modder_body_gloss"

/decl/sprite_accessory/marking/genemodder/eboop_panels
	name = "Eggnerd FBP panels"
	icon_state = "eboop"
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_CHEST,BP_HEAD)
	uid = "acc_modder_eggnerd_panels"

/decl/sprite_accessory/marking/genemodder/osocks_rarm
	name = "Modular Longsock (right arm)"
	icon_state = "osocks"
	body_parts = list(BP_R_ARM,BP_R_HAND)
	uid = "acc_modder_modular_sock_rarm"

/decl/sprite_accessory/marking/genemodder/osocks_larm
	name = "Modular Longsock (left arm)"
	icon_state = "osocks"
	body_parts = list(BP_L_ARM,BP_L_HAND)
	uid = "acc_modder_modular_sock_larm"

/decl/sprite_accessory/marking/genemodder/osocks_rleg
	name = "Modular Longsock (right leg)"
	icon_state = "osocks"
	body_parts = list(BP_R_FOOT,BP_R_LEG)
	uid = "acc_modder_modular_sock_rleg"

/decl/sprite_accessory/marking/genemodder/osocks_lleg
	name = "Modular Longsock (left leg)"
	icon_state = "osocks"
	body_parts = list(BP_L_FOOT,BP_L_LEG)
	uid = "acc_modder_modular_sock_lleg"

/decl/sprite_accessory/marking/genemodder/animeeyesinner
	name = "Anime Eyes Inner"
	icon_state = "animeeyesinner"
	blend = ICON_ADD
	body_parts = list(BP_HEAD)
	uid = "acc_modder_anime_eyes_inner"

/decl/sprite_accessory/marking/genemodder/animeeyesouter
	name = "Anime Eyes Outer"
	icon_state = "animeeyesouter"
	blend = ICON_ADD
	body_parts = list(BP_HEAD)
	uid = "acc_modder_anime_eyes_outer"

/decl/sprite_accessory/marking/genemodder/panda_eye_marks
	name = "Panda Eye Markings"
	icon_state = "eyes_panda"
	blend = ICON_ADD
	body_parts = list(BP_HEAD)
	uid = "acc_modder_panda_eye_marks"

/decl/sprite_accessory/marking/genemodder/catwomantorso
	name = "Catwoman chest stripes"
	icon_state = "catwomanchest"
	body_parts = list(BP_CHEST)
	uid = "acc_modder_catwomantorso"

/decl/sprite_accessory/marking/genemodder/catwomangroin
	name = "Catwoman groin stripes"
	icon_state = "catwomangroin"
	body_parts = list(BP_GROIN)
	uid = "acc_modder_catwomangroin"

/decl/sprite_accessory/marking/genemodder/catwoman_rleg
	name = "Catwoman right leg stripes"
	icon_state = "catwomanright"
	body_parts = list(BP_R_LEG)
	uid = "acc_modder_catwoman_rleg"

/decl/sprite_accessory/marking/genemodder/catwoman_lleg
	name = "Catwoman left leg stripes"
	icon_state = "catwomanleft"
	body_parts = list(BP_L_LEG)
	uid = "acc_modder_catwoman_lleg"

/decl/sprite_accessory/marking/genemodder/spirit_lights
	name = "Ward - Spirit FBP Lights"
	icon_state = "lights"
	body_parts = list(BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_CHEST,BP_HEAD)
	uid = "acc_modder_spirit_lights"

/decl/sprite_accessory/marking/genemodder/spirit_lights_body
	name = "Ward - Spirit FBP Lights (body)"
	icon_state = "lights"
	body_parts = list(BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_CHEST)
	uid = "acc_modder_spirit_lights_body"

/decl/sprite_accessory/marking/genemodder/spirit_lights_head
	name = "Ward - Spirit FBP Lights (head)"
	icon_state = "lights"
	body_parts = list(BP_HEAD)
	uid = "acc_modder_spirit_lights_head"

/decl/sprite_accessory/marking/genemodder/spirit_panels
	name = "Ward - Spirit FBP Panels"
	icon_state = "panels"
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_CHEST,BP_HEAD)
	uid = "acc_modder_spirit_panels"

/decl/sprite_accessory/marking/genemodder/spirit_panels_body
	name = "Ward - Spirit FBP Panels (body)"
	icon_state = "panels"
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_CHEST)
	uid = "acc_modder_spirit_panels_body"

/decl/sprite_accessory/marking/genemodder/spirit_panels_head
	name = "Ward - Spirit FBP Panels (head)"
	icon_state = "panels"
	body_parts = list(BP_HEAD)
	uid = "acc_modder_spirit_panels_head"

/decl/sprite_accessory/marking/genemodder/heterochromia
	name = "Heterochromia"
	icon_state = "heterochromia"
	blend = ICON_ADD
	body_parts = list(BP_HEAD)
	uid = "acc_modder_heterochromia"

/decl/sprite_accessory/marking/genemodder/voxscales
	name = "Vox Scales"
	icon_state = "Voxscales"
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_HEAD)
	uid = "acc_modder_voxscales"

/decl/sprite_accessory/marking/genemodder/voxclaws
	name = "Vox Claws"
	icon_state = "Voxclaws"
	body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_HAND,BP_R_HAND)
	uid = "acc_modder_voxclaws"

/decl/sprite_accessory/marking/genemodder/voxbeak
	name = "Vox Beak"
	icon_state = "Voxscales"
	body_parts = list(BP_HEAD)
	uid = "acc_modder_voxbeak"

/decl/sprite_accessory/marking/genemodder/unathihood
	name = "Cobra Hood"
	icon_state = "unathihood"
	body_parts = list(BP_HEAD)
	mask_to_bodypart = FALSE
	uid = "acc_modder_cobra_hood"

/decl/sprite_accessory/marking/genemodder/unathidoublehorns
	name = "Double Unathi Horns"
	icon_state = "unathidoublehorns"
	body_parts = list(BP_HEAD)
	mask_to_bodypart = FALSE
	uid = "acc_modder_unathi_double_horns"