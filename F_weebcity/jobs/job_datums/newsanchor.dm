/datum/job/weebcity/newsanchor
	title = "News Anchor"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Mayor"
	description = "You are the only preson that can contact everyone in the city at the same time. Use it well, or fuck around. They'll probably make fun of you either way. "
	forbid = ""
	enforce = ""

	outfit = /datum/outfit/job/weebcity/newsanchor

	display_order = JOB_DISPLAY_ORDER_NEWSANCHOR
//Need to make a radio thats a mic and give all roles an earpiece that is recieve only
/datum/outfit/job/weebcity/newsanchor
	name = "_News Anchor"
	jobtype = /datum/job/weebcity/newsanchor
	head = 		/obj/item/clothing/head/helmet/ms13/utilitycap
	uniform =    /obj/item/clothing/under/ms13/wasteland/heeledsuit
	shoes =  	 /obj/item/clothing/shoes/ms13/explorer
	back =	 	 /obj/item/storage/backpack/

/datum/outfit/job/weebcity/newsanchor/pre_equip(mob/living/carbon/human/H)
	..()
