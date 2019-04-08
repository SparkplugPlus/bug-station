/mob/living/simple_animal/hostile/metroid
	name = "minetroid"
	desc = "Some sort of person eaty thing!"
	tt_desc = "Headamus Suckumus"
	icon = 'icons/mob/vore.dmi'
	icon_dead = "metroid_dead"
	icon_living = "mochtroid"
	icon_state = "mochtroid"
	faction = "metroids"
	intelligence_level = SA_ANIMAL
	hovering = TRUE
	maxHealth = 25
	health = 25
	speed = 4
	turns_per_move = 5
	response_help = "pets the"
	response_disarm = "gently pushes aside the"
	response_harm = "hits the"
	isEdible = 0 //They cannot be eaten while alive.
	var/canEvolve = 1 //A variable for admins to turn off and on for when they like assign a player as a mob. I want to add a verb so that they can do it on command when the conditions are right in the future.

//Metroids aren't affected by atmospheres.
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0


	melee_damage_lower = 10
	melee_damage_upper = 15
	attacktext = list("suckulated")
	attack_sound = 'sound/effects/metroidattack.ogg'

	speak_chance = 2
	emote_hear = list("makes a wooshing sound")
	emote_see = list("SKREE's")

	meat_type = /obj/item/toy/figure/samus
	
	var/mob/living/victim = null // the person the metroid is currently feeding on
	var/optimal_combat = FALSE // Used to dumb down the combat AI somewhat.  If true, the slime tends to be really dangerous to fight alone due to stunlocking.
	var/power_charge = 0
	var/evo_point = 0
	var/evo_limit = 0
	var/next = null
	
/mob/living/simple_animal/hostile/metroid //activate noms
	vore_active = 1
	vore_pounce_chance = 50
	vore_icons = SA_ICON_LIVING


/mob/living/simple_animal/hostile/metroid/death()
	playsound(src, 'sound/effects/metroiddeath.ogg', 50, 1)
	..()
	if(prob(20))
		visible_message("<span class='notice'>\The [src] dropped some toy!</span>")
		var/location = get_turf(src)
		new /obj/item/toy/figure/samus(location)

		
		

/mob/living/simple_animal/hostile/metroid/mine
	name = "Mochtroid"
	desc = "Some sort of person eaty thing! But weak compared to regular Metroids!"
	tt_desc = "Headamus Suckumus Weakamus"
	icon = 'icons/mob/vore.dmi'
	icon_dead = "mochtroid_dead"
	icon_living = "mochtroid"
	icon_state = "mochtroid"

/mob/living/simple_animal/hostile/metroid/mine
	vore_active = 1
	vore_pounce_chance = 50
	vore_icons = SA_ICON_LIVING
	swallowTime = 10 SECONDS //You'll have time to crawl away.

/mob/living/simple_animal/hostile/metroid/mine/death()
	playsound(src, 'sound/effects/metroiddeath.ogg', 50, 1)
	..()
	if(prob(20))
		visible_message("<span class='notice'>\The [src] dropped some toy!</span>")
		var/location = get_turf(src)
		new /obj/item/toy/figure/samus(location)





/mob/living/simple_animal/hostile/metroid/evolution/baby
	name = "baby metroid"
	desc = "The baby the baby the baby the baby the baby the baby the baby the baby."
	tt_desc = "Minimus Headamus Suckumus"
	icon = 'icons/mob/metroid/small.dmi'
	icon_dead = "baby_dead"
	icon_living = "baby"
	icon_state = "baby"
	intelligence_level = SA_ANIMAL
	speak_emote = list("churrs")
	health = 150
	maxHealth = 150
	melee_damage_lower = 1
	melee_damage_upper = 5
	melee_miss_chance = 0
	gender = NEUTER
	faction = "metroids"

	//Metroids aren't affected by most atmospheres except cold.
	minbodytemp = T0C-30
	cold_damage_per_tick = 4
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0


	response_help = "pets"

	speak = list(
		"Skree...",
		"Ereeeer..."
		)
	emote_hear = list()
	emote_see = list(
		"SKREE!"
		)

	cooperative = 1
	evo_point = 800
	evo_limit = 1000
	next = "/mob/living/simple_animal/hostile/metroid/evolution/super"	

	


//------------------------------------------------------------------------------------------------------------			



	
/mob/living/simple_animal/hostile/metroid/evolution/super
	name = "super metroid"
	desc = "Some kind of head sucky thing!"
	tt_desc = "Maximus Headamus Suckumus"
	icon = 'icons/mob/metroid/small.dmi'
	icon_dead = "metroid_dead"
	icon_living = "metroid"
	icon_state = "metroid"
	intelligence_level = SA_ANIMAL
	speak_emote = list("churrs")
	health = 200
	maxHealth = 200
	melee_damage_lower = 2
	melee_damage_upper = 5
	melee_miss_chance = 0
	gender = NEUTER
	faction = "metroids"

	//Metroids aren't affected by most atmospheres except cold.
	minbodytemp = T0C-30
	cold_damage_per_tick = 4
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0

	response_help = "pets"

	speak = list(
		"Skree...",
		"Ereeeer..."
		)
	emote_hear = list()
	emote_see = list(
		"SKREE!"
		)

	cooperative = 1
	evo_point = 1200
	evo_limit = 1400
	next = "/mob/living/simple_animal/hostile/metroid/combat/alpha"
	
/mob/living/simple_animal/hostile/metroid/evolution/super //active noms
	vore_active = 1
	vore_bump_chance = 0
	vore_capacity = 1
	vore_icons = SA_ICON_LIVING
	vore_pounce_chance = 0 //Metroids only eat incapacitated targets
	vore_default_mode = DM_DIGEST
	swallowTime = 1 SECONDS //Hungry little bastards.	
	
/mob/living/simple_animal/hostile/metroid/evolution/super/death()
	playsound(src, 'sound/metroid/metroiddeath.ogg', 100, 1)
	..()

	
	
	
//------------------------------------------------------------------------------------------------------------			



/mob/living/simple_animal/hostile/metroid/combat/alpha
	name = "alpha metroid"
	desc = "Some kind of head rammy thing!"
	tt_desc = "Minimus Headamus Rammamus"
	icon = 'icons/mob/metroid/small.dmi'
	icon_dead = "alpha_dead"
	icon_living = "alpha"
	icon_state = "alpha"
	intelligence_level = SA_ANIMAL
	health = 225
	maxHealth = 225
	melee_damage_lower = 10
	melee_damage_upper = 15
	melee_miss_chance = 5
	gender = NEUTER
	faction = "metroids"

	//Alphas lose their vulnerability to cold.
	minbodytemp = 0
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	unsuitable_atoms_damage = 0

	response_help = "pets"

	speak = list(
		"Skree...",
		"Ereeeer..."
		)
	emote_hear = list()
	emote_see = list(
		"SKREE!"
		)

	cooperative = 1
	evo_point = 1400
	evo_limit = 1600
	next = "/mob/living/simple_animal/hostile/metroid/combat/gamma"

/mob/living/simple_animal/hostile/metroid/combat/alpha/death()
	playsound(src, 'sound/metroid/metroiddeath.ogg', 100, 1)
	..()

/mob/living/simple_animal/hostile/metroid/combat/alpha //active noms
	vore_active = 1
	vore_bump_chance = 0
	vore_capacity = 1
	vore_icons = SA_ICON_LIVING
	vore_pounce_chance = 10 //Alphas will try knocking targets over since they lost their stun ability from the initial phases.
	vore_default_mode = DM_DIGEST
	swallowTime = 3 SECONDS 
	

	
	
	
	
//------------------------------------------------------------------------------------------------------------			
/*


/mob/living/simple_animal/hostile/metroid/combat/gamma
	name = "gamma metroid"
	desc = "Some kind of head rammy thing! This one shoots electricity!"
	tt_desc = "Maximus Headamus Rammamus"
	icon = 'icons/mob/metroid/small.dmi'
	icon_dead = "gamma_dead"
	icon_living = "gamma"
	icon_state = "gamma"
	intelligence_level = SA_ANIMAL
	health = 275
	maxHealth = 275
	melee_damage_lower = 10
	melee_damage_upper = 20
	melee_miss_chance = 5
	gender = NEUTER
	faction = "metroids"
	ranged = 1
	projectilesound = 'sound/weapons/taser2.ogg'
	projectiletype = /obj/item/projectile/beam/stun/weak
	firing_lines = 1

	//Not affected by atmos.
	minbodytemp = 0
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	unsuitable_atoms_damage = 0

	response_help = "pets"

	speak = list(
		"Skree...",
		"Ereeeer..."
		)
	emote_hear = list()
	emote_see = list(
		"SKREE!"
		)

	cooperative = 1
	var/emp_chance = 20 // Beware synths
	evo_point = 1400
	evo_limit = 1600
	next = "/mob/living/simple_animal/hostile/metroid/combat/zeta"


/mob/living/simple_animal/hostile/metroid/combat/gamma/death()
	playsound(src, 'sound/metroid/metroiddeath.ogg', 100, 1)
	..()


/mob/living/simple_animal/hostile/metroid/combat/gamma //active noms
	vore_active = 1
	vore_bump_chance = 0
	vore_capacity = 1
	vore_icons = SA_ICON_LIVING
	vore_pounce_chance = 15 
	vore_default_mode = DM_DIGEST
	swallowTime = 3 SECONDS 
	
	
	
//------------------------------------------------------------------------------------------------------------			



/mob/living/simple_animal/hostile/metroid/combat/zeta
	name = "zeta metroid"
	desc = "Some kind of feet stompy thing!"
	tt_desc = "Minimus Feetamus Walkamus"
	icon = 'icons/mob/metroid/medium.dmi'
	icon_dead = "zeta_dead"
	icon_living = "zeta"
	icon_state = "zeta"
	intelligence_level = SA_ANIMAL
	health = 350
	maxHealth = 350
	melee_damage_lower = 15
	melee_damage_upper = 25
	melee_miss_chance = 5
	gender = NEUTER
	faction = "metroids"

	//Unaffected by atmos.
	minbodytemp = 0
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	unsuitable_atoms_damage = 0

	response_help = "pets"

	speak = list(
		"Skree...",
		"Ereeeer..."
		)
	emote_hear = list()
	emote_see = list(
		"SKREE!"
		)

	cooperative = 1
	evo_point = 1600
	evo_limit = 1800
	next = "/mob/living/simple_animal/hostile/metroid/combat/omega"


/mob/living/simple_animal/hostile/metroid/combat/zeta/death()
	playsound(src, 'sound/metroid/metroiddeath.ogg', 100, 1)
	..()

	
/mob/living/simple_animal/hostile/metroid/combat/zeta //active noms
	vore_active = 1
	vore_bump_chance = 0
	vore_capacity = 1
	vore_icons = SA_ICON_LIVING
	vore_pounce_chance = 20 
	vore_default_mode = DM_DIGEST
	swallowTime = 3 SECONDS 
	
	
	
	
//------------------------------------------------------------------------------------------------------------			



/mob/living/simple_animal/hostile/metroid/combat/omega
	name = "omega metroid"
	desc = "Some kind of head rammy thing!"
	tt_desc = "Maximus Feetamus Walkamus"
	icon = 'icons/mob/metroid/large.dmi'
	icon_dead = "omega_dead"
	icon_living = "omega"
	icon_state = "omega"
	intelligence_level = SA_ANIMAL
	health = 450
	maxHealth = 450
	melee_damage_lower = 25
	melee_damage_upper = 40
	melee_miss_chance = 5
	gender = NEUTER
	faction = "metroids"

	//Unaffected by atmos.
	minbodytemp = 0
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	unsuitable_atoms_damage = 0

	response_help = "pets"

	speak = list(
		"Skree...",
		"Ereeeer..."
		)
	emote_hear = list()
	emote_see = list(
		"SKREE!"
		)

	cooperative = 1
	evo_point = 2600
	evo_limit = 3000
	next = "/mob/living/simple_animal/hostile/metroid/combat/queen"


/mob/living/simple_animal/hostile/metroid/combat/omega/death()
	playsound(src, 'sound/metroid/metroiddeath.ogg', 100, 1)
	..()


/mob/living/simple_animal/hostile/metroid/combat/omega //active noms
	vore_active = 1
	vore_bump_chance = 0
	vore_capacity = 2
	vore_icons = SA_ICON_LIVING
	vore_pounce_chance = 40 
	vore_default_mode = DM_DIGEST
	swallowTime = 3 SECONDS
	
	
	
	
//------------------------------------------------------------------------------------------------------------			



/mob/living/simple_animal/hostile/metroid/combat/queen
	name = "queen metroid"
	desc = "The mother of all Metroids, allowed to have grown too far!"
	tt_desc = "Maximus Queenamus Deathamus"
	icon = 'icons/mob/metroid/large.dmi'
	icon_dead = "queen_dead"
	icon_living = "queen"
	icon_state = "queen"
	intelligence_level = SA_ANIMAL
	health = 575
	maxHealth = 575
	melee_damage_lower = 30
	melee_damage_upper = 60
	melee_miss_chance = 5
	gender = NEUTER
	faction = "metroids"
	speed = 3

	//Unaffected by atmos.
	minbodytemp = 0
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	unsuitable_atoms_damage = 0

	response_help = "pets"

	speak = list(
		"Skree...",
		"Ereeeer..."
		)
	emote_hear = list()
	emote_see = list(
		"SKREE!"
		)

	cooperative = 1
	evo_point = 1800
	evo_limit = INFINITY
	next = "/mob/living/simple_animal/hostile/metroid/evolution/super"
	

var/list/queen_amount = list() //global queen list
/mob/living/simple_animal/hostile/metroid/combat/queen/New()
	queen_amount += src
	
/mob/living/simple_animal/hostile/metroid/combat/queen/death()
	playsound(src, 'sound/metroid/metroiddeath.ogg', 100, 1)
	..()

	
/mob/living/simple_animal/hostile/metroid/combat/queen //active noms
	vore_active = 1
	vore_bump_chance = 0
	vore_capacity = 4
	vore_icons = SA_ICON_LIVING
	vore_pounce_chance = 60 //It's the queen, and it's hungry.
	vore_default_mode = DM_DIGEST
	swallowTime = 3 SECONDS

	
*/

//LIFE STUFF, AND MECHANICS!
//FOR THE BABY AND SUPER FORMS!
/mob/living/simple_animal/hostile/metroid/evolution/Life()
	. = ..()

	if(canEvolve == 1 && nutrition >= evo_limit && (buckled || vore_fullness == 1)) //spit dat crap out if nutrition gets too high!
		release_vore_contents()
		prey_excludes.Cut()
		stop_consumption()
		
	if(canEvolve == 1 && nutrition >= evo_point && !buckled && vore_fullness == 0)
		playsound(src, 'sound/metroid/metroidgrow.ogg', 50, 1)
		paralysis = 7998
		sleep(50)
		paralysis = 0
		expand_troid()
		return

/mob/living/simple_animal/hostile/metroid/evolution/proc/expand_troid()
	visible_message("<span class='warning'>\The [src] suddenly evolves!</span>")
	new next(get_turf(src))
	qdel(src)
	
	
/mob/living/simple_animal/hostile/metroid/evolution/handle_regular_status_updates() //This does something.
	if(stat != DEAD)

		if(victim)
			handle_consumption()


		handle_stuttering()

	..()


/mob/living/simple_animal/hostile/metroid/evolution/proc/adjust_nutrition(input)
	nutrition = between(0, nutrition + input, evo_limit) //Just is a thing to handle the stun from the metroid.

	if(input > 0)
		if(prob(input * 2)) // Gain around one level per 50 nutrition
			power_charge = min(power_charge++, 10)

				
/mob/living/simple_animal/hostile/metroid/evolution/PunchTarget() //this segment determines what the mob does depending on its intent.
	if(victim)
		return // Already eatting someone.
	if(!client) // AI controlled.
		if( (!target_mob.lying && prob(60) || (!target_mob.lying && optimal_combat) )) // "Smart" metroids always stun first.
			a_intent = I_DISARM // Stun them first.
		else if(can_consume(target_mob) && target_mob.lying)
			a_intent = I_GRAB // Then eat them.
		else
			a_intent = I_HURT // Otherwise robust them.
	ai_log("PunchTarget() will [a_intent] [target_mob]",2)
	..()

/mob/living/simple_animal/hostile/metroid/evolution/proc/can_consume(var/mob/living/L) //This checks to see if the mob can latch onto the target and marks it TRUE.
	if(!L || !istype(L))
		to_chat(src, "This subject is incomparable...")
		return FALSE
	if(L.isSynthetic())
		to_chat(src, "This subject is not biological...")
		return FALSE
	if(L.getarmor(null, "bio") >= 75)
		to_chat(src, "I cannot reach this subject's biological matter...")
		return FALSE
	if(istype(L, /mob/living/simple_animal/hostile/metroid))
		to_chat(src, "I cannot feed on other metroids...")
		return FALSE
	if(!Adjacent(L))
		to_chat(src, "This subject is too far away...")
		return FALSE
	if(istype(L, /mob/living/carbon) && L.getCloneLoss() >= L.getMaxHealth() * 1.5 || istype(L, /mob/living/simple_animal) && L.stat == DEAD)
		to_chat(src, "This subject does not have an edible life energy...")
		return FALSE
	if(L.has_buckled_mobs())
		for(var/A in L.buckled_mobs)
			if(istype(A, /mob/living/simple_animal/hostile/metroid))
				if(A != src)
					to_chat(src, "\The [A] is already feeding on this subject...")
					return FALSE
	return TRUE

/mob/living/simple_animal/hostile/metroid/evolution/proc/start_consuming(var/mob/living/L) //This segment gets the mob to latch onto the target.
	if(!can_consume(L))
		return
	if(!Adjacent(L))
		return
	step_towards(src, L) // Get on top of them to feed.
	if(loc != L.loc)
		return
	if(L.buckle_mob(src, forced = TRUE))
		victim = L
		update_icon()
		playsound(src, 'sound/metroid/metroidattach.ogg', 100, 1)
		victim.visible_message("<span class='danger'>\The [src] latches onto [victim]!</span>",
		"<span class='danger'>\The [src] latches onto you!</span>")

/mob/living/simple_animal/hostile/metroid/evolution/proc/stop_consumption()
	if(!victim)
		return
	victim.unbuckle_mob()
	playsound(loc, 'sound/metroid/metroiddetach.ogg', 50, 1, -1)
	victim.visible_message("<span class='notice'>\The [src] slides off of [victim]!</span>",
	"<span class='notice'>\The [src] slides off of you!</span>")
	victim = null
	update_icon()


/mob/living/simple_animal/hostile/metroid/evolution/proc/handle_consumption()
	if(victim && can_consume(victim) && !stat)

		var/armor_modifier = abs((victim.getarmor(null, "bio") / 100) - 1)
		if(istype(victim, /mob/living/carbon))
			victim.adjustCloneLoss(rand(5,6) * armor_modifier)
			victim.adjustToxLoss(rand(1,2) * armor_modifier)
			if(victim.health <= 0)
				victim.adjustToxLoss(rand(2,4) * armor_modifier)

		else if(istype(victim, /mob/living/simple_animal))
			victim.adjustBruteLoss(rand(4, 12))

		else
			to_chat(src, "<span class='warning'>[pick("This subject is incompatable", \
			"This subject does not have a life energy", "This subject is empty", "I am not satisified", \
			"I can not feed from this subject", "I do not feel nourished", "This subject is not food")]...</span>")
			stop_consumption()

		adjust_nutrition(50 * armor_modifier)
		playsound(src, 'sound/metroid/metroidattack.ogg', 50, 1)

		adjustOxyLoss(-10 * armor_modifier) //Heal yourself
		adjustBruteLoss(-10 * armor_modifier)
		adjustFireLoss(-10 * armor_modifier)
		adjustCloneLoss(-10 * armor_modifier)
		updatehealth()
		if(victim)
			victim.updatehealth()
	else
		stop_consumption()

/mob/living/simple_animal/hostile/metroid/evolution/DoPunch(var/mob/living/L) //Metroid actions vs the player.
	if(!Adjacent(L)) // Might've moved away in the meantime.
		return

	if(istype(L))

		if(ishuman(L))
			var/mob/living/carbon/human/H = L
			// Slime attacks can be blocked with shields.
			if(H.check_shields(damage = 0, damage_source = null, attacker = src, def_zone = null, attack_text = "the attack"))
				return

		switch(a_intent)
			if(I_HELP)
				ai_log("DoPunch() against [L], helping.",2)
				L.visible_message("<span class='notice'>[src] gently pokes [L]!</span>",
				"<span class='notice'>[src] gently pokes you!</span>")
				do_attack_animation(L)

			if(I_DISARM) //The metroid does all this too try to knock the player down.
				ai_log("DoPunch() against [L], disarming.",2)
				var/stun_power = between(0, power_charge + rand(0, 3), 10)

				if(ishuman(L))
					var/mob/living/carbon/human/H = L
					stun_power *= max(H.species.siemens_coefficient,0)


				if(prob(stun_power * 10))
					power_charge = max(0, power_charge - 3)
					L.visible_message("<span class='danger'>[src] has shocked [L]!</span>", "<span class='danger'>[src] has shocked you!</span>")
					playsound(src, 'sound/weapons/Egloves.ogg', 75, 1)
					L.Weaken(4)
					L.Stun(4)
					do_attack_animation(L)
					if(L.buckled)
						L.buckled.unbuckle_mob() // To prevent an exploit where being buckled prevents metroids from jumping on you.
					L.stuttering = max(L.stuttering, stun_power)

					var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
					s.set_up(5, 1, L)
					s.start()

					if(prob(stun_power * 10) && stun_power >= 8)
						L.adjustFireLoss(power_charge * rand(1, 2))

				else if(prob(40))
					L.visible_message("<span class='danger'>[src] has pounced at [L]!</span>", "<span class='danger'>[src] has pounced at you!</span>")
					playsound(src, 'sound/metroid/metroidswoosh.ogg', 75, 1)
					L.Weaken(2)
					do_attack_animation(L)
					if(L.buckled)
						L.buckled.unbuckle_mob() // To prevent an exploit where being buckled prevents metroids from jumping on you.
				else
					L.visible_message("<span class='danger'>[src] has tried to pounce at [L]!</span>", "<span class='danger'>[src] has tried to pounce at you!</span>")
					playsound(src, 'sound/weapons/punchmiss.ogg', 75, 1)
					do_attack_animation(L)
				L.updatehealth()
				return L

			if(I_GRAB) //The metroid does this to start sucking their head off.
				ai_log("DoPunch() against [L], grabbing.",2)
				start_consuming(L)


			if(I_HURT) //The metroid does this if it can't latch onto the target or it decides not to try knocking them down.
				ai_log("DoPunch() against [L], hurting.",2)
				var/damage_to_do = rand(melee_damage_lower, melee_damage_upper)
				var/armor_modifier = abs((L.getarmor(null, "bio") / 100) - 1)

				L.attack_generic(src, damage_to_do, pick(attacktext))
				playsound(src, 'sound/weapons/bite.ogg', 75, 1)

				// Give the Metroid some nutrition, if applicable, even if not attached.
				if(!L.isSynthetic())
					if(ishuman(L))
						if(L.getCloneLoss() < L.getMaxHealth() * 1.5)
							adjust_nutrition(damage_to_do * armor_modifier)

					else if(istype(L, /mob/living/simple_animal))
						if(!ismetroid(L))
							var/mob/living/simple_animal/SA = L
							if(!SA.stat)
								adjust_nutrition(damage_to_do)


	if(istype(L,/obj/mecha))
		var/obj/mecha/M = L
		M.attack_generic(src, rand(melee_damage_lower, melee_damage_upper), pick(attacktext))


/mob/living/simple_animal/hostile/metroid/evolution/attack_hand(mob/living/carbon/human/M as mob)
	if(victim) // Are we eating someone?
		var/fail_odds = 30
		if(victim == M) // Harder to get the metroid off if its eating you right now.
			fail_odds = 60

		if(prob(fail_odds))
			visible_message("<span class='warning'>[M] attempts to wrestle \the [name] off!</span>")
			playsound(loc, 'sound/weapons/punchmiss.ogg', 25, 1, -1)

		else
			visible_message("<span class='warning'> [M] manages to wrestle \the [name] off!</span>")
			stop_consumption()
			step_away(src,M)
			paralysis = 7998
			sleep(50)
			paralysis = 0
	
			
/mob/living/simple_animal/hostile/metroid/evolution/FindTarget() //This makes it so it doesn't go after another target while succing.
	if(victim) // Don't worry about finding another target if we're eatting someone. //What does doooo??
		return
	..()


/mob/living/simple_animal/hostile/metroid/evolution/ClosestDistance()
	if(target_mob.stat == DEAD)
		return 1 // Melee (eat) the target if dead, don't shoot it.
	return ..()


/mob/living/simple_animal/hostile/metroid/evolution/handle_resist()
	if(buckled && victim && isliving(buckled) && victim == buckled) //This ensures that when it latches onto a prey, it stays latched until otherwise. It's gotta be buckled to its victim, and the victim must be alive.
		return
	else
		..()
	
	
	
/mob/living/simple_animal/hostile/metroid/evolution/baby/Found(mob/living/L)
	if(isliving(L))
		if(SA_attackable(L))
			if(L.faction == faction && !attack_same)
				if(ishuman(L))
					var/mob/living/carbon/human/H = L
					if(istype(H.species, /datum/species/monkey)) // istype() is so they'll eat the alien monkeys too.
						return H // Monkeys are always food.
					else
						return
						
			if(ishuman(L))
				var/mob/living/carbon/human/H = L
				if(istype(H.species, /datum/species/monkey)) // istype() is so they'll eat the alien monkeys too.
					return H // Monkeys are always food.
	return
	
	
//FOR THE COMBAT FORMS	
/mob/living/simple_animal/hostile/metroid/combat/Life()
	. = ..()

	if(canEvolve == 1 && nutrition >= evo_limit && vore_fullness == 1) //spit dat crap out if nutrition gets too high!
		release_vore_contents()
		prey_excludes.Cut()
		
	if(canEvolve == 1 && nutrition >= evo_point && vore_fullness == 0)
		playsound(src, 'sound/metroid/metroidgrow.ogg', 50, 1)
		paralysis = 7998
		sleep(50)
		paralysis = 0
		expand_troid()
		return
/*		
/mob/living/simple_animal/hostile/metroid/combat/omega/Life()		
	if(prob(5) && canEvolve == 1 && nutrition >= evo_point && queen_amount >= 1)
		playsound(src, 'sound/metroid/metroidgrow.ogg', 50, 1)
		expand_troid()
		return	
*/	
/mob/living/simple_animal/hostile/metroid/combat/queen/Life()		
	if(canEvolve == 1 && nutrition >= evo_point)
		playsound(src, 'sound/metroid/metroidgrow.ogg', 50, 1)
		birth_troid()
		return

/mob/living/simple_animal/hostile/metroid/combat/proc/expand_troid()
	visible_message("<span class='warning'>\The [src] suddenly evolves!</span>")
	new next(get_turf(src))
	qdel(src)
	
/mob/living/simple_animal/hostile/metroid/combat/queen/proc/birth_troid()
	visible_message("<span class='warning'>\A nesting Metroid suddenly bursts out of of the [src]!</span>")
	new next(get_turf(src))
	


/mob/living/simple_animal/hostile/metroid/combat/proc/adjust_nutrition(input)
	nutrition = (nutrition + input) //It handles the metroid's nutrition gain from melee.


				
/mob/living/simple_animal/hostile/metroid/combat/PunchTarget() //this segment determines what the mob does depending on its intent.
	if(!client) // AI controlled.
		a_intent = I_HURT // Otherwise robust them.
	ai_log("PunchTarget() will [a_intent] [target_mob]",2)
	..()



/mob/living/simple_animal/hostile/metroid/combat/DoPunch(var/mob/living/L) //Metroid actions vs the player.
	if(!Adjacent(L)) // Might've moved away in the meantime.
		return

	if(istype(L))
		switch(a_intent)
			if(I_HELP)
				ai_log("DoPunch() against [L], helping.",2)
				L.visible_message("<span class='notice'>[src] gently pokes [L]!</span>",
				"<span class='notice'>[src] gently pokes you!</span>")
				do_attack_animation(L)


			if(I_HURT) //The metroid does this if it can't latch onto the target or it decides not to try knocking them down.
				ai_log("DoPunch() against [L], hurting.",2)
				var/damage_to_do = rand(melee_damage_lower, melee_damage_upper)
				var/armor_modifier = abs((L.getarmor(null, "bio") / 100) - 1)

				L.attack_generic(src, damage_to_do, pick(attacktext))
				playsound(src, 'sound/weapons/bite.ogg', 75, 1)

				// Give the Metroid some nutrition, if applicable, even if not attached.
				if(!L.isSynthetic())
					if(ishuman(L))
						if(L.getCloneLoss() < L.getMaxHealth() * 1.5)
							adjust_nutrition(50 + damage_to_do * armor_modifier)

					else if(istype(L, /mob/living/simple_animal))
						if(!ismetroid(L))
							var/mob/living/simple_animal/SA = L
							if(!SA.stat)
								adjust_nutrition(20 + damage_to_do)


	if(istype(L,/obj/mecha))
		var/obj/mecha/M = L
		M.attack_generic(src, rand(melee_damage_lower, melee_damage_upper), pick(attacktext))



/mob/living/simple_animal/hostile/metroid/combat/ClosestDistance()
	if(target_mob.stat == DEAD)
		return 1 // Melee (eat) the target if dead, don't shoot it. //I don't think it actually eats the target. Maybe it does?
	return ..()