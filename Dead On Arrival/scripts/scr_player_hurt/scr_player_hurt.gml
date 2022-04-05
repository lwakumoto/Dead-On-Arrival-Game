// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_hurt(player_id, damage){
	if (instance_exists(player_id)){
		player_id.curr_hp -= ceil(damage)	
	}
}