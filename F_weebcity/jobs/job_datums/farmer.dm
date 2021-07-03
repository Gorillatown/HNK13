/datum/job/weebcity/farmer
	title = "Town Farmer"
	selection_color = "#ffaf37"
	total_positions = 2
	spawn_positions = 2
	supervisors = "Mayor and the Sheriff."
	description = "Tend your farm and practice animal husbandry so that your Town can continue to thrive."
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/weebcity/farmer

	display_order = JOB_DISPLAY_ORDER_FARMER

/datum/outfit/job/weebcity/farmer
	name = "_Town Farmer"
	jobtype = /datum/job/weebcity/farmer

	suit =       /obj/item/clothing/suit/apron/waders/ms13
	uniform =    /obj/item/clothing/under/ms13/vaultsuit
	gloves = 	 /obj/item/clothing/gloves/ms13/leather
	shoes =  	 /obj/item/clothing/shoes/ms13/military/vault
	back =	 	 /obj/item/storage/backpack/

/datum/outfit/job/weebcity/farmer/pre_equip(mob/living/carbon/human/H)
	..()
