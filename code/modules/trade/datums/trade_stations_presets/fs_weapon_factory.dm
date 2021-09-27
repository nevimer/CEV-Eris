/datum/trade_station/fs_factory
	name_pool = list("FSTB 'Kaida'" = "Frozen Star Trade Beacon 'Kaida'. Maybe they have an extra batch of weapons?")
	markup = 0.4
	assortiment = list(
		"Projectiles" = list(
			/obj/item/weapon/gun/projectile/automatic/ak47/fs,
			/obj/item/weapon/gun/projectile/automatic/atreides,
			/obj/item/weapon/gun/projectile/automatic/molly,
			/obj/item/weapon/gun/projectile/automatic/sol,
			/obj/item/weapon/gun/projectile/automatic/straylight,
			/obj/item/weapon/gun/projectile/automatic/wintermute,
			/obj/item/weapon/gun/projectile/automatic/z8,
			/obj/item/weapon/gun/projectile/avasarala,
			/obj/item/weapon/gun/projectile/selfload,
			/obj/item/weapon/gun/projectile/colt,
			/obj/item/weapon/gun/projectile/giskard,
			/obj/item/weapon/gun/projectile/lamia,
			/obj/item/weapon/gun/projectile/mandella,
			/obj/item/weapon/gun/projectile/olivaw,
			/obj/item/weapon/gun/projectile/paco,
			/obj/item/weapon/gun/projectile/revolver/consul,
			/obj/item/weapon/gun/projectile/revolver/deckard,
			/obj/item/weapon/gun/projectile/revolver/havelock,
			/obj/item/weapon/gun/projectile/revolver/mateba,
			/obj/item/weapon/gun/projectile/revolver,
			/obj/item/weapon/gun/projectile/shotgun/bull,
			/obj/item/weapon/gun/projectile/shotgun/pump/gladstone,
			/obj/item/weapon/gun/projectile/shotgun/pump,
		),
		"Ammunition" = list(
			/obj/item/ammo_magazine/ammobox/magnum = custom_good_amount_range(list(1, 10)),
			/obj/item/ammo_magazine/slmagnum = custom_good_amount_range(list(1, 10)),
			/obj/item/ammo_magazine/ammobox/magnum/rubber = custom_good_amount_range(list(1, 10)),
			/obj/item/ammo_magazine/slmagnum/rubber = custom_good_amount_range(list(1, 10)),

			/obj/item/ammo_magazine/m12,
			/obj/item/ammo_magazine/m12/beanbag,
			/obj/item/ammo_magazine/lrifle,
			/obj/item/ammo_magazine/smg,
			/obj/item/ammo_magazine/pistol,
			/obj/item/ammo_magazine/hpistol
		),
		category_data("Projectiles", list(SPAWN_FS_PROJECTILE)),
		category_data("Shotguns", list(SPAWN_FS_SHOTGUN)),
		category_data("Energy", list(SPAWN_FS_ENERGY)),
		"Grenades" = list(
			/obj/item/weapon/gun/launcher/grenade/lenar,
			/obj/item/weapon/grenade/chem_grenade/teargas,
			/obj/item/weapon/grenade/empgrenade/low_yield,
			/obj/item/weapon/grenade/flashbang,
			/obj/item/weapon/grenade/smokebomb
		),
	)
	offer_types = list(
	)
