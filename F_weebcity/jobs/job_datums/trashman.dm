/datum/job/weebcity/trashman
	title = "Trash Man"
	total_positions = 2
	spawn_positions = 2
	supervisors = "The Mayor and the Secretary"
	description = "Do all the grunt work for the Manager, he's your boss, he pays the bills."
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/weebcity/trashman

	display_order = JOB_DISPLAY_ORDER_TRASHMAN

/datum/outfit/job/weebcity/trashman
	name = "Trash Man"
	jobtype = /datum/job/weebcity/trashman
	uniform =    /obj/item/clothing/under/ms13/wasteland/roving
	gloves = 	 /obj/item/clothing/gloves/ms13/leather
	shoes =  	 /obj/item/clothing/shoes/ms13/military/vault
	back =	 	 /obj/item/storage/backpack/

/datum/outfit/job/weebcity/trashman/pre_equip(mob/living/carbon/human/H)
	..()
