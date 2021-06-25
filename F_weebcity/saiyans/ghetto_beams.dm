/*
attack self -> aiming_beam


drag = update angles

click = start - > process -> update colors, check if shoot
if able to shoot -> shoot

*/

/obj/effect/proc_holder/spell/saiyan/aoe/proc/onMouseDrag(src_object, over_object, src_location, over_location, params, mob)
	return
/obj/effect/proc_holder/spell/saiyan/aoe/proc/onMouseDown(object, location, params, mob)
	return

/obj/effect/proc_holder/spell/saiyan/aoe/proc/onMouseUp(object, location, params, mob)
	return

/obj/effect/proc_holder/spell/saiyan/aoe/
	action_icon = 'icons/mob/actions/actions_changeling.dmi'
	action_background_icon_state = "bg_spell"
	has_action = TRUE
	base_action = /datum/action/spell_action/spell
	var/aiming = FALSE
	var/aiming_time = 0
	var/aiming_time_fire_threshold = 5
	var/aiming_time_left = 12
	var/aiming_time_increase_user_movement = 3
	var/aiming_time_increase_angle_multiplier = 0.3
	var/last_process = 0
	var/lastangle = 0
	var/aiming_lastangle = 0
	var/mob/current_user = null
	var/list/obj/effect/projectile/tracer/current_tracers
	var/structure_piercing = 3				//Amount * 2. For some reason structures aren't respecting this unless you have it doubled. Probably with the objects in question's Bump() code instead of this but I'll deal with this later.
	var/structure_bleed_coeff = 0.7
	var/wall_pierce_amount = 4
	var/wall_devastate = 0.05
	var/aoe_structure_range = 2
	var/aoe_structure_damage = 50
	var/aoe_fire_range = 3
	var/aoe_fire_chance = 40
	var/aoe_mob_range = 2
	var/aoe_mob_damage = 30
	var/impact_structure_damage = 60
	var/projectile_damage = 30
	var/projectile_stun = 0
	var/projectile_setting_pierce = TRUE
	var/delay = 25
	var/lastfire = 0
	var/last_cast
	var/ammo_type = list(/obj/item/ammo_casing/energy/beam_rifle/hitscan)
	var/mob/listeningTo
	clothes_req = FALSE

/obj/effect/proc_holder/spell/saiyan/aoe/garlicgun
	name = "Garlic Gun"
	desc = "A ki beam"
	action_icon_state = "revive"
	charge_type = "recharge"
	charge_max = 100

/obj/effect/proc_holder/spell/saiyan/aoe/garlicgun/cast(list/targets, mob/user)
	var/mob/living/U = user
	to_chat(U, "<span class='warning'>process proc'd</span>")
	set_user(U)
	last_cast = world.time
	current_tracers= list( )
	to_chat(U, "<span class='warning'>process proc'd</span>")
/obj/effect/proc_holder/spell/saiyan/aoe/garlicgun/proc/end()
	to_chat(world, "<span class='warning'>process ended</span>")
	set_user(null)
	QDEL_LIST(current_tracers)
	listeningTo = null
	//return ..()

/obj/effect/proc_holder/spell/saiyan/aoe/garlicgun/proc/set_user(mob/user)
	if(user == current_user)
		return
	stop_aiming(current_user)
	if(listeningTo)
		UnregisterSignal(listeningTo, COMSIG_MOVABLE_MOVED)
		listeningTo = null
	if(istype(current_user))
		current_user = null
	if(istype(user))
		current_user = user
		RegisterSignal(user, COMSIG_MOVABLE_MOVED, .proc/on_mob_move)
		listeningTo = user

/obj/effect/proc_holder/spell/saiyan/aoe/garlicgun/proc/aiming_beam(force_update = FALSE)
	var/diff = abs(aiming_lastangle - lastangle)
	if(!check_user())
		return
	if(diff < AIMING_BEAM_ANGLE_CHANGE_THRESHOLD && !force_update)
		return
	to_chat(world, "<span class='warning'>aiming</span>")
	aiming_lastangle = lastangle
	var/obj/projectile/beam/beam_rifle/hitscan/aiming_beam/P = new
	P.gun = src
	P.wall_pierce_amount = wall_pierce_amount
	P.structure_pierce_amount = structure_piercing
	P.do_pierce = projectile_setting_pierce
	if(aiming_time)
		var/percent = ((100/aiming_time)*aiming_time_left)
		P.color = rgb(255 * percent,255 * ((100 - percent) / 100),0)
	else
		P.color = rgb(0, 255, 0)
	var/turf/curloc = get_turf(src)
	var/turf/targloc = get_turf(current_user.client.mouseObject)
	if(!istype(targloc))
		if(!istype(curloc))
			return
		targloc = get_turf_in_angle(lastangle, curloc, 10)
	P.preparePixelProjectile(targloc, current_user, current_user.client.mouseParams, 0)
	P.fire(lastangle)

/obj/effect/proc_holder/spell/saiyan/aoe/garlicgun/proc/check_user(automatic_cleanup = TRUE)
	if(!istype(current_user) || !isturf(current_user.loc) || current_user.incapacitated())	// : )
		if(automatic_cleanup)
			stop_aiming()
			set_user(null)
		return FALSE
	return TRUE

/obj/effect/proc_holder/spell/saiyan/aoe/garlicgun/proc/process_aim()
	if(istype(current_user) && current_user.client && current_user.client.mouseParams)
		var/angle = mouse_angle_from_client(current_user.client)
		current_user.setDir(angle2dir_cardinal(angle))
		var/difference = abs(closer_angle_difference(lastangle, angle))
		delay_penalty(difference * aiming_time_increase_angle_multiplier)
		lastangle = angle
		to_chat(world, "<span class='warning'>process_aim</span>")

/obj/effect/proc_holder/spell/saiyan/aoe/garlicgun/proc/on_mob_move()
	check_user()
	if(aiming)
		delay_penalty(aiming_time_increase_user_movement)
		process_aim()
		aiming_beam(TRUE)
		to_chat(world, "<span class='warning'>mob move proc</span>")

/obj/effect/proc_holder/spell/saiyan/aoe/garlicgun/proc/start_aiming()
	aiming_time_left = aiming_time
	aiming = TRUE
	process_aim()
	aiming_beam(TRUE)

/obj/effect/proc_holder/spell/saiyan/aoe/garlicgun/proc/stop_aiming(mob/user)
	set waitfor = FALSE
	aiming_time_left = aiming_time
	aiming = FALSE
	QDEL_LIST(current_tracers)


/obj/effect/proc_holder/spell/saiyan/aoe/garlicgun/process()
	..()
	if(!aiming)
		last_process = world.time
		return
	check_user()
	aiming_time_left = max(0, aiming_time - (world.time - last_process))
	aiming_beam(TRUE)
	last_process = world.time

/obj/effect/proc_holder/spell/saiyan/aoe/garlicgun/onMouseDrag(src_object, over_object, src_location, over_location, params, mob)
	if(aiming)
		process_aim()
		aiming_beam()
	return ..()

/obj/effect/proc_holder/spell/saiyan/aoe/garlicgun/onMouseDown(object, location, params, mob/mob)
	to_chat(world, "<span class='warning'>mosue down proc'd</span>")
	if(istype(mob))
		set_user(mob)
	if(istype(object, /atom/movable/screen) && !istype(object, /atom/movable/screen/click_catcher))
		return
	if((object in mob.contents) || (object == mob))
		return
	start_aiming()
	return ..()

/obj/effect/proc_holder/spell/saiyan/aoe/garlicgun/onMouseUp(object, location, params, mob/M)
	to_chat(world, "<span class='warning'>mosue up proc'd</span>")
	if(istype(object, /atom/movable/screen) && !istype(object, /atom/movable/screen/click_catcher))
		return
	process_aim()
	if(aiming_time_left <= aiming_time_fire_threshold && check_user())
		sync_ammo()
		afterattack(M.client.mouseObject, M, FALSE, M.client.mouseParams, passthrough = TRUE)
	stop_aiming()
	QDEL_LIST(current_tracers)
	return ..()

/obj/effect/proc_holder/spell/saiyan/aoe/garlicgun/proc/sync_ammo()
	for(var/obj/item/ammo_casing/energy/beam_rifle/AC in contents)
		AC.sync_stats()

/obj/effect/proc_holder/spell/saiyan/aoe/garlicgun/proc/delay_penalty(amount)
	aiming_time_left = clamp(aiming_time_left + amount, 0, aiming_time)

/obj/effect/proc_holder/spell/saiyan/aoe/garlicgun/proc/afterattack(atom/target, mob/living/user, flag, params, passthrough = FALSE)
	if(flag) //It's adjacent, is the user, or is on the user's person
		if(target in user.contents) //can't shoot stuff inside us.
			return
		if(!ismob(target) || user.a_intent == INTENT_HARM) //melee attack
			return
		if(target == user && user.zone_selected != BODY_ZONE_PRECISE_MOUTH) //so we can't shoot ourselves (unless mouth selected)
			return
	if(!passthrough && (aiming_time > aiming_time_fire_threshold))
		return
	if(lastfire > world.time + delay)
		return
	lastfire = world.time
	//. = ..()
	end()
	stop_aiming()
