/datum/job/weebcity/doctor
	title = "Doctor"
	selection_color = "#0642c2"
	total_positions = 2
	spawn_positions = 2
	supervisors = "Mayor and the Sheriff."
	description = "Aid any patients that come in, whether it be for currency or something more."
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/weebcity/doctor

	display_order = JOB_DISPLAY_ORDER_DOCTOR

/datum/outfit/job/weebcity/doctor
	name = "Doctor"
	jobtype = /datum/job/weebcity/doctor

	suit =       /obj/item/clothing/suit/ms13/vaultlab
	uniform =    /obj/item/clothing/under/ms13/vaultsuit
	gloves = 	 /obj/item/clothing/gloves/color/latex/nitrile
	shoes =  	 /obj/item/clothing/shoes/ms13/military/vault
	back =	 	 /obj/item/storage/backpack/


/datum/outfit/job/weebcity/doctor/pre_equip(mob/living/carbon/human/H)
	..()
