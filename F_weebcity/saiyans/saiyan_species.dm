/datum/species/human/saiyan
	name = "Saiyan"

	brutemod = 0.6
	burnmod = 0.6
	stunmod = 0.6
	speedmod = -0.75
	armor = 25

	punchdamagelow = 9
	punchdamagehigh = 18
	punchstunthreshold = 14
	mutant_organs = list(/obj/item/organ/tail/saiyan)
	inherent_traits = list(TRAIT_VIRUSIMMUNE, TRAIT_RADIMMUNE, TRAIT_NOLIMBDISABLE)

	//dies_at_threshold = FALSE

//Yeah its the catgirl tail, whatev, if you want to make it wag go visit felinid.dm and just complete the code
/obj/item/organ/tail/saiyan
	name = "saiyan tail"
	desc = "A severed saiyan tail. Who's wagging now?"
	tail_type = "Cat"

/obj/item/organ/tail/saiyan/Insert(mob/living/carbon/human/H, special = 0, drop_if_replaced = TRUE)
	..()
	if(istype(H))
		var/default_part = H.dna.species.mutant_bodyparts["tail_human"]
		if(!default_part || default_part == "None")
			H.dna.features["tail_human"] = H.dna.species.mutant_bodyparts["tail_human"] = tail_type
			H.update_body()

/obj/item/organ/tail/saiyan/Remove(mob/living/carbon/human/H,  special = 0)
	..()
	if(istype(H))
		H.dna.features["tail_human"] = "None"
		H.dna.species.mutant_bodyparts -= "tail_human"
		color = H.hair_color
		H.update_body()
