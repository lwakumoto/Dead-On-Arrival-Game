/// @description spawn_enemy
enemy_choice = [obj_enemy,obj_enemy_animal, obj_enemy_boomer, obj_enemy_crawler, obj_enemy_spitter]
if (!place_meeting(x,y,obj_obstacle)){
	repeat(irandom_range(1,2)){ // spawn 1-2 enemies
		global.enemiesLeft++
	with(instance_create_layer(x,y,"Enemies",enemy_choice[irandom_range(0,array_length(enemy_choice) - 1)])){
		was_spawned = true // enemies spawned in this manner cannot drop coins	
		
	}
	
	
	}
	alarm[0] = spawn_delay * room_speed
} else{
	alarm[0] = 10
}



