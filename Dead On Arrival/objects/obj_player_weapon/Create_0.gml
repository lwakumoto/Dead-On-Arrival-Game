/// @description Initialize weapon variables and statistics

/*
	This object handles the logic of firing, reloading, etc. weapons
	It additionally stores the statistics of both weapons and calibers such as their damage, reload speed, etc.
*/

owner = noone // the "owner" of the weapon i.e. the object it will follow

canShoot = true
reloading = false
curr_crosshair = spr_crosshair
cursor_sprite = curr_crosshair
window_set_cursor(cr_none)

enum fireType {
	FULLAUTO,
	BURST,
	SEMIAUTO,
	PUMP,
	BOLT
}

enum caliberType {
	_r556 = 0,
	_r762 = 1,
	_r50AE = 2,
	_r12GAUGE = 3,
	_r9x19 = 4,
	_r408 = 5
}





// Create weapon array that will store the stats of each weapon, each weapon is represented as an array of maps
// Each map corresponds to a stat of that weapon.
var num_weapons = 8;
weapons[num_weapons - 1] = noone // the weapons array that will store the stats for each weapon



for (var i = 0; i < num_weapons; i ++){
	weapons[i] = ds_map_create()
}



/*
	*---------------* INITIALIZE WEAPON STATISTICS *---------------*
*/

weapons[0][? "wep_id"] = 0; 
weapons[0][? "wep_name"] = "Mk18 Mod 1" // the display name of the weapon
weapons[0][? "wep_sprite"] = spr_weapon_assault_mk18 // the sprite of the weapon that the player holds
weapons[0][? "wep_icon"] = spr_weapon_assault_mk18_silhouette46 // the sprite of the icon in the gui
weapons[0][? "mag_capacity"] = 30 // the magazine capacity
weapons[0][? "reserve_ammo"] = 300 // the amount of ammunition in reserve
weapons[0][? "fire_type"] = fireType.FULLAUTO // the fire type of the weapon, determines how it fires
weapons[0][? "fire_delay"] = 0.15 // the minimum time between firing, in seconds
weapons[0][? "reload_time"] = 1 // the time it takes to reload, in seconds
weapons[0][? "reload_type"] = 0 // the "type" of reload, 0 if reload magazine at once, otherwise load one at a time
weapons[0][? "caliber"] = caliberType._r556 // the caliber the weapon uses
weapons[0][? "spread"] = 0.5 // the spread of the weapon (in degrees)

weapons[1][? "wep_id"] = 1;
weapons[1][? "wep_name"] = "G3A1"
weapons[1][? "wep_sprite"] = spr_weapon_battle_g3
weapons[1][? "wep_icon"] = spr_weapon_battle_g3_silhouette
weapons[1][? "mag_capacity"] = 20
weapons[1][? "reserve_ammo"] = 300
weapons[1][? "fire_type"] = fireType.SEMIAUTO
weapons[1][? "fire_delay"] = 0.5 
weapons[1][? "reload_time"] = 2 
weapons[1][? "reload_type"] = 0
weapons[1][? "caliber"] = caliberType._r762
weapons[1][? "spread"] = 0.5 

weapons[2][? "wep_id"] = 2;
weapons[2][? "wep_name"] = "Stoner 63"
weapons[2][? "wep_sprite"] = spr_weapon_lmg_stoner
weapons[2][? "wep_icon"] = spr_weapon_lmg_stoner_silhouette
weapons[2][? "mag_capacity"] = 200
weapons[2][? "reserve_ammo"] = 300
weapons[2][? "fire_type"] = fireType.FULLAUTO
weapons[2][? "fire_delay"] = 0.05 
weapons[2][? "reload_time"] = 1 
weapons[2][? "reload_type"] = 0
weapons[2][? "caliber"] = caliberType._r556
weapons[2][? "spread"] = 0.5 

weapons[3][? "wep_id"] = 3;
weapons[3][? "wep_name"] = "Desert Eagle"
weapons[3][? "wep_sprite"] = spr_weapon_pistol_deagle
weapons[3][? "wep_icon"] = spr_weapon_pistol_deagle_silhouette
weapons[3][? "mag_capacity"] = 7
weapons[3][? "reserve_ammo"] = 300
weapons[3][? "fire_type"] = fireType.SEMIAUTO
weapons[3][? "fire_delay"] = 0.5 
weapons[3][? "reload_time"] = 1 
weapons[3][? "reload_type"] = 0
weapons[3][? "caliber"] = caliberType._r50AE
weapons[3][? "spread"] = 0.5 

weapons[4][? "wep_id"] = 4;
weapons[4][? "wep_name"] = "Spas-12"
weapons[4][? "wep_sprite"] = spr_weapon_shotgun_spas
weapons[4][? "wep_icon"] = spr_weapon_shotgun_spas_silhouette
weapons[4][? "mag_capacity"] = 8
weapons[4][? "reserve_ammo"] = 300
weapons[4][? "fire_type"] = fireType.SEMIAUTO
weapons[4][? "fire_delay"] = 0.2 
weapons[4][? "reload_time"] = 0.25 
weapons[4][? "reload_type"] = 1
weapons[4][? "caliber"] = caliberType._r12GAUGE
weapons[4][? "spread"] = 2.5

weapons[5][? "wep_id"] = 5;
weapons[5][? "wep_name"] = "MP5k"
weapons[5][? "wep_sprite"] = spr_weapon_smg_mp5k
weapons[5][? "wep_icon"] = spr_weapon_smg_mp5k_silhouette
weapons[5][? "mag_capacity"] = 25
weapons[5][? "reserve_ammo"] = 300
weapons[5][? "fire_type"] = fireType.BURST
weapons[5][? "fire_delay"] = 0.5 
weapons[5][? "reload_time"] = 1 
weapons[5][? "reload_type"] = 0
weapons[5][? "caliber"] = caliberType._r9x19
weapons[5][? "spread"] = 0.5 

weapons[6][? "wep_id"] = 6
weapons[6][? "wep_name"] = "M200 Intervention"
weapons[6][? "wep_sprite"] = spr_weapon_sniper_intervention
weapons[6][? "wep_icon"] = spr_weapon_sniper_intervention_silhouette33
weapons[6][? "mag_capacity"] = 5
weapons[6][? "reserve_ammo"] = 300
weapons[6][? "fire_type"] = fireType.BOLT
weapons[6][? "fire_delay"] = 0.5 
weapons[6][? "reload_time"] = 1 
weapons[6][? "reload_type"] = 0
weapons[6][? "caliber"] = caliberType._r408
weapons[6][? "spread"] = 0.5 

for (var i = 0; i < num_weapons; i ++){// initialize the magazines and reserve ammunition appropriately
	ammunition[i][0] = weapons[i][? "mag_capacity"]
	ammunition[i][1] = weapons[i][? "reserve_ammo"]
}












/*
	*---------------* INITIALIZE CALIBER STATISTICS *---------------*
*/
var num_calibers = 6; // the number of unique calibers
calibers[num_calibers - 1] = noone

for (var i = 0; i < num_calibers; i ++){
	calibers[i] = ds_map_create()
}

calibers[caliberType._r556][? "cal_name"] = "5.56x45mm NATO" // display name of the caliber
calibers[caliberType._r556][? "cal_sprite"] = spr_player_bullet_intermediate // the sprite for the bullet
calibers[caliberType._r556][? "casing_sprite"] = spr_player_casing_intermediate // the sprite for the casing
calibers[caliberType._r556][? "damage"] = 0 // the damage of the bullet
calibers[caliberType._r556][? "speed"] = 25 // speed of the bullet
calibers[caliberType._r556][? "number_of_shot"] = 1 // the number of bullets that are fired each shot

calibers[caliberType._r762][? "cal_name"] = "7.62x51mm NATO"
calibers[caliberType._r762][? "cal_sprite"] = spr_player_bullet_full_powered
calibers[caliberType._r762][? "casing_sprite"] = spr_player_casing_full_powered
calibers[caliberType._r762][? "damage"] = 0
calibers[caliberType._r762][? "speed"] = 25
calibers[caliberType._r762][? "number_of_shot"] = 1

calibers[caliberType._r50AE][? "cal_name"] = ".50 Action Express"
calibers[caliberType._r50AE][? "cal_sprite"] = spr_player_bullet_pistol_big
calibers[caliberType._r50AE][? "casing_sprite"] = spr_player_casing_pistol_big
calibers[caliberType._r50AE][? "damage"] = 0
calibers[caliberType._r50AE][? "speed"] = 25
calibers[caliberType._r50AE][? "number_of_shot"] = 1

calibers[caliberType._r12GAUGE][? "cal_name"] = "12 gauge"
calibers[caliberType._r12GAUGE][? "cal_sprite"] = spr_player_bullet_pellet
calibers[caliberType._r12GAUGE][? "casing_sprite"] = spr_player_casing_shotgun
calibers[caliberType._r12GAUGE][? "damage"] = 0
calibers[caliberType._r12GAUGE][? "speed"] = 25
calibers[caliberType._r12GAUGE][? "number_of_shot"] = 8

calibers[caliberType._r9x19][? "cal_name"] = "9x19mm Parabellum"
calibers[caliberType._r9x19][? "cal_sprite"] = spr_player_bullet_pistol_small
calibers[caliberType._r9x19][? "casing_sprite"] = spr_player_casing_pistol_small
calibers[caliberType._r9x19][? "damage"] = 0
calibers[caliberType._r9x19][? "speed"] = 25
calibers[caliberType._r9x19][? "number_of_shot"] = 1

calibers[caliberType._r408][? "cal_name"] = ".408 Cheyenne"
calibers[caliberType._r408][? "cal_sprite"] = spr_player_bullet_anti_materiel
calibers[caliberType._r408][? "casing_sprite"] = spr_player_casing_anti_materiel
calibers[caliberType._r408][? "damage"] = 0
calibers[caliberType._r408][? "speed"] = 25
calibers[caliberType._r408][? "number_of_shot"] = 1

scr_change_weapon(0)
