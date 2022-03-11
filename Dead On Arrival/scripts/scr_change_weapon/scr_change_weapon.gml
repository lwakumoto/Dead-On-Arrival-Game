// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_change_weapon(wep_index){
	var curr_weapon = weapons[wep_index]
	
	weapon_id = curr_weapon[? "wep_id"]
	weapon_type = curr_weapon[? "wep_type"]
	weapon_name = curr_weapon[? "wep_name"]
	weapon_sprite = curr_weapon[? "wep_sprite"]
	weapon_reload = curr_weapon[? "wep_reload"]
	weapon_icon = curr_weapon[? "wep_icon"]
	magazine_capacity = curr_weapon[? "mag_capacity"]
	fire_type = curr_weapon[? "fire_type"]
	fire_delay = curr_weapon[? "fire_delay"]
	reload_time = curr_weapon[? "reload_time"]
	reload_type = curr_weapon[? "reload_type"]
	caliber_index = curr_weapon[? "caliber"]
	weapon_spread = curr_weapon[? "spread"]
	weapon_sound = curr_weapon[? "fire_sound"]
	weapon_range = curr_weapon[? "range"]
	
	var curr_caliber = calibers[caliber_index]
	caliber_name = curr_caliber[? "cal_name"]
	caliber_sprite = curr_caliber[? "cal_sprite"]
	casing_sprite = curr_caliber[? "casing_sprite"]
	caliber_damage = curr_caliber[? "damage"]
	caliber_speed = curr_caliber[? "speed"]
	caliber_num_shot = curr_caliber[? "number_of_shot"]


}