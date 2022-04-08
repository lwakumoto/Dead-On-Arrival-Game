// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_create_explosion_particle(xx, yy, radius){
	repeat(15){
		instance_create_layer(xx + random_range(-radius/2,radius/2), yy + random_range(-radius/2,radius/2),"Instances", obj_explosion_piece)	
	}
	
	part_type_scale(global.explosion_center_part, radius/sprite_get_width(spr_explosion_center)*2,
													radius/sprite_get_width(spr_explosion_center)*2)
	part_particles_create(global.explosion_system,
	xx, yy, global.explosion_center_part,1)
}