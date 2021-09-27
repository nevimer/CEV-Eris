/obj/item/weapon/storage/pouch/small_generic
	desc = "Can hold a handful of objects."
	price_tag = 500

/obj/item/weapon/storage/pouch/medium_generic
	desc = "Can hold a fair number of small objects."
	price_tag = 1000

/obj/item/weapon/storage/pouch/large_generic
	price_tag = 1500

/obj/item/weapon/storage/pouch/baton_holster
	price_tag = 200
	can_hold = list(
		/obj/item/weapon/tool/baton,
		/obj/item/weapon/melee,
		/obj/item/weapon/tool/crowbar,
		/obj/item/device/lighting/toggleable/flashlight,
		/obj/item/weapon/tool/shovel/spade,
		/obj/item/stack/rods
		)

/obj/item/clothing/suit
	allowed = list(
		/obj/item/weapon/clipboard,
		/obj/item/weapon/storage/pouch,
		/obj/item/weapon/gun,
		/obj/item/weapon/melee,
		/obj/item/weapon/material,
		/obj/item/ammo_magazine,
		/obj/item/ammo_casing,
		/obj/item/weapon/handcuffs,
		/obj/item/weapon/tank,
		/obj/item/device/suit_cooling_unit,
		/obj/item/weapon/cell,
		/obj/item/weapon/storage/fancy,
		/obj/item/weapon/flamethrower,
		/obj/item/device/lighting,
		/obj/item/device/scanner,
		/obj/item/weapon/reagent_containers/spray,
		/obj/item/device/radio,
		/obj/item/clothing/mask,
		/obj/item/weapon/storage/sheath)

/obj/item/weapon/storage/sheath
	price_tag = 200
	can_hold = list(
		/obj/item/weapon/tool/sword/,
		/obj/item/weapon/tool/knife/)
	cant_hold = list()
	slot_flags = SLOT_BELT | SLOT_POCKET | SLOT_BACK

/obj/item/weapon/tool/sword
	w_class = ITEM_SIZE_BULKY

/obj/item/weapon/storage/pouch/fanny
	name = "fannypack"
	desc = "An economical solution for general purpose belt-located storage. Holds less than a large pouch."
	icon = 'zzzz_modular_occulus/icons/inventory/pockets/icon.dmi'
	icon_state = "fanny"
	item_state = "large_generic" //Doesn't really exist AFAIK so irrelevant.
	matter = list(MATERIAL_BIOMATTER = 30, MATERIAL_STEEL = 8 )
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BELT | SLOT_DENYPOCKET
	storage_slots = null //Uses generic capacity
	max_storage_space = DEFAULT_SMALL_STORAGE * 1.25
	max_w_class = ITEM_SIZE_NORMAL
	rarity_value = 60
	price_tag = 1000

/obj/item/weapon/storage/pouch/medical_supply
	price_tag = 300
	storage_slots = 4

/obj/item/weapon/storage/pouch/engineering_tools
	price_tag = 300

/obj/item/weapon/storage/pouch/engineering_supply
	price_tag = 600

/obj/item/weapon/storage/pouch/ammo
	storage_slots = 5
	price_tag = 300

/obj/item/weapon/storage/pouch/tubular
	price_tag = 600

/obj/item/weapon/storage/pouch/pistol_holster
	price_tag = 200

/obj/item/weapon/storage/pouch/holding
	price_tag = 3000

/obj/item/weapon/storage/pouch/gun_part
	price_tag = 300
