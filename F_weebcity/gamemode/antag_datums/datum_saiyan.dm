/datum/antagonist/saiyan
	name = "Saiyans"
	job_rank = ROLE_TRAITOR
	roundend_category = "saiyans"
	antagpanel_category = "Saiyan"
	show_to_ghosts = TRUE
	var/datum/team/saiyans/crew
	var/list/powers = list(/obj/effect/proc_holder/spell/saiyan/self/zenkai, /obj/effect/proc_holder/spell/saiyan/self/breakout, /obj/effect/proc_holder/spell/saiyan/self/sprint)

/datum/antagonist/saiyan/on_gain()
	var/mob/living/carbon/human/our_saiyan = owner.current
	our_saiyan.set_species(/datum/species/human/saiyan)
	our_saiyan.mind.AddSpell(new /obj/effect/proc_holder/spell/saiyan/self/zenkai())
	our_saiyan.mind.AddSpell(new /obj/effect/proc_holder/spell/saiyan/self/breakout())
	our_saiyan.mind.AddSpell(new /obj/effect/proc_holder/spell/saiyan/self/sprint())
	. = ..()

/datum/antagonist/saiyan/greet()
	to_chat(owner, "<span class='boldannounce'>You are a Saiyan!</span>")
	to_chat(owner, "<B>Do stuff!</B>")
	owner.announce_objectives()

/datum/antagonist/saiyan/get_team()
	return crew

/datum/antagonist/saiyan/create_team(datum/team/saiyans/new_team)
	if(!new_team)
		for(var/datum/antagonist/saiyan/P in GLOB.antagonists)
			if(!P.owner)
				stack_trace("Antagonist datum without owner in GLOB.antagonists: [P]")
				continue
			if(P.crew) //If we find a crew
				crew = P.crew //our crew is that crew
				return
		if(!new_team) //If no new team still after that we make one, and make the objectives too.
			crew = new /datum/team/saiyans
			crew.forge_objectives()
			return
	if(!istype(new_team))
		stack_trace("Wrong team type passed to [type] initialization.")
	crew = new_team

/datum/antagonist/saiyan/on_gain()
	if(crew)
		objectives |= crew.objectives
	. = ..()

/datum/team/saiyans
	name = "Saiyan crew"

/datum/team/saiyans/proc/forge_objectives()
	for(var/datum/mind/M in members)
		var/datum/antagonist/saiyan/P = M.has_antag_datum(/datum/antagonist/saiyan)
		if(P)
			P.objectives |= objectives

/datum/team/saiyans/roundend_report()
	var/list/parts = list()

	parts += "<span class='header'>Saiyans were:</span>"

	var/all_dead = TRUE
	for(var/datum/mind/M in members)
		if(considered_alive(M))
			all_dead = FALSE
	parts += printplayerlist(members)

	if(!all_dead)
		parts += "<span class='greentext big'>The Saiyan crew was successful!</span>"
	else
		parts += "<span class='redtext big'>The Saiyan crew has failed.</span>"

	return "<div class='panel redborder'>[parts.Join("<br>")]</div>"
