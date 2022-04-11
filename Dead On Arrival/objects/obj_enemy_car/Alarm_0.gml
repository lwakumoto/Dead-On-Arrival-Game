/// @description Insert description here
// You can write your code in this editor

enemy_choice = [obj_enemy,obj_enemy_animal, obj_enemy_boomer, obj_enemy_crawler, obj_enemy_crawler]
if (!place_meeting(x,y,obj_obstacle)){
	repeat(irandom_range(2,4)){ // spawn 2-4 enemies
	with(instance_create_layer(x,y,"Enemies",enemy_choice[irandom(array_length(enemy_choice) - 1)])){
		was_spawned = true // enemies spawned in this manner cannot drop coins	
	}
	
	
	}
	alarm[0] = spawn_delay * room_speed
} else{
	alarm[0] = 10
}



