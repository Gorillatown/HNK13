/datum/job/weebcity/chef
	title = "WcDonalds Chef"
	selection_color = "#f59300"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Mayor and Sheriff"
	description = "Use the animals in order to make nice borgers. Or other things, the town depends on you for their lunch."
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/weebcity/chef

	display_order = JOB_DISPLAY_ORDER_CHEF

/datum/outfit/job/weebcity/chef
	name = "WcDonalds Chef"
	jobtype = /datum/job/weebcity/chef

	suit =       /obj/item/clothing/suit/toggle/chef
	uniform =    /obj/item/clothing/under/ms13/vaultsuit
	gloves = 	 /obj/item/clothing/gloves/ms13/vault
	shoes =  	 /obj/item/clothing/shoes/ms13/military/vault
	back =	 	 /obj/item/storage/backpack/
	r_pocket = 		/obj/item/kitchen/knife

/datum/outfit/job/weebcity/chef/pre_equip(mob/living/carbon/human/H)
	..()
