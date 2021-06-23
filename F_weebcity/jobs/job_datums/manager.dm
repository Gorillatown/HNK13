/datum/job/weebcity/manager
	title = "Warehouse Manager"
	selection_color = "#ad7918"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Mayor"
	description = "Manage all the external shipping to the city. If people need things, decide if they do, stuff like that."
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/weebcity/manager

	display_order = JOB_DISPLAY_ORDER_MANAGER

/datum/outfit/job/weebcity/manager
	name = "Warehouse Manager"
	jobtype = /datum/job/weebcity/manager
	uniform =    /obj/item/clothing/under/ms13/wasteland/gentlemansuit
	shoes =  	 /obj/item/clothing/shoes/ms13/military/vault
	back =	 	 /obj/item/storage/backpack/

/datum/outfit/job/weebcity/manager/pre_equip(mob/living/carbon/human/H)
	..()
