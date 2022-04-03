// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_check_for_player(){
	if (instance_exists(obj_player)){
		var dis = distance_to_object(obj_player);
		
		if ((dis < alert_dist || alert) && (dis > attack_dis) && can_attack){
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
					path_start(path,move_spd, path_action_stop, false);
				}
			}
		} else{
			if (dis <= attack_dis){
				if (can_attack){ // play the attack function if they're in range
					sprite_index = attack_animation
					image_speed = 1
					path_end()
					can_attack = false
					alarm[0] = attack_delay * room_speed
					alarm[1] = attack_delay * room_speed / 2
						
					
				}
			}
		}
	}
}