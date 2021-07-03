/*
attack self -> aiming_beam


drag = update angles

click = start - > process -> update colors, check if shoot
if able to shoot -> shoot

*/

/obj/item/gun/energy/beam_rifle/beam
	name = "Garlic Gun"
	icon = 'icons/mob/actions/actions_changeling.dmi'
	icon_state = "esniper"
	pin = /obj/item/firing_pin
	cell_type = /obj/item/stock_parts/cell/infinite
	aiming_time = 0
	delay = 0
	recoil = 0
	projectile_damage = 45
	structure_piercing = 3
	var/obj/effect/proc_holder/spell/targeted/touch/attached_spell
	//wall_devastate = 0.1
	//wall_pierce_amount = 4
	aoe_structure_range = 2
	aoe_fire_range = 3
	aoe_mob_range = 2
	var/charges = 1
/obj/item/gun/energy/beam_rifle/beam/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, ABSTRACT_ITEM_TRAIT)

/obj/item/gun/energy/beam_rifle/beam/afterattack(atom/target, mob/living/user, flag, params, passthrough = FALSE)
	..()
	//if(!proximity)
	//	return
	charges--
	if(charges <= 0)
		qdel(src)

/obj/item/gun/energy/beam_rifle/beam/Destroy()
	if(attached_spell)
		attached_spell.on_hand_destroy(src)
	return ..()


/obj/effect/proc_holder/spell/targeted/touch/garlicgun
	name = "Garlic Gun"
	desc = "A ki beam"
	action_icon = 'icons/mob/actions/actions_changeling.dmi'
	action_background_icon_state = "bg_spell"
	action_icon_state = "garlicgun"
	charge_type = "recharge"
	charge_max = 100
	clothes_req = FALSE
	hand_path = /obj/item/gun/energy/beam_rifle/beam

/obj/effect/proc_holder/spell/targeted/touch/garlicgun/on_hand_destroy(obj/item/gun/energy/beam_rifle/beam/hand)
	if(hand != attached_hand)
		CRASH("Incorrect touch spell hand.")
	//Start recharging.
	attached_hand = null
	recharging = TRUE
	action.UpdateButtonIcon()

	// literally make a new child with our wanted vars and a afterattack proc that will call affected_spell del and we r done???
/* /obj/effect/proc_holder/spell/targeted/touch/garlicgun/cast(list/targets, mob/user)
	..()
	if(attached_hand)
		var/obj/item/gun/energy/beam_rifle/gun = attached_hand
		pin = /obj/item/firing_pin
		aiming_time = 3
		delay = 0
		to_chat(world, "<B>Do stuff!3</B>")
		structure_piercing = 3
		wall_devastate = 0.1
		wall_pierce_amount = 4
		aoe_structure_range = 2
		aoe_fire_range = 3
		aoe_mob_range = 2
		ignore = TRUE
		to_chat(world, "<B>Do stuff!3</B>") */
