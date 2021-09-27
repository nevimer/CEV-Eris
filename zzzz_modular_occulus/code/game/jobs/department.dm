/datum/department/church
	funding_source = "Church of Mekhane"

/datum/department/guild
	account_initial_balance = 12000

/datum/department/civilian
	name = "CEV Northern Light Civic"
	id = DEPARTMENT_CIVILIAN
	account_initial_balance = 2000 // Less vital than most departments and smaller
	account_budget = 1000 //A small stipend that the manager can distribute as he sees fit.
	/*
		This account pays out to club workers, hydroponics, and custodians.
		It is managed by The Club manager.

	*/

/obj/item/weapon/card/id/account/
	var/department

/obj/item/weapon/card/id/account/New()
	var/datum/money_account/department_account = department_accounts[department]
	if(department_account)
		associated_account_number = department_account.account_number //This only fails during setup!

/obj/item/weapon/card/id/account/command
	name = "CEV Northern Light banking card"
	desc = "A card that holds account information for the Northern Light command bank account."
	item_state = "gold_id"
	registered_name = "CEV Northern Light Command"
	department = DEPARTMENT_COMMAND

/obj/item/weapon/card/id/account/technomancers
	name = "Engineering Department banking card"
	desc = "A card that holds account information for the Northern Light engineering bank account."
	item_state = "id_ce"
	registered_name = "CEV Northern Light Engineering"
	department = DEPARTMENT_ENGINEERING

/obj/item/weapon/card/id/account/aegis
	name = "Aegis company banking card"
	desc = "A card that holds account information for the Cobalt Aegis bank account."
	item_state = "id_hos"
	registered_name = "Cobalt Aegis Security Mercenary Company"
	department = DEPARTMENT_SECURITY

/obj/item/weapon/card/id/account/medical
	name = "Medical Department banking card"
	desc = "A card that holds account information for the Nanotrasen Medical Divsion bank account."
	item_state = "id_cmo"
	registered_name = "Nanotrasen: Medical Division"
	department = DEPARTMENT_MEDICAL

/obj/item/weapon/card/id/account/research
	name = "Research Department banking card"
	desc = "A card that holds account information for the Nanotrasen Research Division bank account."
	item_state = "id_rd"
	registered_name = "Nanotrasen: Research Division"
	department = DEPARTMENT_SCIENCE

/obj/item/weapon/card/id/account/church
	name = "Church of the Mekhane banking card"
	desc = "A card that holds account information for the Church of Mekhane bank account."
	item_state = "id_chaplain"
	registered_name = "Church of Mekhane"
	department = DEPARTMENT_CHURCH

/obj/item/weapon/card/id/account/guild
	name = "Free Trade Union banking card"
	desc = "A card that holds account information for the Free Trade Union bank account."
	item_state = "gold_id"
	registered_name = "Free Trade Union"
	department = DEPARTMENT_GUILD

/obj/item/weapon/card/id/account/club
	name = "The Club banking card"
	desc = "A card that holds account information for The Club bank account."
	item_state = "id_hop"
	registered_name = "CEV Northern Light Civic"
	department = DEPARTMENT_CIVILIAN

/decl/hierarchy/outfit/job/captain
	backpack_contents = list(/obj/item/weapon/storage/box/ids = 1, /obj/item/weapon/tool/knife/dagger/ceremonial = 1, /obj/item/weapon/card/id/account/command = 1)

/decl/hierarchy/outfit/job/hop
	backpack_contents = list(/obj/item/weapon/storage/box/ids = 1, /obj/item/weapon/tool/knife/dagger/ceremonial = 1, /obj/item/weapon/card/id/account/club = 1)

/decl/hierarchy/outfit/job/engineering/exultant
	backpack_contents = list(/obj/item/weapon/card/id/account/technomancers = 1)

/decl/hierarchy/outfit/job/cargo/merchant
	backpack_contents = list(/obj/item/weapon/card/id/account/guild =1)

/decl/hierarchy/outfit/job/security/ihc
	backpack_contents = list(/obj/item/weapon/handcuffs = 1,/obj/item/ammo_magazine/magnum/rubber = 1,/obj/item/device/lighting/toggleable/flashlight/seclite = 1, /obj/item/weapon/cell/small/high = 2,  /obj/item/weapon/card/id/account/aegis = 1)

/decl/hierarchy/outfit/job/medical/cmo
	backpack_contents = list(/obj/item/weapon/card/id/account/medical = 1)

/decl/hierarchy/outfit/job/science/rd
	backpack_contents = list(/obj/item/weapon/oddity/secdocs = 1, /obj/item/weapon/card/id/account/research = 1)

/decl/hierarchy/outfit/job/church/chaplain
	backpack_contents = list(/obj/item/weapon/card/id/account/church = 1)

/decl/hierarchy/outfit/job/service/manager
	name = OUTFIT_JOB_NAME("Manager")
	uniform = /obj/item/clothing/under/rank/bartender
	id_type = /obj/item/weapon/card/id/white
	pda_type = /obj/item/modular_computer/pda/club_worker
	backpack_contents = list(/obj/item/ammo_casing/shotgun/beanbag = 4, /obj/item/weapon/card/id/account/club = 1)

/obj/structure/closet/secure_closet/reinforced/manager
	name = "club manager's closet"
	req_access = list(access_change_club)
	icon_state = "cabinet"
	icon_lock = "cabinet"

/obj/structure/closet/secure_closet/reinforced/manager/populate_contents()
	new /obj/item/clothing/under/rank/bartender(src)
	new /obj/item/clothing/shoes/color/black(src)
	new /obj/item/device/radio/headset/headset_service(src)
	new /obj/item/device/scanner/price(src)
	new /obj/item/weapon/storage/box/shotgunammo/beanbags(src)

