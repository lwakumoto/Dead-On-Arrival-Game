// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_create_explosion_particle(xx, yy){
	repeat(15){
		instance_create_layer(xx + random_range(-16,16), yy + random_range(-16,16),"Instances", obj_explosion_piece)	
	}
	
	part_particles_create(global.explosion_system,
	xx, yy, global.explosion_center_part,3)
}