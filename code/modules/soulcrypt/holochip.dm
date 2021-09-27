/obj/item/weapon/holochip
	name = "holochip"
	desc = "A one-use module containing a software package for a soulcrypt."
	icon = 'icons/obj/soulcrypt.dmi'
	icon_state = "holochip_base"

	var/tag_color
	var/used = FALSE
	var/list/contained_modules = list()

	price_tag = 1000

/obj/item/weapon/holochip/examine(mob/user)
	. = ..()

/obj/item/weapon/holochip/update_icon()
	overlays.Cut()
	var/image/I = image('icons/obj/soulcrypt.dmi', "holochip_tags")
	I.color = tag_color
	overlays += I

	if(!used)
		overlays += image('icons/obj/soulcrypt.dmi', "holochip_active")
	else
		overlays += image('icons/obj/soulcrypt.dmi', "holochip_inactive")

/obj/item/weapon/holochip/Initialize()
	update_icon()
	..()	//This is needed so that INITIALIZE_HINT_NORMAL is returned and it doesn't mess up initialization. Or so I hope.

/obj/item/weapon/holochip/afterattack(atom/A, mob/user)
	if(used)
		to_chat(user, SPAN_WARNING("This holochip is used up."))
		return
	if(istype(A, /mob/living/carbon/human))
		var/mob/living/carbon/human/target = A
		var/obj/item/weapon/implant/core_implant/soulcrypt/crypt = target.crypt
		if(!crypt)
			to_chat(user, SPAN_WARNING("[target] does not have a soulcrypt."))
			return
		visible_message(SPAN_NOTICE("[user] begins uploading [src] into [target]'s soulcrypt..."))
		if(!do_after(user, 35, target))
			return
		crypt.add_modules(contained_modules)
		used = TRUE
		update_icon()
		price_tag = 200//Occulus Edit: Is this one of those Eclipse things that ended up in the core repo? Bah!

/obj/item/weapon/holochip/command
	tag_color = COMMS_COLOR_COMMAND

/obj/item/weapon/holochip/security
	tag_color = COMMS_COLOR_SECURITY

/obj/item/weapon/holochip/medical
	tag_color = COLOR_OFF_WHITE

/obj/item/weapon/holochip/science
	tag_color = COMMS_COLOR_SCIENCE

/obj/item/weapon/holochip/cargo
	tag_color = COMMS_COLOR_SUPPLY

/obj/item/weapon/holochip/engineering
	tag_color = COMMS_COLOR_ENGINEER

/obj/item/weapon/holochip/medical/suitsensors
	contained_modules = list(/datum/soulcrypt_module/crew_monitor)
	name = "holochip - Suit Sensor Control v1.21d"
	desc = "A one-use module containing a software package for a soulcrypt. This one includes a crew sensors monitoring package."

/obj/item/weapon/holochip/engineering/alarm_mon
	contained_modules = list(/datum/soulcrypt_module/alarm_monitor)
	name = "holochip - Ship Interface Suite v3.01"
	desc = "A one-use module containing a software package for a soulcrypt. This one includes a ship sensors monitoring package."


