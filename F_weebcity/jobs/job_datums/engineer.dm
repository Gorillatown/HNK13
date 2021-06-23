/datum/job/weebcity/engineer
	title = "Engineer"
	total_positions = 2
	spawn_positions = 2
	supervisors = "Chief Engineer"
	description = "Keep the Power Plant running, and everything else in the city. :)"
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/weebcity/engineer

	display_order = JOB_DISPLAY_ORDER_ENGINEER

/datum/outfit/job/weebcity/engineer
	name = "Engineer"
	jobtype = /datum/job/weebcity/engineer
	suit =       /obj/item/clothing/suit/toggle/labcoat/ms13
	uniform =    /obj/item/clothing/under/ms13/wasteland/mechanicprewar/mechanicgreen
	gloves = 	 /obj/item/clothing/gloves/combat
	shoes =  	 /obj/item/clothing/shoes/ms13/military/vault
	back =	 	 /obj/item/storage/backpack/
/datum/outfit/job/weebcity/engineer/pre_equip(mob/living/carbon/human/H)
	..()
