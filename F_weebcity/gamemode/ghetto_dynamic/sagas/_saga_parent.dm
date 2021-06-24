/*
	My shitty version of a ruleset
	
		pre_setup() - called from gamemode pre_setup()
			list/candidates - list of candidates from the gamemode selection, you could return the list again after picking your people for other modes being ran
		post_setup() - called from gamemode post_setup()
		latejoin_call() - called from gamemode make_antag_chance()
			mob/living/carbon/human/newPlayer - Player mob, would suggest grabbing the mind to append a datum to it
*/

/datum/saga
	var/name = "ERROR" //Name of it
	var/list/antags //assc List of antags that are going to spawn and their ratios
	var/list/restricted_roles //List of jobs that are restricted from the conversion.

/datum/saga/proc/pre_setup(list/candidates)

/datum/saga/proc/post_setup()

/datum/saga/proc/latejoin_call(mob/living/carbon/human/newPlayer) 