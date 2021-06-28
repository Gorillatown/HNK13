/datum/game_mode/saiyan_invasion
	name = "Saiyan Invasion"
	config_tag = "sinvasion"
	report_type = "sinvasion"
	antag_flag = ROLE_WIZARD
	false_report_weight = 10
	required_players = 4
	required_enemies = 2
	recommended_enemies = 2
	enemy_minimum_age = 0
	round_ends_with_antag_death = FALSE
	announce_span = "danger"
	announce_text = "There are saiyans attacking the station!\n\
	<span class='danger'>Saiyans</span>: Accomplish your objectives.\n\
	<span class='notice'>Townsfolk</span>: Stop the saiyans before they can succeed in their objectives!"
	var/finished = 0
	var/list/saiyan_minds = list()
	restricted_jobs = list("Mayor", "Sheriff")

/datum/game_mode/saiyan_invasion/pre_setup()
	var/list/candidates = list() //List of mind datums
	saiyan_minds.Cut()

	for(var/mob/dead/new_player/player in GLOB.new_player_list) //Check the new player list, and stick them in if they are good to go
		if(player.ready == PLAYER_READY_TO_PLAY && player.mind)
			candidates += player.mind
	
	for(var/datum/mind/player_mind in candidates)
		for(var/job in restricted_jobs)					// Remove people who want to be antagonist but have a job already that precludes it
			if(player_mind.assigned_role == job)
				candidates -= player_mind
	
	candidates = shuffle(candidates) //Shuffle that shit

	for(var/i=0 to required_enemies)
		saiyan_minds += pick(candidates)

	if(saiyan_minds.len >= 2)
		return TRUE
	else
		setup_error = "Not enough saiyan candidates"
		return FALSE

/datum/game_mode/saiyan_invasion/post_setup()
	for(var/datum/mind/saiyans in saiyan_minds)
		var/datum/antagonist/saiyan/new_antag = new()
		addtimer(CALLBACK(saiyans, /datum/mind.proc/add_antag_datum, new_antag), rand(10,100))
	..()

	//We're not actually ready until all starter are assigned.
	gamemode_ready = FALSE
	addtimer(VARSET_CALLBACK(src, gamemode_ready, TRUE), 101)
	return TRUE

/*
	This is basically the latejoin chance
*/
/datum/game_mode/saiyan_invasion/make_antag_chance(mob/living/carbon/human/newPlayer)
	return 

