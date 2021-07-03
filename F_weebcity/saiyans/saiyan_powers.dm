// Saiyans ahve powers, but it is just go, go fast and a regen when they get low. also the ki blast and beams, which may be a bit harder



/obj/effect/proc_holder/spell/saiyan
	panel = "Saiyan"
	school = "Saiyan"
	clothes_req = 0
	range = 1
	charge_max = 1800
	action_icon = 'icons/mob/actions/actions_changeling.dmi'
	action_background_icon_state = "bg_spell"
	var/gain_desc = null
	has_action = TRUE
	base_action = /datum/action/spell_action/spell

/obj/effect/proc_holder/spell/saiyan/Initialize()
	. = ..()
	action = new(src)
/obj/effect/proc_holder/spell/saiyan/New()
	..()
	if(!gain_desc)
		gain_desc = "You have gained \the [src] ability."

/obj/effect/proc_holder/spell/saiyan/can_cast(mob/user, charge_check, show_message)
	if(!user.mind)
		return 0
	if(!ishuman(user))
		return 0
	if(user.stat >= DEAD)
		return 0
	return ..()

/obj/effect/proc_holder/spell/saiyan/self/choose_targets(mob/user = usr)
	perform(list(user))

/obj/effect/proc_holder/spell/saiyan/self/zenkai
	name = "Zenkai"
	desc= "Undying Will"
	action_icon_state = "revive"
	charge_type = "charges"
	charge_max = 1
	stat_allowed = 1
/obj/effect/proc_holder/spell/saiyan/self/zenkai/cast(list/targets, mob/user = usr)
	var/mob/living/U = user
	U.remove_CC()
	U.adjustStaminaLoss(-75)
	ADD_TRAIT(src, list(TRAIT_NODEATH, TRAIT_IGNORESLOWDOWN, TRAIT_IGNOREDAMAGESLOWDOWN,  TRAIT_HARDLY_WOUNDED), ABSTRACT_ITEM_TRAIT)
	to_chat(user, "<span class='notice'>Your Saiyan blood refuses to let you fall here.</span>")
	for(var/i = 1 to 5)
		U.heal_overall_damage(10, 10)
		sleep(35)
	REMOVE_TRAIT(src, list(TRAIT_NODEATH, TRAIT_IGNORESLOWDOWN,TRAIT_IGNOREDAMAGESLOWDOWN,TRAIT_HARDLY_WOUNDED), ABSTRACT_ITEM_TRAIT )
/obj/effect/proc_holder/spell/saiyan/self/sprint
	name = "Sprint"
	desc = "Speed up."
	action_icon_state = "strained_muscles"
	charge_type = "recharge"
	charge_max = 200
/obj/effect/proc_holder/spell/saiyan/self/sprint/cast(list/targets, mob/user = usr)
	var/mob/living/U = user
	U.remove_CC()
	U.sprint()
	to_chat(U, "<B>Do stuff!</B>")
/mob/living/proc/sprint()
	//just cause it wasnt working
	add_movespeed_modifier(/datum/movespeed_modifier/sprint)
	addtimer(CALLBACK(src, .proc/remove_movespeed_modifier, /datum/movespeed_modifier/sprint), 5 SECONDS, TIMER_UNIQUE | TIMER_OVERRIDE)
	to_chat(src, "<B>Do stuff!</B>")
/obj/effect/proc_holder/spell/saiyan/self/breakout
	name = "Break Free"
	desc = "You are far too powerful to be shackled."
	action_icon_state = "biodegrade"
	charge_type = "recharge"
	charge_max = 100
/obj/effect/proc_holder/spell/saiyan/self/breakout/cast(list/targets, mob/user = usr)
	var/mob/living/carbon/human/U = user
	if(U.handcuffed)
		if(!(istype(U.handcuffed, /obj/item/restraints/handcuffs/energy/saiyancuffs)))
			U.uncuff()
			to_chat(U, "You snap the cuffs.")


