// I hate myself sometimes
/*
 * Block macros to define instance presets for prosthesis
 * please make sure that each line that is not the last
 * one ends with \, else DM will refuse to compile it.
 */
#define CREATE_PROSTHESIS_VARIETIES_FULL(typename, string)\
/obj/item/organ/external/robotic/typename/head {\
	default_description = /datum/organ_description/head;\
}\
/obj/item/organ/external/robotic/typename/chest {\
	default_description = /datum/organ_description/chest;\
}\
/obj/item/organ/external/robotic/typename/l_arm {\
	default_description = /datum/organ_description/arm/left;\
}\
/obj/item/organ/external/robotic/typename/l_hand {\
	default_description = /datum/organ_description/hand/left;\
}\
/obj/item/organ/external/robotic/typename/r_arm {\
	default_description = /datum/organ_description/arm/right;\
}\
/obj/item/organ/external/robotic/typename/r_hand {\
	default_description = /datum/organ_description/hand/right;\
}\
/obj/item/organ/external/robotic/typename/groin {\
	default_description = /datum/organ_description/groin;\
}\
/obj/item/organ/external/robotic/typename/l_leg {\
	default_description = /datum/organ_description/leg/left;\
}\
/obj/item/organ/external/robotic/typename/l_foot {\
	default_description = /datum/organ_description/foot/left;\
}\
/obj/item/organ/external/robotic/typename/r_leg {\
	default_description = /datum/organ_description/leg/right;\
}\
/obj/item/organ/external/robotic/typename/r_foot {\
	default_description = /datum/organ_description/foot/right;\
}
// end CREATE_PROSTHESIS_VARIETIES_FULL

// Copypasta of Irra's macro for hands and feet only.
#define CREATE_PROSTHESIS_HANDSFEET(typename, string)\
/obj/item/organ/external/robotic/typename/l_arm {\
	default_description = /datum/organ_description/arm/left;\
}\
/obj/item/organ/external/robotic/typename/l_hand {\
	default_description = /datum/organ_description/hand/left;\
}\
/obj/item/organ/external/robotic/typename/r_arm {\
	default_description = /datum/organ_description/arm/right;\
}\
/obj/item/organ/external/robotic/typename/r_hand {\
	default_description = /datum/organ_description/hand/right;\
}\
/obj/item/organ/external/robotic/typename/l_leg {\
	default_description = /datum/organ_description/leg/left;\
}\
/obj/item/organ/external/robotic/typename/l_foot {\
	default_description = /datum/organ_description/foot/left;\
}\
/obj/item/organ/external/robotic/typename/r_leg {\
	default_description = /datum/organ_description/leg/right;\
}\
/obj/item/organ/external/robotic/typename/r_foot {\
	default_description = /datum/organ_description/foot/right;\
}
// end CREATE_PROSTHESIS_HANDSFEET


/obj/item/organ/external/robotic/tv_head/head
	name = "Unbranded TV-head"
	desc = "A knock-off unbranded tv-shaped head."
	force_icon = 'icons/mob/human_races/cyberlimbs/unbranded/unbranded_monitor.dmi'
	price_tag = 400


/obj/item/organ/external/robotic/bishop
	name = "Bishop"
	desc = "Prosthesis with white polymer casing with blue holo-displays."
	force_icon = 'icons/mob/human_races/cyberlimbs/bishop/bishop_main.dmi'
	price_tag = 600

CREATE_PROSTHESIS_VARIETIES_FULL(bishop, "Bishop")


/obj/item/organ/external/robotic/hesphaistos
	name = "Hesphaistos"
	desc = "Prosthesis with militaristic black and green casing with gold stripes."
	force_icon = 'icons/mob/human_races/cyberlimbs/hephaestus/hephaestus_main.dmi'
	price_tag = 500

CREATE_PROSTHESIS_VARIETIES_FULL(hesphaistos, "Hesphaistos")


/obj/item/organ/external/robotic/zenghu
	name = "Zeng-Hu"
	desc = "Prosthesis with rubbery fleshtone covering with visible seams."
	icon = 'icons/mob/human_races/cyberlimbs/zenghu/zenghu_main.dmi'
	price_tag = 400

CREATE_PROSTHESIS_VARIETIES_FULL(zenghu, "Zeng-Hu")


/obj/item/organ/external/robotic/xion
	name = "Xion"
	desc = "Prosthesis with minimalist black and red casing."
	force_icon = 'icons/mob/human_races/cyberlimbs/xion/xion_main.dmi'
	price_tag = 500

CREATE_PROSTHESIS_VARIETIES_FULL(xion, "Xion")

//ERIS PROSTHESIS OVERRIDES GO HERE

/obj/item/organ/external/robotic/asters
	force_icon = 'zzzz_modular_occulus/icons/eris_prosthesis/asters.dmi'

CREATE_PROSTHESIS_HANDSFEET(asters, "Asters")

/obj/item/organ/external/robotic/serbian
	force_icon = 'zzzz_modular_occulus/icons/eris_prosthesis/serbian.dmi'

CREATE_PROSTHESIS_HANDSFEET(serbian, "Serbian")

/obj/item/organ/external/robotic/frozen_star
	force_icon = 'zzzz_modular_occulus/icons/eris_prosthesis/frozen_star.dmi'

CREATE_PROSTHESIS_HANDSFEET(frozen_star, "Frozen Star")

/obj/item/organ/external/robotic/technomancer
	force_icon = 'zzzz_modular_occulus/icons/eris_prosthesis/technomancer.dmi'

CREATE_PROSTHESIS_HANDSFEET(technomancer, "Technomancer")

/obj/item/organ/external/robotic/moebius
	force_icon = 'zzzz_modular_occulus/icons/eris_prosthesis/moebius.dmi'

CREATE_PROSTHESIS_HANDSFEET(moebius, "Moebius")

/obj/item/organ/external/robotic/excelsior
	force_icon = 'zzzz_modular_occulus/icons/eris_prosthesis/excelsior.dmi'

CREATE_PROSTHESIS_HANDSFEET(excelsior, "Excelsior")

/obj/item/organ/external/robotic/one_star
	force_icon = 'zzzz_modular_occulus/icons/eris_prosthesis/one_star.dmi'

CREATE_PROSTHESIS_HANDSFEET(one_star, "One Star")

#undef CREATE_PROSTHESIS_VARIETIES_FULL
#undef CREATE_PROSTHESIS_HANDSFEET
