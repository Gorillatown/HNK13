/datum/job/weebcity/deputy
	title = "Deputy"
	total_positions = 2
	spawn_positions = 2
	selection_color = "#92ff9b"
	supervisors = "The Sheriff & The Mayor."
	description = "Enforce the Mayor's law upon the Town with the assistance of your fellow Deputies by any means possible."
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/weebcity/deputy

	display_order = JOB_DISPLAY_ORDER_DEPUTY

/datum/outfit/job/weebcity/deputy
	name = "_Town Deputy"
	jobtype = /datum/job/weebcity/deputy

	id = 		 /obj/item/card/id/ms13/deputy
	head = 	     /obj/item/clothing/head/helmet/ms13/utilitycap/deputy
	suit =       /obj/item/clothing/suit/ms13/ljacket/brown/armored
	uniform =    /obj/item/clothing/under/ms13/vaultsuit
	gloves = 	 /obj/item/clothing/gloves/ms13/vault
	shoes =  	 /obj/item/clothing/shoes/ms13/military/vault
	back =	 	 /obj/item/storage/backpack/satchel/leather

	belt =	 /obj/item/storage/belt/holster/ms13/sheriff/full_44
	suit_store = /obj/item/gun/ballistic/shotgun/ms13/lever/cowboy
	r_pocket = /obj/item/ammo_box/ms13/tube357
	l_pocket = /obj/item/ammo_box/ms13/tube357

/datum/outfit/job/weebcity/deputy/pre_equip(mob/living/carbon/human/H)
	..()
