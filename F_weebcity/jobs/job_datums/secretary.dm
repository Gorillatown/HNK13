/datum/job/weebcity/secretary
	title = "Town Secretary"
	selection_color = "#92ff9b"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Mayor"
	description = "Handle most of the work for the Mayor, he's probably doing something dumb and abusing his power. Try to keep him on track."
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/weebcity/secretary

	display_order = JOB_DISPLAY_ORDER_SECRETARY

/datum/outfit/job/weebcity/secretary
	name = "_Town Mayor"
	jobtype = /datum/job/weebcity/secretary

	head = 		/obj/item/clothing/head/helmet/ms13/cowboy/gambler
	uniform =    /obj/item/clothing/under/ms13/regal
	shoes =  	 /obj/item/clothing/shoes/ms13/military/vault
	back =	 	 /obj/item/storage/backpack/
	belt = /obj/item/gun/ballistic/revolver/ms13/derringer
	r_pocket = /obj/item/ammo_box/ms13/derringer22
	l_pocket = /obj/item/ammo_box/ms13/derringer22

/datum/outfit/job/weebcity/secretary/pre_equip(mob/living/carbon/human/H)
	..()
