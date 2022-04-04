// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// return the appropriate
function scr_enemy_attack(){
	attack_function_normal = function(dmg){
		image_speed = 1/attack_delay
		var attack_radius = 100
		if ((point_distance(x,y,obj_player.x,obj_player.y) < attack_radius 
		&& abs(angle_difference(image_angle,point_direction(x,y,obj_player.x,obj_player.y))) < 100)
		|| place_meeting(x,y,obj_player)){
			obj_player.curr_hp -= dmg	
		}
	}
	
	attack_function_boomer = function(dmg){
		image_speed = 3
	}
	
	switch (object_index){ // return the appropriate function
		case obj_enemy:
			return attack_function_normal
			break;
		case obj_enemy_boomer:
			return attack_function_boomer
			break;
	}
}


