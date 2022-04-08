// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// check if the player already has that weapon in the inventory
function scr_player_has_weapon(wep_id){
	if (instance_exists(obj_player) && instance_exists(obj_player_weapon)){
		if (ds_list_find_index(obj_player.weapon_inventory,wep_id) == -1){
			return false
		}
		else{
			return true
		}
	}
}