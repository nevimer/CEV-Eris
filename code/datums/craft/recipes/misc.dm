/datum/craft_recipe/wall_girders
	name = "wall girder"
	result = /obj/structure/girder
	time = WORKTIME_NORMAL
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_STEEL)
	)
	flags = CRAFT_ON_FLOOR|CRAFT_ONE_PER_TURF
	related_stats = list(STAT_MEC)

/datum/craft_recipe/wall_girders/low
	name = "low wall girder"
	result = /obj/structure/girder/low
	time = WORKTIME_FAST
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_STEEL)
	)
	related_stats = list(STAT_MEC)

/datum/craft_recipe/kitchen_spike
	name = "Meat spike"
	result = /obj/structure/kitchenspike
	time = WORKTIME_NORMAL
	steps = list(
		list(/obj/item/stack/rods, 3),
		list(QUALITY_WELDING, 20, 50)
	)
	flags = CRAFT_ON_FLOOR|CRAFT_ONE_PER_TURF
	related_stats = list(STAT_MEC)

/datum/craft_recipe/metal_rod
	name = "metal rod"
	result = /obj/item/stack/rods
	time = 0
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_STEEL)
	)
	flags = CRAFT_BATCH
	related_stats = list(STAT_COG)

/datum/craft_recipe/box
	name = "box"
	result = /obj/item/weapon/storage/box
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD)
	)
	related_stats = list(STAT_COG)

/datum/craft_recipe/bone_braces
	name = "bone braces"
	result = /obj/item/bone_brace
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTEEL),
		list(QUALITY_WELDING, 20, 50),
		list(QUALITY_WIRE_CUTTING, 10, 120)
	)
	related_stats = list(STAT_COG, STAT_BIO, STAT_MEC)

/datum/craft_recipe/plastic_bag
	name = "plastic bag"
	result = /obj/item/weapon/storage/bag/plastic
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTIC)
	)
	related_stats = list(STAT_COG)

/datum/craft_recipe/blood_pack
	name = "blood pack"
	result = /obj/item/weapon/reagent_containers/blood/empty
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_PLASTIC)
	)
	related_stats = list(STAT_COG)

/datum/craft_recipe/ashtray
	name = "ashtray"
	result = /obj/item/weapon/material/ashtray
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_STEEL)
	)
	related_stats = list(STAT_COG)

/datum/craft_recipe/beehive_assembly
	name = "beehive assembly"
	result = /obj/item/beehive_assembly
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_WOOD)
	)
	related_stats = list(STAT_MEC)

/datum/craft_recipe/beehive_frame
	name = "beehive frame"
	result = /obj/item/honey_frame
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_WOOD)
	)
	related_stats = list(STAT_MEC)

/datum/craft_recipe/canister
	name = "canister"
	result = /obj/machinery/portable_atmospherics/canister/empty
	flags = CRAFT_ON_FLOOR|CRAFT_ONE_PER_TURF
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_STEEL)
	)
	related_stats = list(STAT_MEC)

/datum/craft_recipe/cannon_frame
	name = "cannon frame"
	result = /obj/item/weapon/cannonframe
	flags = CRAFT_ON_FLOOR|CRAFT_ONE_PER_TURF
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_STEEL)
	)
	related_stats = list(STAT_MEC)

/datum/craft_recipe/folder
	name = "grey folder"
	result = /obj/item/weapon/folder
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD)
	)
	related_stats = list(STAT_COG)

/datum/craft_recipe/folder/blue
	name = "blue folder"
	result = /obj/item/weapon/folder/blue


/datum/craft_recipe/folder/red
	name = "red folder"
	result = /obj/item/weapon/folder/red


/datum/craft_recipe/folder/cyan
	name = "cyan folder"
	result = /obj/item/weapon/folder/cyan


/datum/craft_recipe/folder/yellow
	name = "yellow folder"
	result = /obj/item/weapon/folder/yellow


/datum/craft_recipe/bandage
	name = "bandages"
	result = /obj/item/stack/medical/bruise_pack/handmade
	steps = list(
		list(/obj/item/clothing, 1, time = 30)
	)
	related_stats = list(STAT_COG)

/datum/craft_recipe/handmade_handtele
	name = "cheap hand-tele"
	result = /obj/item/weapon/hand_tele/handmade
	steps = list(
		list(CRAFT_MATERIAL, 6, MATERIAL_PLASTIC, "time" = 30),
		list(CRAFT_MATERIAL, 2, MATERIAL_GLASS, "time" = 10),
		list(/obj/item/weapon/electronics/circuitboard, 1, "time" = 20),
		list(/obj/item/weapon/stock_parts/subspace/crystal, 1),
		list(/obj/item/weapon/stock_parts/capacitor, 1),
		list(/obj/item/weapon/cell/small, 1),
		list(/obj/item/stack/cable_coil, 5, "time" = 20)
	)
	related_stats = list(STAT_COG)

/datum/craft_recipe/tray
	name = "dinner tray"
	result = /obj/item/weapon/tray
	steps = list(
		list(CRAFT_MATERIAL, 1, MATERIAL_STEEL, "time" = 40),
		list(QUALITY_WIRE_CUTTING, 10, 120)
	)
	related_stats = list(STAT_COG)


//You build a frame from rods, add metal shelves, plastic wheels and handles
/datum/craft_recipe/janicart
	name = "janitorial cart"
	result = /obj/structure/janitorialcart
	flags = CRAFT_ON_FLOOR|CRAFT_ONE_PER_TURF
	steps = list(
		list(/obj/item/stack/rods, 20),
		list(QUALITY_SCREW_DRIVING, 10, 60),
		list(CRAFT_MATERIAL, 10, MATERIAL_STEEL, "time" = 40),
		list(QUALITY_BOLT_TURNING, 10, 60),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTIC, "time" = 40),
		list(QUALITY_BOLT_TURNING, 10, 60)
	)
	related_stats = list(STAT_COG)


//Cut variously sized bits of plastic down to size, tape them together, and then use a welder to melt gaps
//It just works!
/datum/craft_recipe/mopbucket
	name = "mop bucket"
	result = /obj/structure/mopbucket
	flags = CRAFT_ON_FLOOR|CRAFT_ONE_PER_TURF
	steps = list(
		list(CRAFT_MATERIAL, 15, MATERIAL_PLASTIC, "time" = 40),
		list(QUALITY_SEALING, 10, 60),
		list(QUALITY_WELDING, 10, 60)
	)
	related_stats = list(STAT_COG)


//You get some article of clothing and shred it with a blade to make a mophead. Add in some metal rods for a handle
/datum/craft_recipe/mop
	name = "mop"
	result = /obj/item/weapon/mop
	steps = list(
		list(/obj/item/clothing, 1, time = 30),
		list(QUALITY_CUTTING, 10, 120),
		list(/obj/item/stack/rods, 2),
		list(QUALITY_BOLT_TURNING, 10, 60)
	)
	related_stats = list(STAT_COG)

//Make a drill bit with some material and a welder! So you won't need to print a whole new exosuit drill when your head snaps.

/datum/craft_recipe/drill_head
	name = "steel drill head"
	result = /obj/item/weapon/material/drill_head
	time = WORKTIME_NORMAL
	steps = list(
		list(CRAFT_MATERIAL, 6, MATERIAL_STEEL, "time" = 30),
		list(QUALITY_WELDING, 10, 60)
	)
	related_stats = list(STAT_MEC)

/datum/craft_recipe/drill_head/plasteel
	name = "plasteel drill head"
	result = /obj/item/weapon/material/drill_head/plasteel
	steps = list(
		list(CRAFT_MATERIAL, 6, MATERIAL_PLASTEEL, "time" = 30),
		list(QUALITY_WELDING, 10, 60)
	)


/datum/craft_recipe/drill_head/diamond
	name = "diamond drill head"
	result = /obj/item/weapon/material/drill_head/diamond
	steps = list(
		list(CRAFT_MATERIAL, 6, MATERIAL_DIAMOND, "time" = 30),
		list(QUALITY_WELDING, 10, 60)
	)


/datum/craft_recipe/pipe
	name = "Smoking pipe"
	result = /obj/item/clothing/mask/smokable/pipe
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_WOOD, "time" = 0),
		list(QUALITY_CUTTING, 10, 10)
	)
	related_stats = list(STAT_COG)
/*/datum/craft_recipe/makeshift_leg
	name = "Makeshift prosthetic left leg"
	result = /obj/item/organ/external/robotic/makeshift/l_leg
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_STEEL, "time" = 0),
		list(QUALITY_CUTTING, 10, 10),
		list(QUALITY_WELDING, 10, 10),
		list(/obj/item/stack/cable_coil, 5, "time" = 0),
		list(QUALITY_WIRE_CUTTING, 10, 10),
		list(/obj/item/weapon/stock_parts/manipulator, 1),
		list(QUALITY_PULSING, 10, 10),
		list(/obj/item/weapon/reagent_containers/glass/bucket, 1)
	)
	related_stats = list(STAT_MEC)

/datum/craft_recipe/makeshift_leg/right
	name = "Makeshift prosthetic right leg"
	result = /obj/item/organ/external/robotic/makeshift/r_leg

/datum/craft_recipe/makeshift_arm
	name = "Makeshift prosthetic left arm"
	result = /obj/item/organ/external/robotic/makeshift/l_arm
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_STEEL, "time" = 0),
		list(QUALITY_CUTTING, 10, 10),
		list(QUALITY_WELDING, 10, 10),
		list(/obj/item/stack/cable_coil, 5, "time" = 0),
		list(QUALITY_WIRE_CUTTING, 10, 10),
		list(/obj/item/weapon/stock_parts/manipulator, 1),
		list(QUALITY_PULSING, 10, 10),
		list(/obj/item/weapon/tool/knife/hook, 1)
	)
	related_stats = list(STAT_MEC)

/datum/craft_recipe/makeshift_arm/right
	name = "Makeshift prosthetic right arm"
	result = /obj/item/organ/external/robotic/makeshift/r_arm*/

 /datum/craft_recipe/gun/guns_craft_frame
	name = "Gun assembly"
	result = /obj/item/craft_frame/guns
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_PLASTEEL, "time" = 30),
		list(QUALITY_WELDING, 10, 10)
	)
	related_stats = list(STAT_MEC)
