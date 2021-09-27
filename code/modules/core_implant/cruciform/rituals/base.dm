/datum/ritual/cruciform/base
	name = "cruciform"
	phrase = null
	implant_type = /obj/item/weapon/implant/core_implant/cruciform
	success_message = "On the verge of audibility you hear pleasant music, your mind clears up and the spirit grows stronger. Your prayer was heard."
	fail_message = "The Cruciform feels cold against your chest."
	category = "Common"
//	cooldown_time = 1 MINUTES


/datum/ritual/targeted/cruciform/base
	name = "cruciform targeted"
	phrase = null
	implant_type = /obj/item/weapon/implant/core_implant/cruciform
	category = "Common"


/datum/ritual/cruciform/base/relief
	name = "Relief"
	phrase = "Et si ambulavero in medio umbrae mortis non timebo mala"
	desc = "Short litany to relieve pain of the afflicted."
	power = 50
	ignore_stuttering = TRUE

/datum/ritual/cruciform/base/relief/perform(mob/living/carbon/human/H, obj/item/weapon/implant/core_implant/C)
	H.add_chemical_effect(CE_PAINKILLER, 10)
	set_personal_cooldown(H)
	return TRUE


/datum/ritual/cruciform/base/soul_hunger
	name = "Soul Hunger"
	phrase = "Panem nostrum cotidianum da nobis hodie"
	desc = "Litany of piligrims, helps better withstand hunger."
	power = 50

/datum/ritual/cruciform/base/soul_hunger/perform(mob/living/carbon/human/H, obj/item/weapon/implant/core_implant/C)
	H.nutrition += 100
	H.adjustToxLoss(10)	// OCCULUS EDIT - NERF THE FREE NUTRITION
//	set_personal_cooldown(H) Occulus Edit Haha no funni cooldown
	return TRUE


/datum/ritual/cruciform/occulus/entreaty//Occulus Edit, moved to utility
	name = "Entreaty"
	phrase = "Deus meus ut quid dereliquisti me"
	desc = "Call for help, that other cruciform bearers can hear."
	power = 50
	ignore_stuttering = TRUE

/datum/ritual/cruciform/occulus/entreaty/perform(mob/living/carbon/human/H, obj/item/weapon/implant/core_implant/C)//Occulus Edit, moved to utility
	for(var/mob/living/carbon/human/target in disciples)
		if(target == H)
			continue

		var/obj/item/weapon/implant/core_implant/cruciform/CI = target.get_core_implant()
		var/area/t = get_area(H)

		if((istype(CI) && CI.get_module(CRUCIFORM_PRIEST)) || prob(50))
			to_chat(target, SPAN_DANGER("[H], faithful cruciform follower, cries for salvation at [t.name]!"))
	set_personal_cooldown(H)
	return TRUE

/datum/ritual/cruciform/occulus/reveal //Occulus Edit, moved to utility
	name = "Reveal Adversaries"
	phrase = "Et fumus tormentorum eorum ascendet in saecula saeculorum: nec habent requiem die ac nocte, qui adoraverunt bestiam, et imaginem ejus, et si quis acceperit caracterem nominis ejus."
	desc = "Gain knowledge of your surroundings, to reveal evil in people and places. Can tell you about hostile creatures around you, rarely can help you spot traps, and sometimes let you sense a carrion."
	power = 35

/datum/ritual/cruciform/occulus/reveal/perform(mob/living/carbon/human/H, obj/item/weapon/implant/core_implant/C)//Occulus Edit, moved to utility
	var/was_triggired = FALSE
	log_and_message_admins("performed reveal litany")
	if(prob(20)) //Aditional fail chance that hidded from user
		to_chat(H, SPAN_NOTICE("There is nothing there. You feel safe."))
		return TRUE
	for (var/mob/living/carbon/superior_animal/S in range(14, H))
		if (S.stat != DEAD)
			to_chat(H, SPAN_WARNING("Adversaries are near. You can feel something nasty and hostile."))
			was_triggired = TRUE
			break

	if (!was_triggired)
		for (var/mob/living/simple_animal/hostile/S in range(14, H))
			if (S.stat != DEAD)
				to_chat(H, SPAN_WARNING("Adversaries are near. You can feel something nasty and hostile."))
				was_triggired = TRUE
				break
	if (prob(80) && (locate(/obj/structure/wire_splicing) in view(7, H))) //Add more traps later
		to_chat(H, SPAN_WARNING("Something wrong with this area. Tread carefully."))
		was_triggired = TRUE
	if (prob(20))
		for(var/mob/living/carbon/human/target in range(14, H))
			for(var/organ in target.organs)
				if (organ in subtypesof(/obj/item/organ/internal/carrion))
					to_chat(H, SPAN_DANGER("Something's ire is upon you! Twisted and evil mind touches you for a moment, leaving you in cold sweat."))
					was_triggired = TRUE
					break
	if (!was_triggired)
		to_chat(H, SPAN_NOTICE("There is nothing there. You feel safe."))

	set_personal_cooldown(H)
	return TRUE

/datum/ritual/cruciform/occulus/sense_cruciform//Occulus Edit, moved to utility
	name = "Cruciform sense"
	phrase = "Et si medio umbrae"
	desc = "Very short litany to identify NeoTheology followers. Targets individuals directly in front of caster or being grabbed by caster."
	power = 20

/datum/ritual/cruciform/occulus/sense_cruciform/perform(mob/living/carbon/human/H, obj/item/weapon/implant/core_implant/C)//Occulus Edit, moved to utility
	var/list/mob/living/carbon/human/humans = list()
	for(var/mob/living/carbon/human/T in view(7, get_turf(H)))
		humans.Add(T)
	if(humans.len)
		for(var/mob/living/carbon/human/T in humans)
			var/obj/item/weapon/implant/core_implant/cruciform/CI = T.get_core_implant(/obj/item/weapon/implant/core_implant/cruciform)
			if(CI)
				to_chat(H, "<span class='rose'>[T] has a cruciform installed.</span>")
	else
		fail("No target. Make sure your target is either in front of you or grabbed by you.", H, C)
		return FALSE
	set_personal_cooldown(H)
	return TRUE

/datum/ritual/cruciform/base/revelation
	name = "Revelation"
	phrase = "Patris ostendere viam"
	desc = "A person close to you will have a vision that could increase their sanity... or that's what you hope will happen."
	power = 50

/datum/ritual/cruciform/base/revelation/perform(mob/living/carbon/human/H, obj/item/weapon/implant/core_implant/C)
	var/mob/living/carbon/human/T = get_front_human_in_range(H, 4)
	//if(!T || !T.client)
	if(!T)
		fail("No target.", H, C)
		return FALSE
	T.hallucination(30,50)	//OCCULUS EDIT - Tweaks to be more in line with mindwipe
	var/sanity_lost = rand(0,10)	//OCCULUS EDIT - Makes it so that it won't tank someone's sanity, but isn't as powerful
	T.druggy = max(T.druggy, 10)
	T.sanity.changeLevel(sanity_lost)
//OCCULUS EDIT START - Add some feedback for the target
	if(sanity_lost > 0)
		to_chat(T, "<span class='info'>A sensation of dizziness washes over you, relieving you of your woes ever so slightly</span>")
	else
		to_chat(T, "<span class='info'>A sensation of dizziness washes over you.</span>")
//OCCULUS EDIT END - Add some feedback for the target
	//SEND_SIGNAL(H, COMSIG_RITUAL, src, T)	//OCCULUS EDIT - We don't have individual objectives here
	return TRUE

/datum/ritual/cruciform/base/install_upgrade
	name = "Install Cruciform Upgrade"
	phrase = "Deum benedicite mihi voluntas in suum donum"
	desc = "This litany will command a cruciform upgrade to attach to follower's cruciform. Follower must lie on altar and upgrade must be near them."
	power = 20

/datum/ritual/cruciform/base/install_upgrade/perform(mob/living/carbon/human/user, obj/item/weapon/implant/core_implant/C)
	var/mob/living/carbon/human/H = get_victim(user)
	var/obj/item/weapon/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/weapon/implant/core_implant/cruciform, FALSE)
	if(!CI)
		fail("[H] don't have a cruciform installed.", user, C)
		return FALSE
	if(CI.upgrade)
		fail("Cruciform already has an upgrade installed.", user, C)
		return FALSE

	var/list/L = get_front(user)

	var/obj/item/weapon/cruciform_upgrade/CU = locate(/obj/item/weapon/cruciform_upgrade) in L

	if(!CU)
		fail("There is no cruciform upgrade nearby.", user, C)
		return FALSE

	if(!(H in L))
		fail("Cruciform upgrade is too far from [H].", user, C)
		return FALSE

	if(CU.active)
		fail("Cruciform upgrade is already active.", user, C)
		return FALSE

	if(!H.lying || !locate(/obj/machinery/optable/altar) in L)
		fail("[H] must lie on the altar.", user, C)
		return FALSE

	for(var/obj/item/clothing/CL in H)
		if(H.l_hand == CL || H.r_hand == CL)
			continue
		fail("[H] must be undressed.", user, C)
		return FALSE



	if(!CU.install(H, CI) || CU.wearer != H)
		fail("Commitment failed.", user, C)
		return FALSE

	return TRUE

/datum/ritual/cruciform/base/uninstall_upgrade
	name = "Uninstall Cruciform Upgrade"
	phrase = "Deus meus ut quid habebant affectus."
	desc = "This litany will command cruciform uprgrade to detach from cruciform."
	power = 20

/datum/ritual/cruciform/base/uninstall_upgrade/perform(mob/living/carbon/human/user, obj/item/weapon/implant/core_implant/C)
	var/mob/living/carbon/human/H = get_victim(user)
	var/obj/item/weapon/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/weapon/implant/core_implant/cruciform, FALSE)
	var/list/L = get_front(user)

	if(!CI)
		fail("There is no cruciform on this one", user, C)
		return FALSE

	if(!CI.upgrade)
		fail("Cruciform upgrade is not installed.", user, C)
		return FALSE

	if(!H.lying || !locate(/obj/machinery/optable/altar) in L)
		fail("[H] must lie on the altar.", user, C)
		return FALSE

	if(CI.upgrade.uninstall() || CI.upgrade)
		fail("Commitment failed.", user, C)
		return FALSE

	return TRUE

/datum/ritual/cruciform/base/reincarnation
	name = "Reincarnation"
	phrase = "Vetus moritur et onus hoc levaverit"
	desc = "A reunion of a spirit with it's new body, ritual of activation of a crucifrom, lying on the body. The process requires NeoTheology's special altar on which a body stripped of clothes is to be placed."
	var/clone_damage = 60

/datum/ritual/cruciform/base/reincarnation/perform(mob/living/carbon/human/user, obj/item/weapon/implant/core_implant/C)
	var/obj/item/weapon/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/weapon/implant/core_implant/cruciform, FALSE)

	if(!CI)
		fail("There is no cruciform on this one", user, C)
		return FALSE

	var/datum/core_module/cruciform/cloning/data = CI.get_module(CRUCIFORM_CLONING)

	if(!CI.wearer)
		fail("Cruciform is not installed.", user, C)
		return FALSE

	if(!CI.activated)
		fail("This cruciform doesn't have soul inside.", user, C)
		return FALSE

	if(CI.active)
		fail("This cruciform already activated.", user, C)
		return FALSE

	if(CI.wearer.stat == DEAD)
		fail("Soul cannot move to dead body.", user, C)
		return FALSE

	var/datum/mind/MN = data.mind
	if(!istype(MN, /datum/mind))
		fail("Soul is lost.", user, C)
		return FALSE
	if(MN.active)
		if(data.ckey != ckey(MN.key))
			fail("Soul is lost.", user, C)
			return FALSE
	if(MN.current && MN.current.stat != DEAD)
		fail("Soul is lost.", user, C)
		return FALSE

	var/succ = CI.transfer_soul()

	if(!succ)
		fail("Soul transfer failed.", user, C)
		return FALSE


	return TRUE

/datum/ritual/cruciform/base/install
	name = "Commitment"
	phrase = "Unde ipse Dominus dabit vobis signum"
	desc = "This litany will command cruciform attach to person, so you can perform Reincarnation or Epiphany. Cruciform must lay near them."

/datum/ritual/cruciform/base/install/perform(mob/living/carbon/human/user, obj/item/weapon/implant/core_implant/C)
	var/mob/living/carbon/human/H = get_victim(user)
	var/obj/item/weapon/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/weapon/implant/core_implant/cruciform, FALSE)
	if(CI)
		fail("[H] already have a cruciform installed.", user, C)
		return FALSE

	var/list/L = get_front(user)

	CI = locate(/obj/item/weapon/implant/core_implant/cruciform) in L

	if(!CI)
		fail("There is no cruciform on this one", user, C)
		return FALSE

	if (H.stat == DEAD)
		fail("It is too late for this one, the soul has already left the vessel", user, C)
		return FALSE

	if(!(H in L))
		fail("Cruciform is too far from [H].", user, C)
		return FALSE

	if(CI.active)
		fail("Cruciform already active.", user, C)
		return FALSE

	if(!H.lying || !locate(/obj/machinery/optable/altar) in L)
		fail("[H] must lie on the altar.", user, C)
		return FALSE

	for(var/obj/item/clothing/CL in H)
		if(H.l_hand == CL || H.r_hand == CL)
			continue
		fail("[H] must be undressed.", user, C)
		return FALSE


	if(!CI.install(H, BP_CHEST, user) || CI.wearer != H)
		fail("Commitment failed.", user, C)
		return FALSE

	if(ishuman(H))
		var/mob/living/carbon/human/M = H
		var/obj/item/organ/external/E = M.organs_by_name[BP_CHEST]
		for (var/i = 0; i < 5;i++)
			E.take_damage(5, sharp = FALSE)
			//Deal 25 damage in five hits. Using multiple small hits mostly prevents internal damage

		M.custom_pain("You feel the nails of the cruciform drive into your ribs!",1)
		M.update_implants()
		M.updatehealth()

	return TRUE
