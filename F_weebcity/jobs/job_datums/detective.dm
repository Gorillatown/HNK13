/datum/job/weebcity/detective
	title = "Detective"
	total_positions = 1
	spawn_positions = 1
	selection_color = "#92ff9b"
	supervisors = "The Sheriff & The Mayor."
	description = "Investigate findings, murders and mysteries, while also keeping the town safe."
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/weebcity/detective

	display_order = JOB_DISPLAY_ORDER_DETECTIVE

/datum/outfit/job/weebcity/detective
	name = "_Town Detective"
	jobtype = /datum/job/weebcity/detective

	id = 		 /obj/item/card/id/ms13/detective
	head = 	     /obj/item/clothing/head/helmet/ms13/cowboy/padded/detective
	suit =       /obj/item/clothing/suit/ms13/trench/detective
	uniform =    /obj/item/clothing/under/ms13/vaultsuit
	gloves = 	 /obj/item/clothing/gloves/ms13/vault
	shoes =  	 /obj/item/clothing/shoes/ms13/military/vault
	back =	 	 /obj/item/storage/backpack/satchel/leather

	belt =	 /obj/item/storage/belt/holster/ms13/detective/rev357_police/
	suit_store = /obj/item/gun/ballistic/shotgun/ms13/lever/cowboy
	r_pocket = /obj/item/ammo_box/ms13/tube357
	l_pocket = /obj/item/ammo_box/ms13/tube357

/datum/outfit/job/weebcity/detective/pre_equip(mob/living/carbon/human/H)
	..()
