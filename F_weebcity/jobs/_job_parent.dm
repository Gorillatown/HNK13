/*
Weebcity Job Base Class
*/
/datum/job/weebcity
	title = "Default - please implement the title in your dataum/job/ms13/yourjob file"
	supervisors = "N/A - please implement the supervisors in your dataum/job/ms13/yourjob file"
	faction = "Wasteland"

/datum/outfit/job/weebcity
	name = "Default"
	jobtype = /datum/job/weebcity

	//This is all nulled to override /datum/outfit/job giving everyone assistant gear.

	uniform = null
	id = null
	ears = null
	belt = null
	back = null
	shoes = null
	box = null

	backpack = null
	satchel  = null
	duffelbag = null

	pda_slot = null

	skillchip_path = null

/datum/outfit/job/weebcity/pre_equip(mob/living/carbon/human/H)
	//Blank for now, utilize as needed later on.

//These are base jobs, we don't want them appearing at all
/datum/job/weebcity/config_check()
	if(type == /datum/job/weebcity)
		return FALSE
	return ..()

/datum/job/weebcity/map_check()
	if(type == /datum/job/weebcity)
		return FALSE
	return ..()