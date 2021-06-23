/*
	Landmarks, basically when the job tries to spawn in it checks the string and moves the player there if relevant
	aka marker object
*/

/obj/effect/landmark/start/weebcity
	name = "Fuck you" // bitch
	icon_state = "Assistant"
	jobspawn_override = TRUE
	delete_after_roundstart = FALSE

/obj/effect/landmark/start/weebcity/civilian
	name = "Civilian"

/obj/effect/landmark/start/weebcity/doctor
	name = "Doctor"

/obj/effect/landmark/start/weebcity/farmer
	name = "Farmer"

/obj/effect/landmark/start/weebcity/mayor
	name = "Town Mayor"

/obj/effect/landmark/start/weebcity/sheriff
	name = "Sheriff"
	
