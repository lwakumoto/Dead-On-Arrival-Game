/// @description Insert description here
// You can write your code in this editor
image_angle += rotational_velocity
x += casing_vel[0]* spd
y -= casing_vel[1] * spd

if (height <= 0 && spd != 0){
	spd = 0	
	rotational_velocity = 0
	audio_play_sound(so_spent_casing,1,false)
	image_alpha = 0
	

	

	part_type_direction(part_effect,0,360,0,0);
	part_particles_create(global.particle_system, x,y,part_effect,1);	
	instance_destroy();
}
else{
	height -= 10
	height = max(height,0)
}

// let the casing bounce off of walls
if (place_meeting(x + casing_vel[0] * spd, y,obj_obstacle)){
	casing_vel[0] *= -1;
	spd *= .5

}
if (place_meeting(x, y - casing_vel[1] * spd,obj_obstacle)){
	casing_vel[1] *= -1;
	spd *= .5

}


image_xscale = lerp(0.8,1,height/max_height)
image_yscale = image_xscale