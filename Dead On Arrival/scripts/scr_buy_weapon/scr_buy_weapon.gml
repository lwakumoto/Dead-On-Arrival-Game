// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_buy_weapon(wep_id){
	if (instance_exists(obj_player) && instance_exists(obj_player_weapon)){
		if (!scr_player_has_weapon(wep_id)){
			ds_list_add(obj_player.weapon_inventory,wep_id)
		}
	}
	else{
		show_debug_message("EITHER THE PLAYER OR THE WEAPON OBJECT DOESN\" EXIST")
		return -1
	}
}