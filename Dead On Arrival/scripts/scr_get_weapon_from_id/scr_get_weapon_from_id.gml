// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_get_weapon_from_id(wep_id){
	if (instance_exists(obj_player_weapon)){
		return obj_player_weapon.weapons[wep_id]
	} else{
		return noone	
	}
	
}
