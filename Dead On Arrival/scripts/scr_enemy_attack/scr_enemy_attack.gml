// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// return the appropriate
function scr_enemy_attack(){
	// the attack function the regular enemy will use
	attack_function_normal = function(dmg){
		

		image_angle = point_direction(x,y,obj_player.x,obj_player.y);
		
		var attack_radius = 100
		if ((point_distance(x,y,obj_player.x,obj_player.y) < attack_radius 
		&& abs(angle_difference(image_angle,point_direction(x,y,obj_player.x,obj_player.y))) < 100)
		|| place_meeting(x,y,obj_player)){
			scr_player_hurt(obj_player,dmg)
		}
	}
	
	// the attack function the boomer will use
	attack_function_boomer = function(dmg){
		
		scr_create_explosion(x,y,200,dmg,.009)
		
	}
	
	attack_function_spitter = function(dmg){
		image_angle = point_direction(x,y,obj_player.x,obj_player.y);
		var projectile = instance_create_layer(x,y,"Instances",obj_spitter_projectile)
		projectile.speed = 10
		projectile.direction = direction
		projectile.image_angle = direction
		projectile.dmg = dmg
	}
	
	switch (object_index){ // return the appropriate function
		case obj_enemy:
			return attack_function_normal
			break;
			
		case obj_enemy_crawler:
		return attack_function_normal
			break;
			
		case obj_enemy_animal:
		return attack_function_normal
			break;
			
		case obj_enemy_boomer:
			return attack_function_boomer
			break;
			
		case obj_enemy_spitter:
			return attack_function_spitter
			break;
	}
}


