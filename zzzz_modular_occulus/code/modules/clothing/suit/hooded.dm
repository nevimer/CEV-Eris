obj/item/clothing/suit/storage/hooded
	var/obj/item/clothing/head/hood
	var/hoodtype = null //so the hoodies can override this
	var/hood_up = FALSE
	var/toggleicon
	action_button_name = "Toggle Hood"
	bad_type = /obj/item/clothing/suit/storage/hooded	// so it does not spawn this cursed prototype item

/obj/item/clothing/suit/storage/hooded/New()
	toggleicon = "[initial(icon_state)]"
	MakeHood()
	..()

/obj/item/clothing/suit/storage/hooded/Destroy()
	qdel(hood)
	return ..()

/obj/item/clothing/suit/storage/hooded/proc/MakeHood()
	if(!hood)
		var/obj/item/clothing/head/hood/H = new hoodtype(src)
		hood = H

/obj/item/clothing/suit/storage/hooded/ui_action_click()
	ToggleHood()

/obj/item/clothing/suit/storage/hooded/equipped(mob/user, slot)
	if(slot != slot_wear_suit)
		RemoveHood()
	..()

/obj/item/clothing/suit/storage/hooded/proc/RemoveHood()
	icon_state = toggleicon
	hood_up = FALSE
	hood.canremove = TRUE // This shouldn't matter anyways but just incase.
	if(ishuman(hood.loc))
		var/mob/living/carbon/H = hood.loc
		H.unEquip(hood, 1)
		H.update_inv_wear_suit()
	hood.forceMove(src)

/obj/item/clothing/suit/storage/hooded/dropped()
	RemoveHood()

/obj/item/clothing/suit/storage/hooded/proc/ToggleHood()
	if(!hood_up)
		if(ishuman(loc))
			var/mob/living/carbon/human/H = src.loc
			if(H.wear_suit != src)
				to_chat(H, "<span class='warning'>You must be wearing [src] to put up the hood!</span>")
				return
			if(H.head)
				to_chat(H, "<span class='warning'>You're already wearing something on your head!</span>")
				return
			else
				H.equip_to_slot_if_possible(hood,slot_head,0,0,1)
				hood_up = TRUE
				hood.canremove = FALSE
				icon_state = "[toggleicon]_t"
				H.update_inv_wear_suit()
	else
		RemoveHood()

/* For anyone adding hooded clothes, take note.
You need 2 versions of the sprite, one with the normal icon and one with icon name and '_t' at the end of it,
for both Item and mob sprited versions.   EX: sleeveless_red & sleeveless_red_t
Else, it won't work properly.*/


/obj/item/clothing/suit/storage/hooded/sleeveless
	name = "red sleeveless jacket"
	desc = "A red hooded jacket with no sleeves. Stylized with a white paw print on the back."
	icon = 'zzzz_modular_occulus/icons/inventory/suit/jacket.dmi'
	icon_state = "sleeveless_red"
	icon_override = 'zzzz_modular_occulus/icons/inventory/suit/jacketmob.dmi'
	icon_override_female = 'zzzz_modular_occulus/icons/inventory/suit/jacketmob_fem.dmi'
	hoodtype =	/obj/item/clothing/head/hood/sleeveless
	min_cold_protection_temperature = T0C - 20	// The other hoodies seem to have this, so might as well!
	cold_protection = UPPER_TORSO|LOWER_TORSO
	style = STYLE_HIGH

/obj/item/clothing/suit/storage/hooded/sleeveless/black
	name = "black sleeveless jacket"
	desc = "A black hooded jacket with no sleeves. Stylized with a white paw print on the back."
	icon_state = "sleeveless_black"
	hoodtype =	/obj/item/clothing/head/hood/sleeveless/black

/obj/item/clothing/suit/storage/hooded/sleeveless/blue
	name = "blue sleeveless jacket"
	desc = "A blue hooded jacket with no sleeves. Stylized with a white paw print on the back."
	icon_state = "sleeveless_blue"
	hoodtype =	/obj/item/clothing/head/hood/sleeveless/blue

/obj/item/clothing/suit/storage/hooded/sleeveless/yellow
	name = "yellow sleeveless jacket"
	desc = "A yellow hooded jacket with no sleeves. Stylized with a white paw print on the back."
	icon_state = "sleeveless_yellow"
	hoodtype =	/obj/item/clothing/head/hood/sleeveless/yellow

/obj/item/clothing/suit/storage/hooded/sleeveless/white
	name = "white sleeveless jacket"
	desc = "A white hooded jacket with no sleeves. Stylized with a red paw print on the back."
	icon_state = "sleeveless_white"
	hoodtype =	/obj/item/clothing/head/hood/sleeveless/white
