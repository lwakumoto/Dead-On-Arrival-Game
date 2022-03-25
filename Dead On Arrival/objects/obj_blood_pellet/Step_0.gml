/// @description Insert description here
// You can write your code in this editor
if (speed <= 0.01 || place_meeting(x,y,obj_obstacle)){
	instance_destroy();	
	part_particles_create(global.particle_system,x,y,global.blood_particle,1)
}

