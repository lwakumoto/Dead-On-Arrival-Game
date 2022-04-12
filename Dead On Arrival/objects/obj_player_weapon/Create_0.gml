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
	BASTARD
}

enum weaponCategory {
	ASSAULT_RIFLE,
	BATTLE_RIFLE,
	LMG,
	SMG,
	PISTOL,
	SHOTGUN,
	SNIPER,
	MELEE
}

enum caliberType {
	_r556 = 0,
	_r762 = 1,
	_r50AE = 2,
	_r12GAUGE = 3,
	_r9x19 = 4,
	_r408 = 5,
	_mm = 6
}

var num_calibers = 6

enum weaponType {
	FIREARM,
	MELEE
}





// Create weapon array that will store the stats of each weapon, each weapon is represented as an array of maps
// Each map corresponds to a stat of that weapon.
global.num_weapons = 8;
weapons[global.num_weapons - 1] = noone // the weapons array that will store the stats for each weapon



for (var i = 0; i < global.num_weapons; i ++){
	weapons[i] = ds_map_create()
}





/*
	*---------------* INITIALIZE WEAPON STATISTICS *---------------*
*/
#region // initialize weapon variables
weapons[weapon.MK18][? "wep_id"] = 0; 
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
weapons[weapon.MK18][? "fire_sound"] = so_gunire
weapons[weapon.MK18][? "wep_cost"] = 1000 // the cost of purchase
weapons[weapon.MK18][? "wep_silhouette"] = spr_weapon_assault_mk18_silhouette

weapons[weapon.G3A1][? "wep_id"] = 1;
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
weapons[weapon.G3A1][? "wep_cost"] = 2500
weapons[weapon.G3A1][? "wep_silhouette"] = spr_weapon_battle_g3_silhouette

weapons[weapon.STONER][? "wep_id"] = 2;
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
weapons[weapon.STONER][? "wep_cost"] = 10000
weapons[weapon.STONER][? "wep_silhouette"] = spr_weapon_lmg_stoner_silhouette

weapons[weapon.DEAGLE][? "wep_id"] = 3;
weapons[weapon.DEAGLE][? "wep_type"] = weaponType.FIREARM
weapons[weapon.DEAGLE][? "wep_category"] = weaponCategory.PISTOL
weapons[weapon.DEAGLE][? "wep_name"] = "Desert Eagle"
weapons[weapon.DEAGLE][? "wep_sprite"] = spr_weapon_pistol_deagle
weapons[weapon.DEAGLE][? "wep_icon"] = spr_weapon_pistol_deagle_colored
weapons[weapon.DEAGLE][? "wep_reload"] = spr_weapon_pistol_deagle_reload
weapons[weapon.DEAGLE][? "wep_offset"] = 25
weapons[weapon.DEAGLE][? "wep_weight"] = 1.05
weapons[weapon.DEAGLE][? "mag_capacity"] = 7
weapons[weapon.DEAGLE][? "reserve_ammo"] = 100
weapons[weapon.DEAGLE][? "fire_type"] = fireType.SEMIAUTO
weapons[weapon.DEAGLE][? "fire_delay"] = 0.1 
weapons[weapon.DEAGLE][? "reload_time"] = 1 
weapons[weapon.DEAGLE][? "reload_type"] = 0
weapons[weapon.DEAGLE][? "caliber"] = caliberType._r50AE
weapons[weapon.DEAGLE][? "spread"] = 2.5
weapons[weapon.DEAGLE][? "range"] = 1000
weapons[weapon.DEAGLE][? "fire_sound"] = so_deagle_fire
weapons[weapon.DEAGLE][? "reload_sound"] = so_pistol_reload
weapons[weapon.DEAGLE][? "wep_cost"] = 500
weapons[weapon.DEAGLE][? "wep_silhouette"] = spr_weapon_pistol_deagle_silhouette

weapons[weapon.SPAS][? "wep_id"] = 4;
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
weapons[weapon.SPAS][? "fire_delay"] = 0.2 
weapons[weapon.SPAS][? "reload_time"] = 0.25 
weapons[weapon.SPAS][? "reload_type"] = 1
weapons[weapon.SPAS][? "caliber"] = caliberType._r12GAUGE
weapons[weapon.SPAS][? "spread"] = 15
weapons[weapon.SPAS][? "range"] = 555
weapons[weapon.SPAS][? "fire_sound"] = so_shotgun_fire
weapons[weapon.SPAS][? "reload_sound"] = so_shotgun_reload
weapons[weapon.SPAS][? "wep_cost"] = 1500
weapons[weapon.SPAS][? "wep_silhouette"] = spr_weapon_shotgun_spas_silhouette

weapons[weapon.MP5K][? "wep_id"] = 5;
weapons[weapon.MP5K][? "wep_type"] = weaponType.FIREARM
weapons[weapon.MP5K][? "wep_category"] = weaponCategory.SMG
weapons[weapon.MP5K][? "wep_name"] = "MP5k"
weapons[weapon.MP5K][? "wep_sprite"] = spr_weapon_smg_mp5k
weapons[weapon.MP5K][? "wep_reload"] = spr_weapon_smg_mp5k_reload
weapons[weapon.MP5K][? "wep_icon"] = spr_weapon_smg_mp5k_colored
weapons[weapon.MP5K][? "wep_offset"] = 20
weapons[weapon.MP5K][? "wep_weight"] = 0.95
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
weapons[weapon.MP5K][? "wep_cost"] = 1000
weapons[weapon.MP5K][? "wep_silhouette"] = spr_weapon_smg_mp5k_silhouette

weapons[weapon.INTERVENTION][? "wep_id"] = 6
weapons[weapon.INTERVENTION][? "wep_type"] = weaponType.FIREARM
weapons[weapon.INTERVENTION][? "wep_category"] = weaponCategory.SNIPER
weapons[weapon.INTERVENTION][? "wep_name"] = "M200 Intervention"
weapons[weapon.INTERVENTION][? "wep_sprite"] = spr_weapon_sniper_intervention
weapons[weapon.INTERVENTION][? "wep_reload"] = spr_weapon_sniper_intervention_reload
weapons[weapon.INTERVENTION][? "wep_icon"] = spr_weapon_sniper_intervention_colored
weapons[weapon.INTERVENTION][? "wep_offset"] = 0
weapons[weapon.INTERVENTION][? "wep_weight"] = .7
weapons[weapon.INTERVENTION][? "mag_capacity"] = 5
weapons[weapon.INTERVENTION][? "reserve_ammo"] = 10
weapons[weapon.INTERVENTION][? "fire_type"] = fireType.BOLT
weapons[weapon.INTERVENTION][? "fire_delay"] = 1
weapons[weapon.INTERVENTION][? "reload_time"] = 2.5 
weapons[weapon.INTERVENTION][? "reload_type"] = 0
weapons[weapon.INTERVENTION][? "caliber"] = caliberType._r408
weapons[weapon.INTERVENTION][? "spread"] = 0.1
weapons[weapon.INTERVENTION][? "range"] = 1000
weapons[weapon.INTERVENTION][? "fire_sound"] = so_shotgun_fire
weapons[weapon.INTERVENTION][? "wep_cost"] = 7000
weapons[weapon.INTERVENTION][? "wep_silhouette"] = spr_weapon_sniper_intervention_silhouette33

weapons[weapon.BASTARD][? "wep_id"] = 7
weapons[weapon.BASTARD][? "wep_type"] = weaponType.MELEE
weapons[weapon.BASTARD][? "wep_category"] = weaponCategory.MELEE
weapons[weapon.BASTARD][? "wep_name"] = "Bastard Sword"
weapons[weapon.BASTARD][? "wep_sprite"] = spr_weapon_melee_bastard
weapons[weapon.BASTARD][? "wep_icon"] = spr_weapon_melee_bastard_silhouette
weapons[weapon.BASTARD][? "wep_offset"] = 20
weapons[weapon.BASTARD][? "mag_capacity"] = 999999
weapons[weapon.BASTARD][? "wep_weight"] = 1.1
weapons[weapon.BASTARD][? "reserve_ammo"] = 0
weapons[weapon.BASTARD][? "fire_type"] = fireType.BOLT
weapons[weapon.BASTARD][? "fire_delay"] = 0.5 
weapons[weapon.BASTARD][? "reload_time"] = 1 
weapons[weapon.BASTARD][? "reload_type"] = 0
weapons[weapon.BASTARD][? "caliber"] = caliberType._mm
weapons[weapon.BASTARD][? "spread"] = 0.01
weapons[weapon.BASTARD][? "range"] = 10
weapons[weapon.BASTARD][? "fire_sound"] = so_sword
weapons[weapon.BASTARD][? "wep_cost"] = 99999999
weapons[weapon.BASTARD][? "wep_silhouette"] = spr_weapon_melee_bastard_silhouette

#endregion

for (var i = 0; i < global.num_weapons; i ++){// initialize the magazines and reserve ammunition appropriately
	ammunition[i][0] = weapons[i][? "mag_capacity"] // the current magazine for any weapon
	ammunition[i][1] = weapons[i][? "reserve_ammo"] // the reserve ammunition for any weapon
}








/*
	*---------------* INITIALIZE CALIBER STATISTICS *---------------*
*/
var num_calibers = 7; // the number of unique calibers
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
calibers[caliberType._r556][? "cost_per_shot"] = 5

calibers[caliberType._r762][? "cal_name"] = "7.62x51mm NATO"
calibers[caliberType._r762][? "cal_sprite"] = spr_player_bullet_full_powered
calibers[caliberType._r762][? "casing_sprite"] = spr_player_casing_full_powered
calibers[caliberType._r762][? "damage"] = 25
calibers[caliberType._r762][? "penetration"] = 2 
calibers[caliberType._r762][? "speed"] = 25
calibers[caliberType._r762][? "number_of_shot"] = 1
calibers[caliberType._r762][? "cost_per_shot"] = 12

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

calibers[caliberType._r9x19][? "cal_name"] = "9x19mm Parabellum"
calibers[caliberType._r9x19][? "cal_sprite"] = spr_player_bullet_pistol_small
calibers[caliberType._r9x19][? "casing_sprite"] = spr_player_casing_pistol_small
calibers[caliberType._r9x19][? "damage"] = 8
calibers[caliberType._r9x19][? "penetration"] = 0
calibers[caliberType._r9x19][? "speed"] = 25
calibers[caliberType._r9x19][? "number_of_shot"] = 1
calibers[caliberType._r9x19][? "cost_per_shot"] = 2

calibers[caliberType._r408][? "cal_name"] = ".408 Cheyenne"
calibers[caliberType._r408][? "cal_sprite"] = spr_player_bullet_anti_materiel
calibers[caliberType._r408][? "casing_sprite"] = spr_player_casing_anti_materiel
calibers[caliberType._r408][? "damage"] = 125
calibers[caliberType._r408][? "penetration"] = 5
calibers[caliberType._r408][? "speed"] = 50
calibers[caliberType._r408][? "number_of_shot"] = 1
calibers[caliberType._r408][? "cost_per_shot"] = 75

calibers[caliberType._mm][? "cal_name"] = ""
calibers[caliberType._mm][? "cal_sprite"] = spr_player_bullet_magical_melee_ammo
calibers[caliberType._mm][? "casing_sprite"] = 0
calibers[caliberType._mm][? "damage"] = 50
calibers[caliberType._mm][? "penetration"] = 999
calibers[caliberType._mm][? "speed"] = 25
calibers[caliberType._mm][? "number_of_shot"] = 1
calibers[caliberType._mm][? "cost_per_shot"] = 0
#endregion
casings_particles[num_calibers - 1] = noone

/*
	*---------------* INITIALIZE CASING PARTICLE SYSTEMS *---------------*
*/
for (var i = 0; i < num_calibers; i ++){
	casings_particles[i] = scr_create_casings_system(calibers[i][? "casing_sprite"])
}




