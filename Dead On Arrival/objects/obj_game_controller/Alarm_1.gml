/// @description Spawn enemy
var rand_x = random_range(0,room_width)
var rand_y = random_range(0,2000)


	
repeat(1){
	while (collision_circle(rand_x,rand_y,50,obj_obstacle,true,true)
	|| collision_circle(rand_x,rand_y,250,obj_player,true,true)){
		var rand_x = random_range(0,room_width)
		var rand_y = random_range(0,2000)	
	}	

	
	var enemy_type = obj_enemy
	var enemy_chooser = random_range(0,100)
	if (enemy_chooser <= 45){
		enemy_type = obj_enemy	
	}
	else if(enemy_chooser <= 50){
		enemy_type = obj_enemy_crawler	
	}
	else if(enemy_chooser <= 55){
		enemy_type = obj_enemy_spitter	
	}
	else if(enemy_chooser <= 85){
		enemy_type = obj_enemy_animal
	}
	else if(enemy_chooser <= 97){
		enemy_type = obj_enemy_boomer
	}
	else{
		enemy_type = obj_enemy_car
	}
	wave_progress --
	instance_create_layer(rand_x,rand_y,"Enemies",enemy_type)

}
