/datum/job/weebcity/researchdirector
	title = "Research Director"
	selection_color = "#780786"
	total_positions = 2
	spawn_positions = 2
	supervisors = "The Mayor"
	description = "Looking for cool shit is cool, however, you should probably get stuff that is needed for the city... Right?"
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/weebcity/researchdirector

	display_order = JOB_DISPLAY_ORDER_SCIENTIST

/datum/outfit/job/weebcity/researchdirector
	name = "Research Director"
	jobtype = /datum/job/weebcity/researchdirector

	suit =       /obj/item/clothing/suit/toggle/labcoat/ms13
	uniform =    /obj/item/clothing/under/ms13/vaultsuit
	gloves = 	 /obj/item/clothing/gloves/color/latex/nitrile
	shoes =  	 /obj/item/clothing/shoes/ms13/military/vault
	back =	 	 /obj/item/storage/backpack/


/datum/outfit/job/weebcity/researchdirector/pre_equip(mob/living/carbon/human/H)
	..()
