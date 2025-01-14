/obj/item/choice_beacon/blueshield
	name = "bodyguard weapon delivery beacon"
	desc = "Weapon delivery beacon designed specially for picky Blueshield Agents."
	icon_state = "gangtool-red"
	w_class = WEIGHT_CLASS_TINY

/obj/item/choice_beacon/blueshield/generate_display_names()
	var/static/list/blueshield_weapons
	if(!blueshield_weapons)
		blueshield_weapons = list()
		var/list/possible_weapons = list(
			// Пример для своего значения:
			// путь_оружия = путь_набор_с_оружием,
			// При такой записи в списке будет отображаться название оружия,
			// а доставкой прилетит набор с оружием.
			/obj/item/gun/energy/blueshield = /obj/item/storage/belt/holster/energy/blueshield,
			/obj/item/gun/ballistic/automatic/sol_smg = /obj/item/storage/toolbox/guncase/skyrat/carwo_large_case/sindano,
			/obj/item/gun/ballistic/automatic/xhihao_smg = /obj/item/storage/toolbox/guncase/skyrat/xhihao_large_case/bogseo,
		)
		for(var/obj/item/weapon as anything in possible_weapons)
			blueshield_weapons[initial(weapon.name)] = possible_weapons[weapon]

	return blueshield_weapons

// ОЧЕНЬ костыльный, но всё же модульный способ впихнуть это в сумку
/datum/outfit/job/blueshield/pre_equip(mob/living/carbon/human/H, visualsOnly)
	if(!backpack_contents)
		backpack_contents = list()
	if(!(/obj/item/choice_beacon/blueshield in backpack_contents))
		backpack_contents += /obj/item/choice_beacon/blueshield
	. = ..()
