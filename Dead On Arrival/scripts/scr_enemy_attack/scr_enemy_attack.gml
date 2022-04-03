// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// return the appropriate
function scr_enemy_attack(){
	attack_function = function(){
		if (point_distance(x,y,obj_player.x,obj_player.y) < 100){
			obj_player.curr_hp -= 10	
		}
	}
	return attack_function
}


