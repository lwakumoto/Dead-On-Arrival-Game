// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_die(x_origin,y_origin,enemy,by_explosion,coin_type){
	
	if (!by_explosion){ // if the death was caused by an explosion, we want to spawn a blood smear and gibs instead of a regular corpse
		var corpse = instance_create_layer(enemy.x,enemy.y,"Corpses",obj_corpse);
		corpse.sprite_index = enemy.corpse_sprite
		corpse.image_angle = image_angle
		corpse.image_xscale = image_xscale
		corpse.image_yscale = image_yscale
		instance_destroy(enemy)
		audio_play_sound(so_zombie_death, 1, false);
		if (!was_spawned){
		scr_drop_money(x_origin,y_origin,enemy.value,enemy.coin_type) // only drop money if they aren't killed by an explosion or if it wasn't spawned by a car
		}
	}
	else{
		var _direction = point_direction(enemy.x,enemy.y,x_origin,y_origin)
		// create blood and smear particles
		part_type_direction(global.smear_particle,_direction,_direction,0,0);
		part_particles_create(global.particle_system,enemy.x,enemy.y,global.smear_particle,1)
		
		repeat(random_range(7,10)){
			var pellet = instance_create_layer(enemy.x,enemy.y,"Instances",obj_blood_pellet);
			pellet.direction = -_direction + random_range(-15,15);
			pellet.image_angle = -_direction
		}
		instance_destroy(enemy)
		scr_drop_money(x_origin,y_origin,enemy.value,enemy.coin_type)
	}
	global.totalKills ++
	global.enemiesLeft --

}