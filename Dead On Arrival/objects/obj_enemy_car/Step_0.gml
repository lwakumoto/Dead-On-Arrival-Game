/// @description Insert description here
// You can write your code in this editor


// drive towards the player, regardless of obstacles inbetween them
if (instance_exists(obj_player)){
	var _dir = point_direction(x, y, obj_player.x, obj_player.y);
	var _diff = angle_difference(_dir, image_angle);
	direction += _diff * turning_spd;
	image_angle = direction
	

	if (point_distance(x,y,obj_player.x,obj_player.y) > 50){
		speed = 1
	}
	else{
		speed = 0	
	}

}

spawn_delay = lerp(2.5,5.0,hp/max_hp) // as health gets lower, the rate between spawning enemies increases


if (hp <= 0){
	scr_create_explosion_particle(x,y,100)
	scr_enemy_die(x,y,id,false)	
}

// move the emitter so it follows the car
audio_emitter_position(myEmitter, x, y, 0)


