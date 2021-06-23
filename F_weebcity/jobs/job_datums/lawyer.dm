/datum/job/weebcity/lawyer
	title = "Lawyer"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Mayor"
	description = "Free those people that are meant to be free."
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/weebcity/lawyer

	display_order = JOB_DISPLAY_ORDER_MANAGER

/datum/outfit/job/weebcity/lawyer
	name = "_Lawyer"
	jobtype = /datum/job/weebcity/lawyer

	head = 		/obj/item/clothing/head/helmet/ms13/cowboy/heeledhat
	uniform =    /obj/item/clothing/under/ms13/wasteland/gentlemansuit/vintage
	shoes =  	 /obj/item/clothing/shoes/ms13/military/vault
	back =	 	 /obj/item/storage/backpack/

/datum/outfit/job/weebcity/lawyer/pre_equip(mob/living/carbon/human/H)
	..()
