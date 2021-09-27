#define OBELISK_UPDATE_TIME 5 SECONDS

var/list/disciples = list()

/obj/item/weapon/implant/core_implant/cruciform
	name = "core implant"
	icon_state = "cruciform_green"
	desc = "Soul holder for anyone who can afford it. With the proper flair, this can be implanted to induct a new believer into Transhumanism."
	allowed_organs = list(BP_CHEST)
	implant_type = /obj/item/weapon/implant/core_implant/cruciform
	layer = ABOVE_MOB_LAYER
	access = list(access_nt_disciple)
	power = 50
	max_power = 50
	power_regen = 2/(1 MINUTES)
	price_tag = 500
	var/obj/item/weapon/cruciform_upgrade/upgrade

//	var/righteous_life = 0 Occulus Edit: Be yote
//	var/max_righteous_life = 100 Occulue Edit: Begone

/*/obj/item/weapon/implant/core_implant/cruciform/auto_restore_power() occulus edit - this is defined in the modular folder for us
	if(power >= max_power)
		return
	var/true_power_regen = power_regen
	if(GLOB.miracle_points > 0)
		true_power_regen += GLOB.miracle_points / (1 MINUTES)
	true_power_regen += max(round(wearer.stats.getStat(STAT_COG) / 4), 0) * (0.1 / 1 MINUTES)
	true_power_regen +=  power_regen * 1.5 * righteous_life / max_righteous_life
	restore_power(true_power_regen)

/obj/item/weapon/implant/core_implant/cruciform/proc/register_wearer() Occulus lives free and is happy
	RegisterSignal(wearer, COMSIG_CARBON_HAPPY, .proc/on_happy, TRUE)
	RegisterSignal(wearer, COMSIG_GROUP_RITUAL, .proc/on_ritual, TRUE)

/obj/item/weapon/implant/core_implant/cruciform/proc/unregister_wearer()
	UnregisterSignal(wearer, COMSIG_CARBON_HAPPY)
	UnregisterSignal(wearer, COMSIG_GROUP_RITUAL) Occulus knows prohibition doesn't work

/obj/item/weapon/implant/core_implant/cruciform/proc/on_happy(datum/reagent/happy, signal)
	if(istype(happy, /datum/reagent/ethanol))
		righteous_life = max(righteous_life - 0.1, 0)
	else if(istype(happy, /datum/reagent/drug))
		righteous_life = max(righteous_life - 0.5, 0) Occulus seek joy in the oneness that is the Mekhane

/obj/item/weapon/implant/core_implant/cruciform/proc/on_ritual()
	righteous_life = min(righteous_life + 20, max_righteous_life)We have no desire for this
*/

/obj/item/weapon/implant/core_implant/cruciform/install(mob/living/target, organ, mob/user)
	. = ..()
	if(.)
		target.stats.addPerk(/datum/perk/sanityboost)
//		register_wearer() Occulus Edit: Doesn't Exist

/obj/item/weapon/implant/core_implant/cruciform/uninstall()
//	unregister_wearer() Occulus Edit: We don't use this
	wearer.stats.removePerk(/datum/perk/sanityboost)
	return ..()

/obj/item/weapon/implant/core_implant/cruciform/get_mob_overlay(gender)
	gender = (gender == MALE) ? "m" : "f"
	return image('icons/mob/human_races/cyberlimbs/neotheology.dmi', "[icon_state]_[gender]")

/obj/item/weapon/implant/core_implant/cruciform/hard_eject()
	if(!ishuman(wearer))
		return
	var/mob/living/carbon/human/H = wearer
	if(H.stat == DEAD)
		return
	H.adjustBrainLoss(55+rand(5))
	H.adjustOxyLoss(100+rand(50))
	if(part)
		H.apply_damage(100+rand(75), BURN, part, used_weapon = src)
	H.apply_effect(40+rand(20), IRRADIATE, check_protection = 0)
	var/datum/effect/effect/system/spark_spread/s = new
	s.set_up(3, 1, src)
	s.start()

/obj/item/weapon/implant/core_implant/cruciform/activate()
	if(!wearer || active)
		return

	if(is_carrion(wearer))
		playsound(wearer.loc, 'sound/hallucinations/wail.ogg', 55, 1)
		wearer.gib()
		if(eotp)
			eotp.addObservation(200)
		return
	..()
	add_module(new CRUCIFORM_COMMON)
	update_data()
	disciples |= wearer
	var/datum/core_module/cruciform/cloning/M = get_module(CRUCIFORM_CLONING)
	if(M)
		M.write_wearer(wearer) //writes all needed data to cloning module
	if(ishuman(wearer)) //Eclipse add
		var/mob/living/carbon/human/H = wearer
		H.genetic_corruption = 0
	if(eotp)
		eotp.addObservation(50)
	return TRUE

/obj/item/weapon/implant/core_implant/cruciform/examine(mob/user) 
	..()
	var/datum/core_module/cruciform/cloning/data = get_module(CRUCIFORM_CLONING)
	if(data?.mind) // if there is cloning data and it has a mind
		to_chat(user, SPAN_NOTICE("This cruciform has been activated."))
		if(isghost(user) || (user in disciples))
			var/datum/mind/MN = data.mind
			if(MN.name) // if there is a mind and it also has a name
				to_chat(user, SPAN_NOTICE("It contains <b>[MN.name]</b>'s soul."))
			else
				to_chat(user, SPAN_DANGER("Something terrible has happened with this soul. Please notify somebody in charge."))
	else // no cloning data
		to_chat(user, "This cruciform has not yet been activated.")



/obj/item/weapon/implant/core_implant/cruciform/deactivate()
	if(!active || !wearer)
		return
	disciples.Remove(wearer)
	if(eotp)
		eotp.removeObservation(50)
	..()

/obj/item/weapon/implant/core_implant/cruciform/Process()
	..()
//	if(active && round(world.time) % 5 == 0)
//		remove_cyber()   -- Eclipse Edit
	if(wearer)
		if(wearer.stat == DEAD)
			deactivate()
		else if(ishuman(wearer)) //Occulus Edit Start
			var/mob/living/carbon/human/H = wearer
			if(H.genetic_corruption > 49) //SEVEN BY SEVEN
				H.genetic_corruption -= 1
//Occulus Edit End

/obj/item/weapon/implant/core_implant/cruciform/proc/transfer_soul()
	if(!wearer || !activated)
		return FALSE
	var/datum/core_module/cruciform/cloning/data = get_module(CRUCIFORM_CLONING)
	//if(wearer.dna.unique_enzymes == data.dna.unique_enzymes) Mekhanites are ultratranshumanists - Eclipse edit
/*	for(var/mob/M in GLOB.player_list)
		if(M.ckey == data.ckey)
			if(M.stat != DEAD)
				return FALSE  */
	var/datum/mind/MN = data.mind
	if(!istype(MN, /datum/mind))
		return
	MN.transfer_to(wearer)
	wearer.ckey = data.ckey
	for(var/datum/language/L in data.languages)
		wearer.add_language(L.name)
	update_data()
	if (activate())
		return TRUE

/*/obj/item/weapon/implant/core_implant/cruciform/proc/remove_cyber()
	if(!wearer)
		return
	for(var/obj/O in wearer)
		if(istype(O, /obj/item/organ/external))
			var/obj/item/organ/external/R = O
			if(!BP_IS_ROBOTIC(R))
				continue

			if(R.owner != wearer)
				continue
			wearer.visible_message(SPAN_DANGER("[wearer]'s [R.name] tears off."),
			SPAN_DANGER("Your [R.name] tears off."))
			R.droplimb()
		if(istype(O, /obj/item/weapon/implant))
			if(O == src)
				continue
			var/obj/item/weapon/implant/R = O
			if(R.wearer != wearer)
				continue
			if(R.cruciform_resist)
				continue
			wearer.visible_message(SPAN_DANGER("[R.name] rips through [wearer]'s [R.part]."),\
			SPAN_DANGER("[R.name] rips through your [R.part]."))
			R.part.take_damage(rand(20,40))
			R.uninstall()
			R.malfunction = MALFUNCTION_PERMANENT
	if(ishuman(wearer))
		var/mob/living/carbon/human/H = wearer
		H.update_implants()*/

/obj/item/weapon/implant/core_implant/cruciform/proc/update_data()
	if(!wearer)
		return

	add_module(new CRUCIFORM_CLONING)


//////////////////////////
//////////////////////////

/obj/item/weapon/implant/core_implant/cruciform/proc/make_common()
	remove_modules(CRUCIFORM_PRIEST)
	remove_modules(CRUCIFORM_INQUISITOR)
	remove_modules(/datum/core_module/cruciform/red_light)

/obj/item/weapon/implant/core_implant/cruciform/proc/make_priest()
	add_module(new CRUCIFORM_PRIEST)
	add_module(new CRUCIFORM_REDLIGHT)

/obj/item/weapon/implant/core_implant/cruciform/proc/make_inquisitor()
	add_module(new CRUCIFORM_PRIEST)
	add_module(new CRUCIFORM_INQUISITOR)
	add_module(new /datum/core_module/cruciform/uplink())
	remove_modules(/datum/core_module/cruciform/red_light)
