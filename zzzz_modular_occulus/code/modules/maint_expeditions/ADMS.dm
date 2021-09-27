/obj/machinery/exploration/
	icon = 'zzzz_modular_occulus/icons/obj/ADMS.dmi'
	anchored = FALSE
	use_power = NO_POWER_USE //The exploration items take power directly from a cell.
	density = TRUE

/obj/machinery/exploration/ADMS
	name = "Anomalous Data Measurement System"
	desc = "A large piece of equipment for gathering data from anomalous regions."
	icon_state = "ADMS"

	circuit = /obj/item/weapon/electronics/circuitboard/ADMS
	var/soundcooldown = 5
	var/active = FALSE
	var/obj/item/weapon/computer_hardware/hard_drive/portable/inserted_disk //Any portable drive works. When inserted, the ADMS installs the research point program
	var/datum/computer_file/binary/research_points/inserted_disk_file //A ref to the research_points program
	var/obj/item/weapon/cell/large/cell
	//Upgrades
	var/harvest_speed //Modified by internal scanner and laser
	var/charge_use //modified by capacitor. Better capacitor = slower cell drain
	emagged = FALSE

/obj/machinery/exploration/ADMS/examine(mob/user)
	. = ..()
	if(inserted_disk)
		to_chat(user, SPAN_NOTICE("It has a disk inserted."))
	else
		to_chat(user, SPAN_NOTICE("The disk drive is empty!"))

/obj/machinery/exploration/ADMS/emag_act(mob/user)
	if(!emagged)
		emagged = TRUE
		playsound(loc, "sparks", 75, 1, -1)
		to_chat(user, SPAN_NOTICE("You use the cryptographic sequencer on the [name]."))

/obj/machinery/exploration/ADMS/Destroy()
	if(inserted_disk)
		inserted_disk.forceMove(loc)//If destroyed, drop the disk!
	return ..()

/obj/machinery/exploration/ADMS/New()
	set_light(l_color=COLOR_RED)
	..()

/obj/machinery/exploration/ADMS/Process()//Harvest speed values may need tweaking. Needs testing in live environment
	if(!active)
		set_light(0,0)
		return
	if(!use_cell_power())
		system_error("charge error")//If the battery is dead, shut it down
		set_light(0,0)
		return
	if(!inserted_disk)
		system_error("no disk found")
		set_light(0,0)
		return
	if(inserted_disk.used_capacity >= inserted_disk.max_capacity)
		system_error("disk full")
		set_light(0,0)
		return
	set_light(2,1)
	if(soundcooldown == 0)
		playsound(src.loc, 'sound/ambience/sonar.ogg', 60, 1, 8, 8)
		soundcooldown = 5
	else
		soundcooldown--
	if(istype(get_area(src), /area/deepmaint))
		inserted_disk_file.size += 1.2 * harvest_speed//1000 research points PER size. 300 points per tick per tier of laser. ~1,000-5,000 before mobs spawn.
		if(prob(3))//SET BACK TO prob(3) after test!
			src.spawn_monsters("Roaches",4)//Full Furher retinue
			return
	if(istype(get_area(src), /area/asteroid) || istype(get_area(src), /area/mine/unexplored))
		inserted_disk_file.size += 0.4 * harvest_speed//100 points per tick per tier of laser
		if(prob(2))
			src.spawn_monsters("Space",2)//Fewer than deepmaint, since this area is not as dangerous. Need to make a new spacemob spawner!
			return
	if(istype(get_area(src), /area/awaymission))//Spooders because no Nothern Light
		inserted_disk_file.size += 0.8 * harvest_speed//200 points per tick per tier of laser
		if(prob(1))
			src.spawn_monsters("Spiders",2)
	else
		if(prob(10))
			src.spawn_monsters("Roaches",1)//On the station is just calls groups of roaches!
			return

/obj/machinery/exploration/ADMS/proc/spawn_monsters(var/tag, var/number)
	src.active = FALSE
	system_error("hostiles detected")
	playsound(loc, "robot_talk_heavy", 100, 0, 0)
	var/list/turf/candidatetiles = list()
	sleep(9)
	playsound(src.loc, 'sound/voice/shriek1.ogg', 20, 1, 8, 8)
	sleep(9)
	playsound(src.loc, 'sound/voice/shriek1.ogg', 60, 1, 8, 8)
	sleep(9)
	playsound(src.loc, 'sound/voice/shriek1.ogg', 80, 1, 8, 8)
	sleep(9)
	playsound(src.loc, 'sound/voice/shriek1.ogg', 100, 1, 8, 8)
	if(emagged)
		new /mob/living/carbon/superior_animal/roach/kaiser(src.loc)
		qdel(src)
		return
	for(var/turf/simulated/floor/F in orange(src.loc, 5))
		if(F.is_wall)
			continue
		if(locate(/obj/machinery/door) in F)
			continue
		if (locate(/obj/structure/multiz) in F)
			continue
		candidatetiles += F
	while(number > 0)
		var/turf/simulated/floor/burstup = pick(candidatetiles)
		//spawn some rubble too!
		for (var/turf/simulated/floor/FL in orange(burstup, 3))
			if (FL.is_wall)
				continue
			if (locate(/obj/effect/decal/cleanable/rubble) in FL)
				continue
			new /obj/effect/decal/cleanable/rubble(FL)
		if(tag == "Roaches")
			new /obj/spawner/mob/roaches/cluster(burstup)
		if(tag == "Spiders")
			new /obj/spawner/mob/spiders/cluster(burstup)
		if(tag == "Space")
			new /mob/living/simple_animal/hostile/retaliate/malf_drone(burstup)
		number--
	return

/obj/item/weapon/computer_hardware/hard_drive/portable/research_points/adms //any research disk works in the ADMS, but it starts with an empty one!
	min_points = 0
	max_points = 0

/obj/machinery/exploration/ADMS/proc/system_error(var/error)
	if(error)
		visible_message(SPAN_NOTICE("\The [src] flashes a '[error]' warning."))
	playsound(loc, 'sound/machines/buzz-sigh.ogg', 50, 0)
	active = FALSE
	update_icon()

/obj/machinery/exploration/ADMS/proc/use_cell_power()
	if(!cell)
		return FALSE
	if(cell.checked_use(charge_use))
		return TRUE
	return FALSE

/obj/item/weapon/electronics/circuitboard/ADMS
	name = T_BOARD("Anomalous Data Measurement System")
	build_path = /obj/machinery/exploration/ADMS
	board_type = "machine"
	origin_tech = list(TECH_DATA = 1, TECH_ENGINEERING = 1)
	req_components = list(
		/obj/item/weapon/stock_parts/capacitor = 1,
		/obj/item/weapon/stock_parts/micro_laser = 1,
		/obj/item/weapon/stock_parts/scanning_module = 1,
		/obj/item/weapon/cell/large = 1
	)

/obj/machinery/exploration/ADMS/RefreshParts()
	..()
	harvest_speed = 0
	charge_use = 50

	for(var/obj/item/weapon/stock_parts/P in component_parts)
		if(istype(P, /obj/item/weapon/stock_parts/micro_laser))
			harvest_speed = P.rating
		if(istype(P, /obj/item/weapon/stock_parts/capacitor))
			charge_use -= 10 * (P.rating - harvest_speed)
			charge_use = max(charge_use, 0)
		if(istype(P, /obj/item/weapon/stock_parts/scanning_module))
			harvest_speed += P.rating
		harvest_speed = harvest_speed/2
	cell = locate(/obj/item/weapon/cell/large) in component_parts


/obj/machinery/exploration/ADMS/attackby(obj/item/I, mob/user as mob)
	..()
	if(istype(I, /obj/item/weapon/computer_hardware/hard_drive/portable))//if the item is a portable disk
		if(inserted_disk)//and we already have a portable disk
			to_chat(user, "The ADMS already has a disk inserted.")//fail out
		else
			user.drop_item()
			I.loc = src
			inserted_disk = I
			component_parts += I
			to_chat(user, "You insert \the [I].")

			for(var/datum/computer_file/binary/P in inserted_disk.stored_files)
				if(istype(P, /datum/computer_file/binary/research_points))
					inserted_disk_file = P
					return
			inserted_disk_file = new/datum/computer_file/binary/research_points()
			inserted_disk_file.size = 0
			inserted_disk.store_file(inserted_disk_file)
	if(!active)
		if(default_deconstruction(I, user))
			return

		if(default_part_replacement(I, user))
			return

	if(!panel_open || active)
		return ..()

	if(istype(I, /obj/item/weapon/cell/large))
		if(cell)
			to_chat(user, "The ADMS already has a cell installed.")
		else
			user.drop_item()
			I.loc = src
			cell = I
			component_parts += I
			to_chat(user, "You install \the [I].")
		return


/obj/machinery/exploration/ADMS/attack_hand(mob/user as mob)
	if (panel_open && cell)
		to_chat(user, "You take out \the [cell].")
		cell.loc = get_turf(user)
		component_parts -= cell
		cell = null
		return
	else if(!inserted_disk)
		system_error("no data disk")//You need to have a disk inserted!
	else if(!panel_open)
		if(use_cell_power())
			active = !active
			if(active)
				visible_message(SPAN_NOTICE("\The [src] pings loudly, the sound echoing in the distance."))
			else
				visible_message(SPAN_NOTICE("\The [src] falls silent."))
		else
			system_error("charge error")
	else
		system_error("maintainence protocols enabled")//You must have the peanel closed

	update_icon()

//Handles ejecting the data disk, when able, will place and hand
/obj/machinery/exploration/ADMS/proc/eject_disk_action(mob/living/user)
	if(!inserted_disk)
		to_chat(usr, SPAN_NOTICE("No disk is inside."))
		return

	inserted_disk.forceMove(drop_location())
	component_parts -= inserted_disk
	to_chat(usr, SPAN_NOTICE("You remove \the [inserted_disk] from \the [src]."))

	inserted_disk = null
	inserted_disk_file = null

/obj/machinery/exploration/ADMS/verb/eject_disk()
	set name = "Eject Disk"
	set category = "Object"
	set src in view(1)
	if(inserted_disk)
		eject_disk_action()
	else
		to_chat(usr, SPAN_NOTICE("No disk is inside."))

/obj/machinery/exploration/ADMS/update_icon()
	if(active)
		icon_state = "ADMS-on"
	else
		icon_state = "ADMS"
	return

/datum/design/research/circuit/adms
	name = "Anomalous Data Measurement System"
	build_path = /obj/item/weapon/electronics/circuitboard/ADMS
	sort_string = "HAAAG"
	category = CAT_COMP
