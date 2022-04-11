// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_check_for_player(){
	var _has_player_line_of_sight =  !collision_line(x,y,obj_player.x,obj_player.y,obj_obstacle,true,true)
	
	if (instance_exists(obj_player)){
		var _diff = angle_difference(direction, image_angle);
		image_angle += _diff * 0.1;
		direction = image_angle
		var dis = distance_to_object(obj_player);
		
		
		if ((dis < alert_dist || alert) && (dis > attack_dis) && can_attack || !_has_player_line_of_sight ){
			alert = true // set enemy to alert when they enter the radius
			if (calc_path_timer-- <= 0){
				calc_path_timer = calc_path_delay;
				if (dis > 100){
					var found_player = mp_grid_path(global.mp_grid,path,x,y,obj_player.x + bias,obj_player.y + bias,choose(0,1))
				}
				else{
					var found_player = mp_grid_path(global.mp_grid,path,x,y,obj_player.x,obj_player.y,choose(0,1))
				}
				
		
				// start path if we can reach the player
				if (found_player){
					path_start(path,move_spd, path_action_continue, false);
				}
			}
		} else{
			if (dis <= attack_dis && _has_player_line_of_sight){
				if (can_attack){ // play the attack function if they're in range
					sprite_index = attack_animation
					path_end()
					can_attack = false
					alarm[0] = attack_delay * room_speed // set the can_attack to true
					alarm[1] = attack_delay * room_speed // actually make the attack 
						
					
				}
			}
		}
	}
}