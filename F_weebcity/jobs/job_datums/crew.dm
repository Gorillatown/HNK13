/datum/job/weebcity/crew
	title = "Warehouse Crew"
	selection_color = "#e6a327"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Manager"
	description = "Do all the grunt work for the Manager, he's your boss, he pays the bills."
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/weebcity/crew

	display_order = JOB_DISPLAY_ORDER_CREW

/datum/outfit/job/weebcity/crew
	name = "_Warehouse Manager"
	jobtype = /datum/job/weebcity/crew

	head = 		/obj/item/clothing/head/helmet/ms13/utilitycap/green
	uniform =    /obj/item/clothing/under/ms13/wasteland/merchant
	shoes =  	 /obj/item/clothing/shoes/ms13/military/vault
	back =	 	 /obj/item/storage/backpack/

/datum/outfit/job/weebcity/crew/pre_equip(mob/living/carbon/human/H)
	..()
