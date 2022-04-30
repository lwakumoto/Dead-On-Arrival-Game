/// @description Initialize weapon variables and statistics

/*
	This object handles the logic of firing, reloading, etc. weapons
	It additionally stores the statistics of both weapons and calibers such as their damage, reload speed, etc.
*/



owner = noone // the "owner" of the weapon i.e. the object it will follow

canShoot = true
reloading = false
bursting = false // if the player is currently using a burst weapon
curr_burst = 0
gun_obstructed = false // if the gun is obstructed by an obstacle and is unable to fire
right_side = true

//curr_crosshair = spr_crosshair
//cursor_sprite = curr_crosshair
window_set_cursor(cr_none)

image_speed = 0
image_index = 0

enum fireType {
	FULLAUTO,
	BURST,
	SEMIAUTO,
	PUMP,
	BOLT
}

enum weapon {
	MK18,
	G3A1,
	STONER,
	DEAGLE,
	SPAS,
	MP5K,
	INTERVENTION,
	BASTARD,
	HI_POINT,
	M40,
	BEOWULF,
	AK15,
	ULTIMAX,
	VECTOR,
	CROWBAR,
	TERMINATOR,
	MINIGUN
}

enum weaponCategory {
	ASSAULT_RIFLE,
	BATTLE_RIFLE,
	LMG,
	SMG,
	PISTOL,
	SHOTGUN,
	SNIPER,
	MELEE,
}

enum caliberType {
	_r556 = 0,
	_r762 = 1,
	_r50AE = 2,
	_r12GAUGE = 3,
	_r9x19 = 4,
	_r408 = 5,
	_mmCROWBAR = 6,
	_r45 = 7,
	_r762x39,
	_rbeowulf,
	_r308,
	_r20GAUGE,
	_mmBASTARD
}

var num_calibers = 6

enum weaponType {
	FIREARM,
	MELEE
}





// Create weapon array that will store the stats of each weapon, each weapon is represented as an array of maps
// Each map corresponds to a stat of that weapon.
global.num_weapons = 17;
weapons[global.num_weapons - 1] = noone // the weapons array that will store the stats for each weapon
global.weapon_kills = array_create(global.num_weapons)


for (var i = 0; i < global.num_weapons; i ++){
	weapons[i] = ds_map_create()
}




/*
	*---------------* INITIALIZE WEAPON STATISTICS *---------------*
*/
#region // initialize weapon variables
weapons[weapon.MK18][? "wep_id"] = weapon.MK18; 
weapons[weapon.MK18][? "wep_type"] = weaponType.FIREARM // the weapon type
weapons[weapon.MK18][? "wep_category"] = weaponCategory.ASSAULT_RIFLE // the weapon category
weapons[weapon.MK18][? "wep_name"] = "Mk18 Mod 1" // the display name of the weapon
weapons[weapon.MK18][? "wep_sprite"] = spr_weapon_assault_mk18 // the sprite of the weapon that the player holds
weapons[weapon.MK18][? "wep_reload"] = spr_weapon_assault_mk18_reload
weapons[weapon.MK18][? "wep_icon"] = spr_weapon_assault_mk18_colored // the sprite of the icon in the gui
weapons[weapon.MK18][? "wep_offset"] = 5 // the offset of the weapon
weapons[weapon.MK18][? "wep_weight"] = 0.9 // the weight of the weapon will affect the movement speed of the player
weapons[weapon.MK18][? "mag_capacity"] = 30 // the magazine capacity
weapons[weapon.MK18][? "reserve_ammo"] = 30 // the amount of ammunition in reserve
weapons[weapon.MK18][? "fire_type"] = fireType.FULLAUTO // the fire type of the weapon, determines how it fires
weapons[weapon.MK18][? "fire_delay"] = 0.14 // the minimum time between firing, in seconds
weapons[weapon.MK18][? "reload_time"] = 1 // the time it takes to reload, in seconds
weapons[weapon.MK18][? "reload_type"] = 0 // the "type" of reload, 0 if reload magazine at once, otherwise load one at a time
weapons[weapon.MK18][? "caliber"] = caliberType._r556 // the caliber the weapon uses
weapons[weapon.MK18][? "spread"] = 1.5 // the spread of the weapon (in degrees)
weapons[weapon.MK18][? "range"] = 1000 // how far the bullet will go before despawning
weapons[weapon.MK18][? "fire_sound"] = so_rifle_fire
weapons[weapon.MK18][? "reload_sound"] = so_rifle_reload2
weapons[weapon.MK18][? "wep_cost"] = 2500 // the cost of purchase
weapons[weapon.MK18][? "wep_silhouette"] = spr_weapon_assault_mk18_silhouette
weapons[weapon.MK18][? "wep_description"] = "A classic 5.56 rifle about as American as apple pie"

ammunition[weapon.MK18][0] = weapons[weapon.MK18][? "mag_capacity"] // the current magazine for any weapon
ammunition[weapon.MK18][1] = weapons[weapon.MK18][? "reserve_ammo"] // the reserve ammunition for any weapon

weapons[weapon.G3A1][? "wep_id"] = weapon.G3A1;
weapons[weapon.G3A1][? "wep_type"] = weaponType.FIREARM
weapons[weapon.G3A1][? "wep_category"] = weaponCategory.BATTLE_RIFLE
weapons[weapon.G3A1][? "wep_name"] = "G3A1"
weapons[weapon.G3A1][? "wep_sprite"] = spr_weapon_battle_g3
weapons[weapon.G3A1][? "wep_reload"] = spr_weapon_battle_g3_reload
weapons[weapon.G3A1][? "wep_icon"] = spr_weapon_battle_g3_colored
weapons[weapon.G3A1][? "wep_offset"] = 0
weapons[weapon.G3A1][? "mag_capacity"] = 20
weapons[weapon.G3A1][? "wep_weight"] = 0.85
weapons[weapon.G3A1][? "reserve_ammo"] = 20
weapons[weapon.G3A1][? "fire_type"] = fireType.SEMIAUTO
weapons[weapon.G3A1][? "fire_delay"] = 0.25
weapons[weapon.G3A1][? "reload_time"] = 2 
weapons[weapon.G3A1][? "reload_type"] = 0
weapons[weapon.G3A1][? "caliber"] = caliberType._r762
weapons[weapon.G3A1][? "spread"] = 0.3
weapons[weapon.G3A1][? "range"] = 1000 
weapons[weapon.G3A1][? "fire_sound"] = so_gunire
weapons[weapon.G3A1][? "reload_sound"] = so_rifle_reload1
weapons[weapon.G3A1][? "wep_cost"] = 3500
weapons[weapon.G3A1][? "wep_silhouette"] = spr_weapon_battle_g3_silhouette
weapons[weapon.G3A1][? "wep_description"] = "This semi-auto rifle is chambered in the powerful 7.62x51mm round"

ammunition[weapon.G3A1][0] = weapons[weapon.G3A1][? "mag_capacity"] 
ammunition[weapon.G3A1][1] = weapons[weapon.G3A1][? "reserve_ammo"] 

weapons[weapon.STONER][? "wep_id"] = weapon.STONER;
weapons[weapon.STONER][? "wep_type"] = weaponType.FIREARM
weapons[weapon.STONER][? "wep_category"] = weaponCategory.LMG
weapons[weapon.STONER][? "wep_name"] = "Stoner 63"
weapons[weapon.STONER][? "wep_sprite"] = spr_weapon_lmg_stoner
weapons[weapon.STONER][? "wep_reload"] = spr_weapon_lmg_stoner_reload
weapons[weapon.STONER][? "wep_icon"] = spr_weapon_lmg_stoner_colored
weapons[weapon.STONER][? "wep_offset"] = 0
weapons[weapon.STONER][? "mag_capacity"] = 75
weapons[weapon.STONER][? "wep_weight"] = 0.65 
weapons[weapon.STONER][? "reserve_ammo"] = 75
weapons[weapon.STONER][? "fire_type"] = fireType.FULLAUTO
weapons[weapon.STONER][? "fire_delay"] = 0.06
weapons[weapon.STONER][? "reload_time"] = 4
weapons[weapon.STONER][? "reload_type"] = 0
weapons[weapon.STONER][? "caliber"] = caliberType._r556
weapons[weapon.STONER][? "spread"] = 2
weapons[weapon.STONER][? "range"] = 1000 
weapons[weapon.STONER][? "fire_sound"] = so_gunire
weapons[weapon.STONER][? "reload_sound"] = so_machinegun_reload
weapons[weapon.STONER][? "wep_cost"] =5000
weapons[weapon.STONER][? "wep_silhouette"] = spr_weapon_lmg_stoner_silhouette
weapons[weapon.STONER][? "wep_description"] = "Not THAT kind of stoner..."


ammunition[weapon.STONER][0] = weapons[weapon.STONER][? "mag_capacity"] 
ammunition[weapon.STONER][1] = weapons[weapon.STONER][? "reserve_ammo"] 

weapons[weapon.DEAGLE][? "wep_id"] = weapon.DEAGLE;
weapons[weapon.DEAGLE][? "wep_type"] = weaponType.FIREARM
weapons[weapon.DEAGLE][? "wep_category"] = weaponCategory.PISTOL
weapons[weapon.DEAGLE][? "wep_name"] = "Desert Eagle"
weapons[weapon.DEAGLE][? "wep_sprite"] = spr_weapon_pistol_deagle
weapons[weapon.DEAGLE][? "wep_icon"] = spr_weapon_pistol_deagle_colored
weapons[weapon.DEAGLE][? "wep_reload"] = spr_weapon_pistol_deagle_reload
weapons[weapon.DEAGLE][? "wep_offset"] = 25
weapons[weapon.DEAGLE][? "wep_weight"] = 1.05
weapons[weapon.DEAGLE][? "mag_capacity"] = 7
weapons[weapon.DEAGLE][? "reserve_ammo"] = 0
weapons[weapon.DEAGLE][? "fire_type"] = fireType.SEMIAUTO
weapons[weapon.DEAGLE][? "fire_delay"] = 0.1 
weapons[weapon.DEAGLE][? "reload_time"] = 1 
weapons[weapon.DEAGLE][? "reload_type"] = 0
weapons[weapon.DEAGLE][? "caliber"] = caliberType._r50AE
weapons[weapon.DEAGLE][? "spread"] = 2.5
weapons[weapon.DEAGLE][? "range"] = 1000
weapons[weapon.DEAGLE][? "fire_sound"] = so_deagle_fire
weapons[weapon.DEAGLE][? "reload_sound"] = so_pistol_reload
weapons[weapon.DEAGLE][? "wep_cost"] = 1500
weapons[weapon.DEAGLE][? "wep_silhouette"] = spr_weapon_pistol_deagle_silhouette
weapons[weapon.DEAGLE][? "wep_description"] = "Who cares about practicality, when you've got a giant gun that shoots giant bullets?"

ammunition[weapon.DEAGLE][0] = weapons[weapon.DEAGLE][? "mag_capacity"] 
ammunition[weapon.DEAGLE][1] = weapons[weapon.DEAGLE][? "reserve_ammo"] 

weapons[weapon.SPAS][? "wep_id"] = weapon.SPAS;
weapons[weapon.SPAS][? "wep_type"] = weaponType.FIREARM
weapons[weapon.SPAS][? "wep_category"] = weaponCategory.SHOTGUN
weapons[weapon.SPAS][? "wep_name"] = "Spas-12"
weapons[weapon.SPAS][? "wep_sprite"] = spr_weapon_shotgun_spas
weapons[weapon.SPAS][? "wep_reload"] = spr_weapon_shotgun_spas_reload
weapons[weapon.SPAS][? "wep_icon"] = spr_weapon_shotgun_spas_colored
weapons[weapon.SPAS][? "wep_offset"] = 0
weapons[weapon.SPAS][? "mag_capacity"] = 8
weapons[weapon.SPAS][? "wep_weight"] = 0.9
weapons[weapon.SPAS][? "reserve_ammo"] = 16
weapons[weapon.SPAS][? "fire_type"] = fireType.SEMIAUTO
weapons[weapon.SPAS][? "fire_delay"] = 0.4
weapons[weapon.SPAS][? "reload_time"] = 0.3
weapons[weapon.SPAS][? "reload_type"] = 1
weapons[weapon.SPAS][? "caliber"] = caliberType._r12GAUGE
weapons[weapon.SPAS][? "spread"] = 15
weapons[weapon.SPAS][? "range"] = 555
weapons[weapon.SPAS][? "fire_sound"] = so_shotgun_fire
weapons[weapon.SPAS][? "reload_sound"] = so_shotgun_reload
weapons[weapon.SPAS][? "wep_cost"] = 5000
weapons[weapon.SPAS][? "wep_silhouette"] = spr_weapon_shotgun_spas_silhouette
weapons[weapon.SPAS][? "wep_description"] = "A verstile semi-automatic shotgun that will leave those zombies dead in no time"

ammunition[weapon.SPAS][0] = weapons[weapon.SPAS][? "mag_capacity"] 
ammunition[weapon.SPAS][1] = weapons[weapon.SPAS][? "reserve_ammo"] 

weapons[weapon.MP5K][? "wep_id"] = weapon.MP5K;
weapons[weapon.MP5K][? "wep_type"] = weaponType.FIREARM
weapons[weapon.MP5K][? "wep_category"] = weaponCategory.SMG
weapons[weapon.MP5K][? "wep_name"] = "MP5k"
weapons[weapon.MP5K][? "wep_sprite"] = spr_weapon_smg_mp5k
weapons[weapon.MP5K][? "wep_reload"] = spr_weapon_smg_mp5k_reload
weapons[weapon.MP5K][? "wep_icon"] = spr_weapon_smg_mp5k_colored
weapons[weapon.MP5K][? "wep_offset"] = 20
weapons[weapon.MP5K][? "wep_weight"] = 1.1
weapons[weapon.MP5K][? "mag_capacity"] = 25
weapons[weapon.MP5K][? "reserve_ammo"] = 25
weapons[weapon.MP5K][? "fire_type"] = fireType.BURST
weapons[weapon.MP5K][? "fire_delay"] = 0.1
weapons[weapon.MP5K][? "reload_time"] = 1 
weapons[weapon.MP5K][? "reload_type"] = 0
weapons[weapon.MP5K][? "caliber"] = caliberType._r9x19
weapons[weapon.MP5K][? "spread"] = 0.5 
weapons[weapon.MP5K][? "range"] = 1000
weapons[weapon.MP5K][? "fire_sound"] = so_gunire
weapons[weapon.MP5K][? "reload_sound"] = so_rifle_reload1
weapons[weapon.MP5K][? "wep_cost"] = 1000
weapons[weapon.MP5K][? "wep_silhouette"] = spr_weapon_smg_mp5k_silhouette
weapons[weapon.MP5K][? "wep_description"] = "Burst-fire carnage in a fist-sized package"

ammunition[weapon.MP5K][0] = weapons[weapon.MP5K][? "mag_capacity"] 
ammunition[weapon.MP5K][1] = weapons[weapon.MP5K][? "reserve_ammo"] 


weapons[weapon.INTERVENTION][? "wep_id"] = weapon.INTERVENTION
weapons[weapon.INTERVENTION][? "wep_type"] = weaponType.FIREARM
weapons[weapon.INTERVENTION][? "wep_category"] = weaponCategory.SNIPER
weapons[weapon.INTERVENTION][? "wep_name"] = "M200 Intervention"
weapons[weapon.INTERVENTION][? "wep_sprite"] = spr_weapon_sniper_intervention
weapons[weapon.INTERVENTION][? "wep_reload"] = spr_weapon_sniper_intervention_reload
weapons[weapon.INTERVENTION][? "wep_icon"] = spr_weapon_sniper_intervention_colored
weapons[weapon.INTERVENTION][? "wep_offset"] = 0
weapons[weapon.INTERVENTION][? "wep_weight"] = .8
weapons[weapon.INTERVENTION][? "mag_capacity"] = 5
weapons[weapon.INTERVENTION][? "reserve_ammo"] = 10
weapons[weapon.INTERVENTION][? "fire_type"] = fireType.BOLT
weapons[weapon.INTERVENTION][? "fire_delay"] = .8
weapons[weapon.INTERVENTION][? "reload_time"] = 2.5 
weapons[weapon.INTERVENTION][? "reload_type"] = 0
weapons[weapon.INTERVENTION][? "caliber"] = caliberType._r408
weapons[weapon.INTERVENTION][? "spread"] = 0.1
weapons[weapon.INTERVENTION][? "range"] = 1000
weapons[weapon.INTERVENTION][? "fire_sound"] = so_sniper_fire
weapons[weapon.INTERVENTION][? "reload_sound"] = so_rifle_reload1
weapons[weapon.INTERVENTION][? "wep_cost"] = 4000
weapons[weapon.INTERVENTION][? "wep_silhouette"] = spr_weapon_sniper_intervention_silhouette33
weapons[weapon.INTERVENTION][? "wep_description"] = "This anti-materiel rifle is for when you want to kill the target several miles away from you, and the target behind them, and the target behind them, and the..."

ammunition[weapon.INTERVENTION][0] = weapons[weapon.INTERVENTION][? "mag_capacity"] 
ammunition[weapon.INTERVENTION][1] = weapons[weapon.INTERVENTION][? "reserve_ammo"] 


weapons[weapon.BASTARD][? "wep_id"] = weapon.BASTARD
weapons[weapon.BASTARD][? "wep_type"] = weaponType.MELEE
weapons[weapon.BASTARD][? "wep_category"] = weaponCategory.MELEE
weapons[weapon.BASTARD][? "wep_name"] = "Bastard Sword"
weapons[weapon.BASTARD][? "wep_sprite"] = spr_weapon_melee_bastard
weapons[weapon.BASTARD][? "wep_icon"] = spr_weapon_melee_bastard_colored
weapons[weapon.BASTARD][? "wep_offset"] = 20
weapons[weapon.BASTARD][? "mag_capacity"] = 999999
weapons[weapon.BASTARD][? "wep_weight"] = .8
weapons[weapon.BASTARD][? "reserve_ammo"] = 0
weapons[weapon.BASTARD][? "fire_type"] = fireType.BOLT
weapons[weapon.BASTARD][? "fire_delay"] = 2
weapons[weapon.BASTARD][? "reload_time"] = 1 
weapons[weapon.BASTARD][? "reload_type"] = 0
weapons[weapon.BASTARD][? "caliber"] = caliberType._mmBASTARD
weapons[weapon.BASTARD][? "spread"] = 0.01
weapons[weapon.BASTARD][? "range"] = 20
weapons[weapon.BASTARD][? "fire_sound"] = so_sword
weapons[weapon.BASTARD][? "wep_cost"] = 5000
weapons[weapon.BASTARD][? "wep_silhouette"] = spr_weapon_melee_bastard_silhouette
weapons[weapon.BASTARD][? "wep_description"] = "It's a giant freakin' sword, do I really need to explain?"

ammunition[weapon.BASTARD][0] = weapons[weapon.BASTARD][? "mag_capacity"] 
ammunition[weapon.BASTARD][1] = weapons[weapon.BASTARD][? "reserve_ammo"] 


weapons[weapon.HI_POINT][? "wep_id"] = weapon.HI_POINT
weapons[weapon.HI_POINT][? "wep_type"] = weaponType.FIREARM
weapons[weapon.HI_POINT][? "wep_category"] = weaponCategory.PISTOL
weapons[weapon.HI_POINT][? "wep_name"] = "C-9"
weapons[weapon.HI_POINT][? "wep_sprite"] = spr_weapon_pistol_c9
weapons[weapon.HI_POINT][? "wep_reload"] = spr_weapon_pistol_c9_reload
weapons[weapon.HI_POINT][? "wep_icon"] = spr_weapon_pistol_c9_colored
weapons[weapon.HI_POINT][? "wep_offset"] = 25
weapons[weapon.HI_POINT][? "mag_capacity"] = 15
weapons[weapon.HI_POINT][? "wep_weight"] = .9
weapons[weapon.HI_POINT][? "reserve_ammo"] = 30
weapons[weapon.HI_POINT][? "fire_type"] = fireType.SEMIAUTO
weapons[weapon.HI_POINT][? "fire_delay"] = 0.2
weapons[weapon.HI_POINT][? "reload_time"] = 1.3
weapons[weapon.HI_POINT][? "reload_type"] = 0
weapons[weapon.HI_POINT][? "caliber"] = caliberType._r9x19
weapons[weapon.HI_POINT][? "spread"] = 5
weapons[weapon.HI_POINT][? "range"] = 500
weapons[weapon.HI_POINT][? "fire_sound"] = so_deagle_fire
weapons[weapon.HI_POINT][? "reload_sound"] = so_pistol_reload
weapons[weapon.HI_POINT][? "wep_cost"] = 0
weapons[weapon.HI_POINT][? "wep_silhouette"] = spr_weapon_pistol_c9_sillhouette
weapons[weapon.HI_POINT][? "wep_description"] = "Cheap and reliable, just don't expect it to win any beauty contests"

ammunition[weapon.HI_POINT][0] = weapons[weapon.HI_POINT][? "mag_capacity"] 
ammunition[weapon.HI_POINT][1] = weapons[weapon.HI_POINT][? "reserve_ammo"] 

weapons[weapon.VECTOR][? "wep_id"] = weapon.VECTOR
weapons[weapon.VECTOR][? "wep_type"] = weaponType.FIREARM
weapons[weapon.VECTOR][? "wep_category"] = weaponCategory.SMG
weapons[weapon.VECTOR][? "wep_name"] = "KRISS Vector"
weapons[weapon.VECTOR][? "wep_sprite"] = spr_weapon_smg_vector
weapons[weapon.VECTOR][? "wep_reload"] = spr_weapon_smg_vector_reload
weapons[weapon.VECTOR][? "wep_icon"] = spr_weapon_smg_vector_colored
weapons[weapon.VECTOR][? "wep_offset"] = 15
weapons[weapon.VECTOR][? "mag_capacity"] = 30
weapons[weapon.VECTOR][? "wep_weight"] = .95
weapons[weapon.VECTOR][? "reserve_ammo"] = 60
weapons[weapon.VECTOR][? "fire_type"] = fireType.FULLAUTO
weapons[weapon.VECTOR][? "fire_delay"] = 0.08
weapons[weapon.VECTOR][? "reload_time"] = 1.0
weapons[weapon.VECTOR][? "reload_type"] = 0
weapons[weapon.VECTOR][? "caliber"] = caliberType._r45
weapons[weapon.VECTOR][? "spread"] = 5
weapons[weapon.VECTOR][? "range"] = 5000
weapons[weapon.VECTOR][? "fire_sound"] = so_gunfire_suppressed
weapons[weapon.VECTOR][? "reload_sound"] = so_rifle_reload2
weapons[weapon.VECTOR][? "wep_cost"] = 4500
weapons[weapon.VECTOR][? "wep_silhouette"] = spr_weapon_smg_vector_silhouette
weapons[weapon.VECTOR][? "wep_description"] = "This smg looks like it came straight out of a sci-fi show"

ammunition[weapon.VECTOR][0] = weapons[weapon.VECTOR][? "mag_capacity"] 
ammunition[weapon.VECTOR][1] = weapons[weapon.VECTOR][? "reserve_ammo"] 

weapons[weapon.AK15][? "wep_id"] = weapon.AK15
weapons[weapon.AK15][? "wep_type"] = weaponType.FIREARM
weapons[weapon.AK15][? "wep_category"] = weaponCategory.ASSAULT_RIFLE
weapons[weapon.AK15][? "wep_name"] = "AK-15"
weapons[weapon.AK15][? "wep_sprite"] = spr_weapon_assault_ak15
weapons[weapon.AK15][? "wep_reload"] = spr_weapon_assault_ak15_reload
weapons[weapon.AK15][? "wep_icon"] = spr_weapon_assault_ak15_colored
weapons[weapon.AK15][? "wep_offset"] = 15
weapons[weapon.AK15][? "mag_capacity"] = 45
weapons[weapon.AK15][? "wep_weight"] = .85
weapons[weapon.AK15][? "reserve_ammo"] = 90
weapons[weapon.AK15][? "fire_type"] = fireType.FULLAUTO
weapons[weapon.AK15][? "fire_delay"] = 0.1
weapons[weapon.AK15][? "reload_time"] = 1.2
weapons[weapon.AK15][? "reload_type"] = 0
weapons[weapon.AK15][? "caliber"] = caliberType._r762x39
weapons[weapon.AK15][? "spread"] = 2
weapons[weapon.AK15][? "range"] = 500
weapons[weapon.AK15][? "fire_sound"] = so_rifle_fire
weapons[weapon.AK15][? "reload_sound"] = so_rifle_reload1
weapons[weapon.AK15][? "wep_cost"] = 6500
weapons[weapon.AK15][? "wep_silhouette"] = spr_weapon_assault_ak15_silhouette
weapons[weapon.AK15][? "wep_description"] = "A Russian 7.62 weapon in the Kalishinikov family of rifles"

ammunition[weapon.AK15][0] = weapons[weapon.AK15][? "mag_capacity"] 
ammunition[weapon.AK15][1] = weapons[weapon.AK15][? "reserve_ammo"] 

weapons[weapon.BEOWULF][? "wep_id"] = weapon.BEOWULF
weapons[weapon.BEOWULF][? "wep_type"] = weaponType.FIREARM
weapons[weapon.BEOWULF][? "wep_category"] = weaponCategory.BATTLE_RIFLE
weapons[weapon.BEOWULF][? "wep_name"] = "Beowulf"
weapons[weapon.BEOWULF][? "wep_sprite"] = spr_weapon_battle_beowulf
weapons[weapon.BEOWULF][? "wep_reload"] = spr_weapon_battle_beowulf_reload
weapons[weapon.BEOWULF][? "wep_icon"] = spr_weapon_battle_beowulf_colored
weapons[weapon.BEOWULF][? "wep_offset"] = 15
weapons[weapon.BEOWULF][? "mag_capacity"] = 10
weapons[weapon.BEOWULF][? "wep_weight"] = .85
weapons[weapon.BEOWULF][? "reserve_ammo"] = 20
weapons[weapon.BEOWULF][? "fire_type"] = fireType.SEMIAUTO
weapons[weapon.BEOWULF][? "fire_delay"] = 0.2
weapons[weapon.BEOWULF][? "reload_time"] = 1.0
weapons[weapon.BEOWULF][? "reload_type"] = 0
weapons[weapon.BEOWULF][? "caliber"] = caliberType._rbeowulf
weapons[weapon.BEOWULF][? "spread"] = 1
weapons[weapon.BEOWULF][? "range"] = 500
weapons[weapon.BEOWULF][? "fire_sound"] = so_gunire
weapons[weapon.BEOWULF][? "reload_sound"] = so_rifle_reload2
weapons[weapon.BEOWULF][? "wep_cost"] = 8000
weapons[weapon.BEOWULF][? "wep_silhouette"] = spr_weapon_battle_beowulf_silhouette
weapons[weapon.BEOWULF][? "wep_description"] = "A rifle that fires an impractically (and awesomely) large and powerful round"

ammunition[weapon.BEOWULF][0] = weapons[weapon.BEOWULF][? "mag_capacity"] 
ammunition[weapon.BEOWULF][1] = weapons[weapon.BEOWULF][? "reserve_ammo"] 

weapons[weapon.ULTIMAX][? "wep_id"] = weapon.ULTIMAX
weapons[weapon.ULTIMAX][? "wep_type"] = weaponType.FIREARM
weapons[weapon.ULTIMAX][? "wep_category"] = weaponCategory.LMG
weapons[weapon.ULTIMAX][? "wep_name"] = "Ultimax 100"
weapons[weapon.ULTIMAX][? "wep_sprite"] = spr_weapon_lmg_ultimax
weapons[weapon.ULTIMAX][? "wep_reload"] = spr_weapon_lmg_ultimax_reload
weapons[weapon.ULTIMAX][? "wep_icon"] = spr_weapon_lmg_ultimax_colored
weapons[weapon.ULTIMAX][? "wep_offset"] = 15
weapons[weapon.ULTIMAX][? "mag_capacity"] = 100
weapons[weapon.ULTIMAX][? "wep_weight"] = .85
weapons[weapon.ULTIMAX][? "reserve_ammo"] = 200
weapons[weapon.ULTIMAX][? "fire_type"] = fireType.FULLAUTO
weapons[weapon.ULTIMAX][? "fire_delay"] = (4)/room_speed
weapons[weapon.ULTIMAX][? "reload_time"] = 2
weapons[weapon.ULTIMAX][? "reload_type"] = 0
weapons[weapon.ULTIMAX][? "caliber"] = caliberType._r556
weapons[weapon.ULTIMAX][? "spread"] = 5
weapons[weapon.ULTIMAX][? "range"] = 5000
weapons[weapon.ULTIMAX][? "fire_sound"] = so_gunire
weapons[weapon.ULTIMAX][? "reload_sound"] = so_machinegun_reload
weapons[weapon.ULTIMAX][? "wep_cost"] = 10000
weapons[weapon.ULTIMAX][? "wep_silhouette"] = spr_weapon_lmg_ultimax_sillhouette
weapons[weapon.ULTIMAX][? "wep_description"] = "A high-capacity machine gun with an innovative recoil system"

ammunition[weapon.ULTIMAX][0] = weapons[weapon.ULTIMAX][? "mag_capacity"] 
ammunition[weapon.ULTIMAX][1] = weapons[weapon.ULTIMAX][? "reserve_ammo"] 

weapons[weapon.TERMINATOR][? "wep_id"] = weapon.TERMINATOR
weapons[weapon.TERMINATOR][? "wep_type"] = weaponType.FIREARM
weapons[weapon.TERMINATOR][? "wep_category"] = weaponCategory.SHOTGUN
weapons[weapon.TERMINATOR][? "wep_name"] = "Terminator"
weapons[weapon.TERMINATOR][? "wep_sprite"] = spr_weapon_shotgun_terminator
weapons[weapon.TERMINATOR][? "wep_reload"] = spr_weapon_shotgun_terminator_reload
weapons[weapon.TERMINATOR][? "wep_icon"] = spr_weapon_shotgun_terminator_colored
weapons[weapon.TERMINATOR][? "wep_offset"] = 15
weapons[weapon.TERMINATOR][? "mag_capacity"] = 1
weapons[weapon.TERMINATOR][? "wep_weight"] = .85
weapons[weapon.TERMINATOR][? "reserve_ammo"] = 15
weapons[weapon.TERMINATOR][? "fire_type"] = fireType.SEMIAUTO
weapons[weapon.TERMINATOR][? "fire_delay"] = 0.2
weapons[weapon.TERMINATOR][? "reload_time"] = 1
weapons[weapon.TERMINATOR][? "reload_type"] = 0
weapons[weapon.TERMINATOR][? "caliber"] = caliberType._r20GAUGE
weapons[weapon.TERMINATOR][? "spread"] = 25
weapons[weapon.TERMINATOR][? "range"] = 500
weapons[weapon.TERMINATOR][? "fire_sound"] = so_shotgun_fire
weapons[weapon.TERMINATOR][? "reload_sound"] = so_shotgun_reload
weapons[weapon.TERMINATOR][? "wep_cost"] = 500
weapons[weapon.TERMINATOR][? "wep_silhouette"] = spr_weapon_shotgun_terminator_sillhouette
weapons[weapon.TERMINATOR][? "wep_description"] = "This \"shotgun\" has earned the dubious honor of being the worst shotgun ever made, which it has most certainly earned"

ammunition[weapon.TERMINATOR][0] = weapons[weapon.TERMINATOR][? "mag_capacity"] 
ammunition[weapon.TERMINATOR][1] = weapons[weapon.TERMINATOR][? "reserve_ammo"] 

show_debug_message("===========================================================" + string(weapon.TERMINATOR) + " : " + string(weapons[weapon.TERMINATOR][? "mag_capacity"]))

weapons[weapon.M40][? "wep_id"] = weapon.M40
weapons[weapon.M40][? "wep_type"] = weaponType.FIREARM
weapons[weapon.M40][? "wep_category"] = weaponCategory.SNIPER
weapons[weapon.M40][? "wep_name"] = "M40A9"
weapons[weapon.M40][? "wep_sprite"] = spr_weapon_sniper_m40
weapons[weapon.M40][? "wep_reload"] = spr_weapon_sniper_m40_reload
weapons[weapon.M40][? "wep_icon"] = spr_weapon_sniper_m40_colored
weapons[weapon.M40][? "wep_offset"] = 15
weapons[weapon.M40][? "mag_capacity"] = 5
weapons[weapon.M40][? "wep_weight"] = .85
weapons[weapon.M40][? "reserve_ammo"] = 15
weapons[weapon.M40][? "fire_type"] = fireType.BOLT
weapons[weapon.M40][? "fire_delay"] = 0.8
weapons[weapon.M40][? "reload_time"] = .5
weapons[weapon.M40][? "reload_type"] = 1
weapons[weapon.M40][? "caliber"] = caliberType._r308
weapons[weapon.M40][? "spread"] = 0.1
weapons[weapon.M40][? "range"] = 5000
weapons[weapon.M40][? "fire_sound"] = so_sniper_fire
weapons[weapon.M40][? "reload_sound"] = so_sniper_load
weapons[weapon.M40][? "wep_cost"] = 2000
weapons[weapon.M40][? "wep_silhouette"] = spr_weapon_sniper_m40_silhouette
weapons[weapon.M40][? "wep_description"] = "Powerful, accurate, versatile, if it's good enough for the Marines, it's good enough for you"

ammunition[weapon.M40][0] = weapons[weapon.M40][? "mag_capacity"] 
ammunition[weapon.M40][1] = weapons[weapon.M40][? "reserve_ammo"] 

weapons[weapon.CROWBAR][? "wep_id"] = weapon.CROWBAR
weapons[weapon.CROWBAR][? "wep_type"] = weaponType.MELEE
weapons[weapon.CROWBAR][? "wep_category"] = weaponCategory.MELEE
weapons[weapon.CROWBAR][? "wep_name"] = "Crowbar"
weapons[weapon.CROWBAR][? "wep_sprite"] = spr_weapon_melee_crowbar
weapons[weapon.CROWBAR][? "wep_icon"] = spr_weapon_melee_crowbar_colored
weapons[weapon.CROWBAR][? "wep_offset"] = 20
weapons[weapon.CROWBAR][? "mag_capacity"] = 999999
weapons[weapon.CROWBAR][? "wep_weight"] = .9
weapons[weapon.CROWBAR][? "reserve_ammo"] = 0
weapons[weapon.CROWBAR][? "fire_type"] = fireType.BOLT
weapons[weapon.CROWBAR][? "fire_delay"] = 1
weapons[weapon.CROWBAR][? "reload_time"] = 1 
weapons[weapon.CROWBAR][? "reload_type"] = 0
weapons[weapon.CROWBAR][? "caliber"] = caliberType._mmCROWBAR
weapons[weapon.CROWBAR][? "spread"] = 0.01
weapons[weapon.CROWBAR][? "range"] = 10
weapons[weapon.CROWBAR][? "fire_sound"] = so_sword
weapons[weapon.CROWBAR][? "wep_cost"] = 3000
weapons[weapon.CROWBAR][? "wep_silhouette"] = spr_weapon_melee_crowbar_silhouette
weapons[weapon.CROWBAR][? "wep_description"] = "The right man in the wrong place can make all the difference in the world"

ammunition[weapon.CROWBAR][0] = weapons[weapon.CROWBAR][? "mag_capacity"] 
ammunition[weapon.CROWBAR][1] = weapons[weapon.CROWBAR][? "reserve_ammo"] 

weapons[weapon.MINIGUN][? "wep_id"] = weapon.MINIGUN
weapons[weapon.MINIGUN][? "wep_type"] = weaponType.FIREARM
weapons[weapon.MINIGUN][? "wep_category"] = weaponCategory.LMG
weapons[weapon.MINIGUN][? "wep_name"] = "Minigun"
weapons[weapon.MINIGUN][? "wep_sprite"] = spr_weapon_hmg_minigun_big_alt
weapons[weapon.MINIGUN][? "wep_icon"] = spr_weapon_hmg_minigun_colored
weapons[weapon.MINIGUN][? "wep_offset"] = 15
weapons[weapon.MINIGUN][? "mag_capacity"] = 2000
weapons[weapon.MINIGUN][? "wep_weight"] = .4
weapons[weapon.MINIGUN][? "reserve_ammo"] = 0
weapons[weapon.MINIGUN][? "fire_type"] = fireType.FULLAUTO
weapons[weapon.MINIGUN][? "fire_delay"] = 2/room_speed
weapons[weapon.MINIGUN][? "reload_time"] = 5.0
weapons[weapon.MINIGUN][? "reload_type"] = 0
weapons[weapon.MINIGUN][? "caliber"] = caliberType._r556
weapons[weapon.MINIGUN][? "spread"] = 15
weapons[weapon.MINIGUN][? "range"] = 5000
weapons[weapon.MINIGUN][? "fire_sound"] = so_minigun_fire
weapons[weapon.MINIGUN][? "wep_cost"] = 25000
weapons[weapon.MINIGUN][? "wep_silhouette"] = spr_weapon_hmg_minigun_silhouette
weapons[weapon.MINIGUN][? "wep_description"] = "Serves 60 servings of red-hot lead a second"

ammunition[weapon.MINIGUN][0] = weapons[weapon.MINIGUN][? "mag_capacity"] 
ammunition[weapon.MINIGUN][1] = weapons[weapon.MINIGUN][? "reserve_ammo"] 


#endregion
/*
for (var i = 0; i < global.num_weapons; i ++){// initialize the magazines and reserve ammunition appropriately
	ammunition[i][0] = weapons[i][? "mag_capacity"] // the current magazine for any weapon
	ammunition[i][1] = weapons[i][? "reserve_ammo"] // the reserve ammunition for any weapon
}
*/







/*
	*---------------* INITIALIZE CALIBER STATISTICS *---------------*
*/
var num_calibers = 13; // the number of unique calibers
calibers[num_calibers - 1] = noone

for (var i = 0; i < num_calibers; i ++){
	calibers[i] = ds_map_create()
}



#region // intialize caliber variables
calibers[caliberType._r556][? "cal_name"] = "5.56x45mm NATO" // display name of the caliber
calibers[caliberType._r556][? "cal_sprite"] = spr_player_bullet_intermediate // the sprite for the bullet
calibers[caliberType._r556][? "casing_sprite"] = spr_player_casing_intermediate // the sprite for the casing
calibers[caliberType._r556][? "damage"] = 11 // the damage of the bullet
calibers[caliberType._r556][? "penetration"] = 1 // how many enemies the bullet can penetrate before being destroyed
calibers[caliberType._r556][? "speed"] = 25 // speed of the bullet
calibers[caliberType._r556][? "number_of_shot"] = 1 // the number of bullets that are fired each shot
calibers[caliberType._r556][? "cost_per_shot"] = 4


calibers[caliberType._r762][? "cal_name"] = "7.62x51mm NATO"
calibers[caliberType._r762][? "cal_sprite"] = spr_player_bullet_full_powered
calibers[caliberType._r762][? "casing_sprite"] = spr_player_casing_full_powered
calibers[caliberType._r762][? "damage"] = 25
calibers[caliberType._r762][? "penetration"] = 2 
calibers[caliberType._r762][? "speed"] = 25
calibers[caliberType._r762][? "number_of_shot"] = 1
calibers[caliberType._r762][? "cost_per_shot"] = 12

calibers[caliberType._r762x39][? "cal_name"] = "7.62x39mm NATO"
calibers[caliberType._r762x39][? "cal_sprite"] = spr_player_bullet_intermediate
calibers[caliberType._r762x39][? "casing_sprite"] = spr_player_casing_intermediate
calibers[caliberType._r762x39][? "damage"] = 15
calibers[caliberType._r762x39][? "penetration"] = 1 
calibers[caliberType._r762x39][? "speed"] = 25
calibers[caliberType._r762x39][? "number_of_shot"] = 1
calibers[caliberType._r762x39][? "cost_per_shot"] = 8

calibers[caliberType._r50AE][? "cal_name"] = ".50 Action Express"
calibers[caliberType._r50AE][? "cal_sprite"] = spr_player_bullet_pistol_big
calibers[caliberType._r50AE][? "casing_sprite"] = spr_player_casing_pistol_big
calibers[caliberType._r50AE][? "damage"] = 15
calibers[caliberType._r50AE][? "penetration"] = 0
calibers[caliberType._r50AE][? "speed"] = 25
calibers[caliberType._r50AE][? "number_of_shot"] = 1
calibers[caliberType._r50AE][? "cost_per_shot"] = 5

calibers[caliberType._r12GAUGE][? "cal_name"] = "12 gauge"
calibers[caliberType._r12GAUGE][? "cal_sprite"] = spr_player_bullet_pellet
calibers[caliberType._r12GAUGE][? "casing_sprite"] = spr_player_casing_shotgun
calibers[caliberType._r12GAUGE][? "damage"] = 5
calibers[caliberType._r12GAUGE][? "penetration"] = 1
calibers[caliberType._r12GAUGE][? "speed"] = 25
calibers[caliberType._r12GAUGE][? "number_of_shot"] = 9
calibers[caliberType._r12GAUGE][? "cost_per_shot"] = 25

calibers[caliberType._r20GAUGE][? "cal_name"] = "20 gauge"
calibers[caliberType._r20GAUGE][? "cal_sprite"] = spr_player_bullet_pellet
calibers[caliberType._r20GAUGE][? "casing_sprite"] = spr_player_casing_shotgun
calibers[caliberType._r20GAUGE][? "damage"] = 6
calibers[caliberType._r20GAUGE][? "penetration"] = 1
calibers[caliberType._r20GAUGE][? "speed"] = 25
calibers[caliberType._r20GAUGE][? "number_of_shot"] = 15
calibers[caliberType._r20GAUGE][? "cost_per_shot"] = 30



calibers[caliberType._r9x19][? "cal_name"] = "9x19mm Parabellum"
calibers[caliberType._r9x19][? "cal_sprite"] = spr_player_bullet_pistol_small
calibers[caliberType._r9x19][? "casing_sprite"] = spr_player_casing_pistol_small
calibers[caliberType._r9x19][? "damage"] = 8
calibers[caliberType._r9x19][? "penetration"] = 0
calibers[caliberType._r9x19][? "speed"] = 25
calibers[caliberType._r9x19][? "number_of_shot"] = 1
calibers[caliberType._r9x19][? "cost_per_shot"] = 2

calibers[caliberType._r45][? "cal_name"] = ".45 ACP"
calibers[caliberType._r45][? "cal_sprite"] = spr_player_bullet_pistol_small
calibers[caliberType._r45][? "casing_sprite"] = spr_player_casing_pistol_small
calibers[caliberType._r45][? "damage"] = 11
calibers[caliberType._r45][? "penetration"] = 0
calibers[caliberType._r45][? "speed"] = 25
calibers[caliberType._r45][? "number_of_shot"] = 1
calibers[caliberType._r45][? "cost_per_shot"] = 4

calibers[caliberType._r408][? "cal_name"] = ".408 Cheyenne"
calibers[caliberType._r408][? "cal_sprite"] = spr_player_bullet_anti_materiel
calibers[caliberType._r408][? "casing_sprite"] = spr_player_casing_anti_materiel
calibers[caliberType._r408][? "damage"] = 125
calibers[caliberType._r408][? "penetration"] = 8
calibers[caliberType._r408][? "speed"] = 50
calibers[caliberType._r408][? "number_of_shot"] = 1
calibers[caliberType._r408][? "cost_per_shot"] = 30

calibers[caliberType._mmCROWBAR][? "cal_name"] = ""
calibers[caliberType._mmCROWBAR][? "cal_sprite"] = spr_player_bullet_magical_melee_ammo
calibers[caliberType._mmCROWBAR][? "casing_sprite"] = 0
calibers[caliberType._mmCROWBAR][? "damage"] = 30
calibers[caliberType._mmCROWBAR][? "penetration"] = 999
calibers[caliberType._mmCROWBAR][? "speed"] = 25
calibers[caliberType._mmCROWBAR][? "number_of_shot"] = 1
calibers[caliberType._mmCROWBAR][? "cost_per_shot"] = 0

calibers[caliberType._mmBASTARD][? "cal_name"] = ""
calibers[caliberType._mmBASTARD][? "cal_sprite"] = spr_player_bullet_magical_melee_ammo
calibers[caliberType._mmBASTARD][? "casing_sprite"] = 0
calibers[caliberType._mmBASTARD][? "damage"] = 60
calibers[caliberType._mmBASTARD][? "penetration"] = 999
calibers[caliberType._mmBASTARD][? "speed"] = 25
calibers[caliberType._mmBASTARD][? "number_of_shot"] = 1
calibers[caliberType._mmBASTARD][? "cost_per_shot"] = 0

calibers[caliberType._rbeowulf][? "cal_name"] = ".50 Beowulf"
calibers[caliberType._rbeowulf][? "cal_sprite"] = spr_player_bullet_full_powered
calibers[caliberType._rbeowulf][? "casing_sprite"] = spr_player_casing_full_powered
calibers[caliberType._rbeowulf][? "damage"] = 30
calibers[caliberType._rbeowulf][? "penetration"] = 3
calibers[caliberType._rbeowulf][? "speed"] = 40
calibers[caliberType._rbeowulf][? "number_of_shot"] = 1
calibers[caliberType._rbeowulf][? "cost_per_shot"] = 15

calibers[caliberType._r308][? "cal_name"] = ".308 Winchester"
calibers[caliberType._r308][? "cal_sprite"] = spr_player_bullet_full_powered
calibers[caliberType._r308][? "casing_sprite"] = spr_player_casing_full_powered
calibers[caliberType._r308][? "damage"] = 75
calibers[caliberType._r308][? "penetration"] = 4
calibers[caliberType._r308][? "speed"] = 50
calibers[caliberType._r308][? "number_of_shot"] = 1
calibers[caliberType._r308][? "cost_per_shot"] = 20
#endregion
casings_particles[num_calibers - 1] = noone

/*
	*---------------* INITIALIZE CASING PARTICLE SYSTEMS *---------------*
*/
for (var i = 0; i < num_calibers; i ++){
	casings_particles[i] = scr_create_casings_system(calibers[i][? "casing_sprite"])
}




