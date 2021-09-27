/obj/machinery/smartfridge/disks
	name = "disk compartmentalizer"
	desc = "A machine capable of storing a variety of disks. Denoted by most as the DSU (disk storage unit)."
	icon = 'zzzz_modular_occulus/icons/obj/vending.dmi'
	icon_state = "disktoaster"
	icon_on = "disktoaster"
	icon_off = "disktoaster-off"
	icon_panel = "disktoaster-panel"
	pass_flags = PASSTABLE
	anchored = FALSE

/obj/machinery/smartfridge/disks/accept_check(var/obj/item/O as obj)
	if(istype(O, /obj/item/weapon/computer_hardware/hard_drive/portable/))
		return 1
	else
		return 0

/obj/machinery/smartfridge/disks/attackby(var/obj/item/O as obj, var/mob/user as mob)
	..()
	if(QUALITY_HAMMERING in O.tool_qualities)
		if(O.use_tool(user, src, WORKTIME_FAST, QUALITY_HAMMERING, FAILCHANCE_EASY,  required_stat = STAT_MEC))
			to_chat(user, SPAN_NOTICE("You break down the [src]."))
			for(var/obj/S in contents)
				S.forceMove(src.loc)
			src.Destroy()

/datum/craft_recipe/furniture/diskfridge
	name = "disc compartmentalizer"
	result = /obj/machinery/smartfridge/disks
	time = 200
	flags = CRAFT_ON_FLOOR
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTIC),
		list(QUALITY_CUTTING, 10, 20),
		list(QUALITY_HAMMERING, 10, 20)
	)

//Drying rack destruction/moving capabilities. Modular to prevent bullshit redoing of it.

/obj/machinery/smartfridge/drying_rack/attackby(obj/item/O, mob/user)
	..()
	if(QUALITY_PRYING in O.tool_qualities)
		if(O.use_tool(user, src, WORKTIME_FAST, QUALITY_PRYING, FAILCHANCE_EASY, required_stat = STAT_MEC))
			to_chat(user, SPAN_NOTICE("You break down the [src]."))
			for(var/obj/S in contents)
				S.forceMove(src.loc)
			src.Destroy()
	if(QUALITY_BOLT_TURNING in O.tool_qualities)
		if(O.use_tool(user, src, WORKTIME_FAST, QUALITY_BOLT_TURNING))
			to_chat(user, SPAN_NOTICE("You [anchored ? "secure" : "unsecure"] the [src]."))
			anchored = !anchored

/obj/machinery/smartfridge/chemistry/mini
	name = "\improper Short-Term Chemical Storage"
	desc = "A mini-refrigerated storage unit for chemical storage."
	icon = 'zzzz_modular_occulus/icons/obj/vending.dmi'
	icon_state = "minifridge"
	use_power = IDLE_POWER_USE
	idle_power_usage = 2
	active_power_usage = 50
	reagent_flags = NO_REACT
	icon_on = "minifridge-on"
	icon_off = "minifridge-off"
	icon_panel = "minifridge-panel"
	icon_fill10 = "minifridge-fill"
	icon_fill20 = "minifridge-fill"
	icon_fill30 = "minifridge-fill"