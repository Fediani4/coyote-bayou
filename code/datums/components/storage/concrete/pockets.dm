// 2 smol pockets
/datum/component/storage/concrete/pockets
	max_items = STORAGE_SMALL_POCKET_MAX_ITEMS * 2
	max_w_class = STORAGE_SMALL_POCKET_MAX_SIZE
	max_combined_w_class = STORAGE_SMALL_POCKET_MAX_TOTAL_SPACE * 2
	max_volume = STORAGE_SMALL_POCKET_MAX_TOTAL_SPACE * 2
	rustle_sound = TRUE
	override_flags = ALLOW_ARTIFACT_STUFF

/datum/component/storage/concrete/pockets/handle_item_insertion(obj/item/I, prevent_warning, mob/user)
	. = ..()
	if(. && silent && !prevent_warning)
		if(quickdraw)
			to_chat(user, span_notice("You discreetly slip [I] into [parent]. Alt-click [parent] to remove it."))
		else
			to_chat(user, span_notice("You discreetly slip [I] into [parent]."))

// 2 normal pockets
/datum/component/storage/concrete/pockets/huge
	max_items = STORAGE_NORMAL_POCKET_MAX_ITEMS * 2
	max_w_class = STORAGE_NORMAL_POCKET_MAX_SIZE
	max_combined_w_class = STORAGE_NORMAL_POCKET_MAX_TOTAL_SPACE * 2
	max_volume = STORAGE_NORMAL_POCKET_MAX_TOTAL_SPACE * 2

/// 2 bulky pockets
/datum/component/storage/concrete/pockets/massive
	max_items = STORAGE_BULKY_POCKET_MAX_ITEMS * 2
	max_w_class = STORAGE_BULKY_POCKET_MAX_SIZE
	max_combined_w_class = STORAGE_BULKY_POCKET_MAX_TOTAL_SPACE * 2
	max_volume = STORAGE_BULKY_POCKET_MAX_TOTAL_SPACE * 2

/// Bulky swords
/datum/component/storage/concrete/pockets/massive/swords
	max_items = STORAGE_BULKY_POCKET_MAX_ITEMS
	max_w_class = STORAGE_BULKY_POCKET_MAX_SIZE
	max_combined_w_class = STORAGE_BULKY_POCKET_MAX_TOTAL_SPACE
	max_volume = STORAGE_BULKY_POCKET_MAX_TOTAL_SPACE

/datum/component/storage/concrete/pockets/massive/swords/Initialize()
	. = ..()
	can_hold = GLOB.knifebelt_allowed

/// One smol pocket
/datum/component/storage/concrete/pockets/small
	max_items = STORAGE_BULKY_POCKET_MAX_ITEMS
	max_w_class = STORAGE_BULKY_POCKET_MAX_SIZE
	max_combined_w_class = STORAGE_BULKY_POCKET_MAX_TOTAL_SPACE
	max_volume = STORAGE_BULKY_POCKET_MAX_TOTAL_SPACE

/// One smol cookie pocket
/datum/component/storage/concrete/pockets/small/collar
	max_items = STORAGE_SMALL_POCKET_MAX_ITEMS * 2
	max_w_class = STORAGE_SMALL_POCKET_MAX_SIZE
	max_combined_w_class = STORAGE_SMALL_POCKET_MAX_TOTAL_SPACE * 2
	max_volume = STORAGE_SMALL_POCKET_MAX_TOTAL_SPACE * 2

/datum/component/storage/concrete/pockets/small/collar/Initialize()
	. = ..()
	can_hold = typecacheof(list(
	/obj/item/reagent_containers/food/snacks/cookie,
	/obj/item/reagent_containers/food/snacks/sugarcookie))

/datum/component/storage/concrete/pockets/small/collar/locked/Initialize()
	. = ..()
	can_hold = typecacheof(list(
	/obj/item/reagent_containers/food/snacks/cookie,
	/obj/item/reagent_containers/food/snacks/sugarcookie,
	/obj/item/key/collar))

/// 4 small pockets
/datum/component/storage/concrete/pockets/small/four
	max_items = STORAGE_SMALL_POCKET_MAX_ITEMS * 4
	max_w_class = STORAGE_SMALL_POCKET_MAX_SIZE
	max_combined_w_class = STORAGE_SMALL_POCKET_MAX_TOTAL_SPACE * 4
	max_volume = STORAGE_SMALL_POCKET_MAX_TOTAL_SPACE * 4

/// Useless bino bag
/datum/component/storage/concrete/pockets/binocular
	max_items = STORAGE_NORMAL_POCKET_MAX_ITEMS * 1
	max_w_class = STORAGE_NORMAL_POCKET_MAX_SIZE
	max_combined_w_class = STORAGE_NORMAL_POCKET_MAX_TOTAL_SPACE * 2
	max_volume = STORAGE_NORMAL_POCKET_MAX_TOTAL_SPACE * 2

/datum/component/storage/concrete/pockets/binocular/Initialize()
	. = ..()
	can_hold = GLOB.storage_binocular_can_hold

/// Treasurer bag
/datum/component/storage/concrete/pockets/treasurer
	max_items = STORAGE_SMALL_POCKET_MAX_ITEMS * 4
	max_w_class = STORAGE_SMALL_POCKET_MAX_SIZE
	max_combined_w_class = STORAGE_SMALL_POCKET_MAX_TOTAL_SPACE * 4
	max_volume = STORAGE_SMALL_POCKET_MAX_TOTAL_SPACE * 4

/datum/component/storage/concrete/pockets/treasurer/Initialize()
	. = ..()
	can_hold = GLOB.storage_treasurer_can_hold

/datum/component/storage/concrete/pockets/tiny
	max_items = 1
	max_w_class = WEIGHT_CLASS_TINY
	//attack_hand_interact = FALSE

/// Hat
/datum/component/storage/concrete/pockets/small/detective
	attack_hand_interact = TRUE // so the detectives would discover pockets in their hats

/// shoes
/datum/component/storage/concrete/pockets/shoes
	attack_hand_interact = TRUE
	quickdraw = TRUE
	silent = TRUE

/datum/component/storage/concrete/pockets/shoes/Initialize()
	. = ..()
	cant_hold = typecacheof(list(/obj/item/screwdriver/power))
	can_hold = GLOB.storage_shoes_can_hold + GLOB.storage_holdout_can_hold


/datum/component/storage/concrete/pockets/pocketprotector
	max_items = STORAGE_SMALL_POCKET_MAX_ITEMS * 3
	max_w_class = STORAGE_SMALL_POCKET_MAX_SIZE
	max_combined_w_class = STORAGE_SMALL_POCKET_MAX_TOTAL_SPACE * 3
	max_volume = STORAGE_SMALL_POCKET_MAX_TOTAL_SPACE * 3
	var/atom/original_parent

/datum/component/storage/concrete/pockets/pocketprotector/Initialize()
	original_parent = parent
	. = ..()
	can_hold = typecacheof(list( //Same items as a PDA
		/obj/item/pen,
		/obj/item/toy/crayon,
		/obj/item/lipstick,
		/obj/item/flashlight/pen,
		/obj/item/clothing/mask/cigarette))
	can_hold |= GLOB.storage_wallet_can_hold

/datum/component/storage/concrete/pockets/pocketprotector/real_location()
	// if the component is reparented to a jumpsuit, the items still go in the protector
	return original_parent

/// Hat 2, hardmode (cus its a helmet)
/datum/component/storage/concrete/pockets/small/rushelmet
	max_items = 1
	quickdraw = TRUE

/datum/component/storage/concrete/pockets/bos/paladin
	max_items = STORAGE_NORMAL_POCKET_MAX_ITEMS * 4
	max_w_class = STORAGE_NORMAL_POCKET_MAX_SIZE
	max_combined_w_class = STORAGE_NORMAL_POCKET_MAX_TOTAL_SPACE * 4
	max_volume = STORAGE_NORMAL_POCKET_MAX_TOTAL_SPACE * 4

/datum/component/storage/concrete/pockets/bos/paladin/Initialize()
	. = ..()
	can_hold = GLOB.gunbelt_allowed

/// Holdout
/datum/component/storage/concrete/pockets/small/holdout
	max_items = STORAGE_SMALL_POCKET_MAX_ITEMS * 2
	max_w_class = STORAGE_SMALL_POCKET_MAX_SIZE
	max_combined_w_class = STORAGE_SMALL_POCKET_MAX_TOTAL_SPACE * 2
	max_volume = STORAGE_SMALL_POCKET_MAX_TOTAL_SPACE * 2
	attack_hand_interact = TRUE
	quickdraw = TRUE

/datum/component/storage/concrete/pockets/small/holdout/Initialize()
	. = ..()
	can_hold = GLOB.storage_holdout_can_hold

/// Unarmored dusters
/datum/component/storage/concrete/pockets/duster
	max_items = STORAGE_SUIT_DUSTER_MAX_ITEMS
	max_w_class = STORAGE_SUIT_DUSTER_MAX_SIZE
	max_combined_w_class = STORAGE_SUIT_DUSTER_MAX_TOTAL_SPACE
	max_volume = STORAGE_SUIT_DUSTER_MAX_TOTAL_SPACE
	rustle_sound = TRUE

/// Armored dusters
/datum/component/storage/concrete/pockets/duster/armored
	max_items = STORAGE_SUIT_DUSTER_ARMOR_MAX_ITEMS
	max_w_class = STORAGE_SUIT_DUSTER_ARMOR_MAX_SIZE
	max_combined_w_class = STORAGE_SUIT_DUSTER_ARMOR_MAX_TOTAL_SPACE
	max_volume = STORAGE_SUIT_DUSTER_ARMOR_MAX_TOTAL_SPACE
	rustle_sound = TRUE

/// Jackets
/datum/component/storage/concrete/pockets/jacket
	max_items = STORAGE_SUIT_JACKET_MAX_ITEMS
	max_w_class = STORAGE_SUIT_JACKET_MAX_SIZE
	max_combined_w_class = STORAGE_SUIT_JACKET_MAX_TOTAL_SPACE
	max_volume = STORAGE_SUIT_JACKET_MAX_TOTAL_SPACE
	rustle_sound = TRUE

/// Generic armor slot
/datum/component/storage/concrete/pockets/armor
	max_items = STORAGE_SUIT_GENERIC_MAX_ITEMS
	max_w_class = STORAGE_SUIT_GENERIC_MAX_SIZE
	max_combined_w_class = STORAGE_SUIT_GENERIC_MAX_TOTAL_SPACE
	max_volume = STORAGE_SUIT_GENERIC_MAX_TOTAL_SPACE
	rustle_sound = TRUE

/// scarf
/datum/component/storage/concrete/pockets/scarf
	max_items = STORAGE_NECKPRON_GENERIC_MAX_ITEMS
	max_w_class = STORAGE_NECKPRON_GENERIC_MAX_SIZE
	max_combined_w_class = STORAGE_NECKPRON_GENERIC_MAX_TOTAL_SPACE
	max_volume = STORAGE_NECKPRON_GENERIC_MAX_TOTAL_SPACE
	rustle_sound = TRUE

/// service apron
/datum/component/storage/concrete/pockets/service
	max_items = STORAGE_NECKPRON_SPECIALIZED_MAX_ITEMS
	max_w_class = STORAGE_NECKPRON_SPECIALIZED_MAX_SIZE
	max_combined_w_class = STORAGE_NECKPRON_SPECIALIZED_MAX_TOTAL_SPACE
	max_volume = STORAGE_NECKPRON_SPECIALIZED_MAX_TOTAL_SPACE
	rustle_sound = TRUE

/// Service suit
/datum/component/storage/concrete/pockets/service/overalls
	max_items = STORAGE_SUIT_SPECIALIZED_MAX_ITEMS
	max_w_class = STORAGE_SUIT_SPECIALIZED_MAX_SIZE
	max_combined_w_class = STORAGE_SUIT_SPECIALIZED_MAX_TOTAL_SPACE
	max_volume = STORAGE_SUIT_SPECIALIZED_MAX_TOTAL_SPACE
	rustle_sound = TRUE

/datum/component/storage/concrete/pockets/service/Initialize()
	. = ..()
	can_hold = GLOB.toolbelt_allowed

/// medi-apron
/datum/component/storage/concrete/pockets/medical
	max_items = STORAGE_NECKPRON_SPECIALIZED_MAX_ITEMS
	max_w_class = STORAGE_NECKPRON_SPECIALIZED_MAX_SIZE
	max_combined_w_class = STORAGE_NECKPRON_SPECIALIZED_MAX_TOTAL_SPACE
	max_volume = STORAGE_NECKPRON_SPECIALIZED_MAX_TOTAL_SPACE
	rustle_sound = TRUE

/datum/component/storage/concrete/pockets/medical/overalls
	max_items = STORAGE_SUIT_SPECIALIZED_MAX_ITEMS
	max_w_class = STORAGE_SUIT_SPECIALIZED_MAX_SIZE
	max_combined_w_class = STORAGE_SUIT_SPECIALIZED_MAX_TOTAL_SPACE
	max_volume = STORAGE_SUIT_SPECIALIZED_MAX_TOTAL_SPACE
	rustle_sound = TRUE

/datum/component/storage/concrete/pockets/medical/Initialize()
	. = ..()
	can_hold = GLOB.medibelt_allowed

/// suit bandolier
/datum/component/storage/concrete/pockets/bulletbelt
	max_items = STORAGE_BELT_HOLSTER_MAX_ITEMS
	max_w_class = STORAGE_BELT_HOLSTER_MAX_SIZE
	max_combined_w_class = STORAGE_BELT_HOLSTER_MAX_TOTAL_SPACE
	max_volume = STORAGE_BELT_HOLSTER_MAX_TOTAL_SPACE

/datum/component/storage/concrete/pockets/bulletbelt/Initialize()
	. = ..()
	can_hold = GLOB.ammobelt_allowed
	can_hold |= GLOB.gunbelt_allowed

/// Combat armor bandolier / holster
/datum/component/storage/concrete/pockets/magpouch
	max_items = STORAGE_BELT_HOLSTER_MAX_ITEMS
	max_w_class = STORAGE_BELT_HOLSTER_MAX_SIZE
	max_combined_w_class = STORAGE_BELT_HOLSTER_MAX_TOTAL_SPACE
	max_volume = STORAGE_BELT_HOLSTER_MAX_TOTAL_SPACE

/datum/component/storage/concrete/pockets/magpouch/Initialize()
	. = ..()
	can_hold = GLOB.ammobelt_allowed
	can_hold |= GLOB.gunbelt_allowed
