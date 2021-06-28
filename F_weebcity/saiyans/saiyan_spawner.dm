/*
	This is unused, as to why its because we aren't spawning the shuttle template atm so if you use these the saiyans will always be availiable for someone to just play
*/

/obj/effect/mob_spawn/human/saiyan
	name = "saiyan cryo storage"
	desc = "A cryo sleeper smelling faintly of ape."
	random = TRUE
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper"
	mob_name = "a saiyan"
	mob_species = /datum/species/human/saiyan
	outfit = /datum/outfit/pirate/space
	roundstart = FALSE
	death = FALSE
	anchored = TRUE
	density = FALSE
	show_flavour = FALSE //Flavour only exists for spawners menu
	short_desc = "You are a saiyan."
	flavour_text = "The station refused to pay for your protection, protect the ship, siphon the credits from the station and raid it for even more loot."
	assignedrole = "Saiyan"
	var/rank = "Mate"

/obj/effect/mob_spawn/human/saiyan/special(mob/living/new_spawn)
	new_spawn.fully_replace_character_name(new_spawn.real_name,generate_pirate_name())
	new_spawn.mind.add_antag_datum(/datum/antagonist/pirate)

/obj/effect/mob_spawn/human/saiyan/proc/generate_pirate_name()
	var/beggings = strings(PIRATE_NAMES_FILE, "beginnings")
	var/endings = strings(PIRATE_NAMES_FILE, "endings")
	return "[rank] [pick(beggings)][pick(endings)]"

/obj/effect/mob_spawn/human/saiyan/Destroy()
	new/obj/structure/showcase/machinery/oldpod/used(drop_location())
	return ..()