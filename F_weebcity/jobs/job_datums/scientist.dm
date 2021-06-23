/datum/job/weebcity/scientist
	title = "Scientist"
	selection_color = "#ac18ac"
	total_positions = 2
	spawn_positions = 2
	supervisors = "The Research Director"
	description = "Research cool shit, or you know, listen to the RD and don't do that."
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/weebcity/scientist

	display_order = JOB_DISPLAY_ORDER_SCIENTIST

/datum/outfit/job/weebcity/scientist
	name = "Scientist"
	jobtype = /datum/job/weebcity/scientist

	suit =       /obj/item/clothing/suit/ms13/vaultlab
	uniform =    /obj/item/clothing/under/ms13/vaultsuit
	gloves = 	 /obj/item/clothing/gloves/color/latex/nitrile
	shoes =  	 /obj/item/clothing/shoes/ms13/military/vault
	back =	 	 /obj/item/storage/backpack/


/datum/outfit/job/weebcity/scientist/pre_equip(mob/living/carbon/human/H)
	..()
