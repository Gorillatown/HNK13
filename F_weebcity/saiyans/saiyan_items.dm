
/obj/item/clothing/suit/armor/vest/saiyan
	name = "Alien Armor"
	desc = "An armored vest that protects against copious amounts of damage."
	icon_state = "armor"
	inhand_icon_state = "armor"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	cold_protection = CHEST|GROIN|LEGS|ARMS
	heat_protection = CHEST|GROIN|LEGS|ARMS
	armor = list("melee" = 45, "bullet" = 45, "laser" = 50, "energy" = 30, "bomb" = 40, "bio" = 0, "rad" = 0, "fire" = 60, "acid" = 60)

/obj/item/clothing/suit/armor/vest/humansaiyan
	name = "Replicated Alien Armor"
	desc = "An armored vest that was replciated to mimic the strength of the alien's."
	icon_state = "armor"
	inhand_icon_state = "armor"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	cold_protection = CHEST|GROIN|LEGS|ARMS
	heat_protection = CHEST|GROIN|LEGS|ARMS
	armor = list("melee" = 35, "bullet" = 35, "laser" = 40, "energy" = 20, "bomb" = 35, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50)
/obj/item/restraints/handcuffs/energy/saiyancuffs // basically saiyan only cuffs, will keep them down
	name = "Alien Cuffs"
	desc = "Used for those pesky tailed ones."
	icon = 'icons/obj/items.dmi'
	icon_state = "saiyanhandcuff"
/obj/item/ms13/twohanded/powerpole // want to add an extend thing, will probably do some fireball reuse to get it to work that way
	name = "Power Pole"
	desc = "A pole used by the Z-Warrior, it's power and durability is unmatched."
	icon = 'icons/obj/wizard.dmi'
	icon_state = "powerpole"
	force = 15
	throwforce = 22
	throw_speed = 4
	throw_range = 9
	w_class = WEIGHT_CLASS_SMALL
	sharpness = FALSE
	slot_flags = ITEM_SLOT_BACK
	armour_penetration = 50
	attack_verb_continuous = list("beats", "slams")
	attack_verb_simple = list("bludgeoned", "whacked")

/obj/item/food/senzu // a single senzu bean given to the Z-fighter, legit just aheals, don't know if that will b fucky later but w/e
	name = "Senzu Bean"
	icon_state = "senzu"
	bite_consumption = 25
	food_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/nutriment/protein = 5, /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("beans" = 5)
	foodtypes = VEGETABLES //lettuce doesn't make burger a vegetable.
	eat_time = 5 //Quick snack
	w_class = WEIGHT_CLASS_SMALL
/obj/item/food/senzu/MakeEdible()
	AddComponent(/datum/component/edible,\
				initial_reagents = food_reagents,\
				food_flags = food_flags,\
				foodtypes = foodtypes,\
				volume = max_volume,\
				eat_time = eat_time,\
				tastes = tastes,\
				eatverbs = eatverbs,\
				bite_consumption = bite_consumption,\
				microwaved_type = microwaved_type,\
				junkiness = junkiness,\
				on_consume = CALLBACK(src, .proc/OnConsume))
	//Placeholder for effect that trigger on eating that aren't tied to reagents.
/obj/item/food/senzu/proc/OnConsume(mob/living/eater)
	if(!eater)
		return
	eater.senzuglow(TRUE)

/mob/living/proc/senzuglow(senzu)
	if(senzu)
		fully_heal()
		add_filter("_glow", 3, list("type" = "outline", "color" = "#59f72830", "size" = 3))
		addtimer(CALLBACK(src, .proc/senzuglow, FALSE), 250)
	else
		remove_filter("_glow")
