/datum/job/weebcity/chiefengineer
	title = "Chief Engineer"
	selection_color = "#c70000"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Mayor"
	description = "Make sure the Power Plant runs, also deligate."
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/weebcity/chiefengineer

	display_order = JOB_DISPLAY_ORDER_CHIEFENGINEER

/datum/outfit/job/weebcity/chiefengineer
	name = "Chief Engineer"
	jobtype = /datum/job/weebcity/chiefengineer
	suit =       /obj/item/clothing/suit/toggle/labcoat/ms13
	uniform =    /obj/item/clothing/under/ms13/wasteland/machinist
	gloves = 	 /obj/item/clothing/gloves/combat
	shoes =  	 /obj/item/clothing/shoes/ms13/military/vault
	back =	 	 /obj/item/storage/backpack/
/datum/outfit/job/weebcity/chiefengineer/pre_equip(mob/living/carbon/human/H)
	..()
