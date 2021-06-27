/*
	Yes, dynamic exists in the codebase already, but this is more or less just a stripped down version of the concept of it (Thats probably worse)
	As to why? Its because we got ideas, and probably need the mode to properly storytell/route some odd combinations of shit (maybe?), so I'm just pasting this together
	Code can just be re-used/things can be redone for dynamic if this is dumb or pointless.
	But as is, I just want a very empty framework to start with
	Anyways, I'll be outlining the procs in the comment block so whoever reads this can understand what to do real fast.

		pre_setup()  - Occurs before people are on the map, this is where you should be screening potential candidates for your shit
		post_setup(report) - Occurs when they are on the map and after the job shit be done aka after
			report - This is a boolean (TRUE or FALSE), true calls send_intercept() on parent which just sends the mystery warning report. Useless w/out supercall
		process() - Ticker, called every second by SSprocessing, see: processing.dm
		make_antag_chance(mob/living/carbon/human/newPlayer) - Called when a player attempts to latejoin, it occurs in new_player.dm round line 367
			mob/living/carbon/human/newPlayer - The joining player's mob passed in the params from new_player.dm
		grab_candidates_nonconsentually() - returns a list of players who are ready and joining the round so we can get the starters for whatev
		starter_saga() - grabs the initial saga datum, basically like a shitty dynamic ruleset datum for the roundstart
*/

/datum/game_mode/ghetto_dynamic
	name = "ghetto dynamic mode"
	config_tag = "gdynamic"
	report_type = "gdynamic"

	announce_span = "danger"
	announce_text = "Dynamic mode!" // This needs to be changed maybe

	reroll_friendly = FALSE;

	var/list/active_sagas = list() //saga Datums currently loaded in so we can check them for relevant info
	var/list/possible_starter_sagas = list(/datum/saga/saiyan_invasion) //List of possible round starter sagas

/datum/game_mode/ghetto_dynamic/pre_setup()
	var/list/candidates = grab_candidates_nonconsentually() //Grab a list of people
	for(var/datum/saga/active in active_sagas) //grab list of active roundstart sagas
		active.pre_setup(candidates) //set it up, by passing a list of possible players
	
/datum/game_mode/ghetto_dynamic/post_setup(report)
	for(var/datum/saga/active in active_sagas) //grab list of active roundstart sagas
		active.post_setup() //call their post setup proc
	//for(var/datum/mind/traitor in pre_traitors)
	//	var/datum/antagonist/traitor/new_antag = new antag_datum()
	//	addtimer(CALLBACK(traitor, /datum/mind.proc/add_antag_datum, new_antag), rand(10,100))
	//	GLOB.pre_setup_antags -= traitor
	..()

	//We're not actually ready until all starter are assigned.
	gamemode_ready = FALSE
	addtimer(VARSET_CALLBACK(src, gamemode_ready, TRUE), 101)
	return TRUE

//Ticker, called every second
/datum/game_mode/ghetto_dynamic/process()
	return

//Called when someone joins late
/datum/game_mode/ghetto_dynamic/make_antag_chance(mob/living/carbon/human/newPlayer)
	if(EMERGENCY_ESCAPED_OR_ENDGAMED) // No more rules after the shuttle has left
		return

	var/datum/saga/random_saga = pick(active_sagas) //pick a random saga that is currently active
	random_saga.latejoin_call(newPlayer) //latejoin call it

/datum/game_mode/ghetto_dynamic/proc/grab_candidates_nonconsentually()
	var/list/candidates = list() //List of mind datums

	for(var/mob/dead/new_player/player in GLOB.new_player_list) //Check the new player list, and stick them in if they are good to go
		if(player.ready == PLAYER_READY_TO_PLAY && player.mind)
			candidates += player.mind
	
	candidates = shuffle(candidates) //Shuffle that shit, idk what to sort for so lets just return it, the saga will handle job checks so we don't lose the mayor/sheriff

	return candidates

/datum/game_mode/ghetto_dynamic/proc/starter_saga()
	var/datum/saga/starter = pick(possible_starter_sagas) //pick one
	active_sagas += new starter //instantiate the bitch and jam it into a list so we have a ref

	return starter


