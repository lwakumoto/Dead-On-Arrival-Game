// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_create_blood_system(){
	var part = part_type_create();
	part_type_sprite(part, spr_blood_puddle,0,0,true);
	part_type_size(part,1,1,0,0);
	part_type_color1(part,c_white);
	part_type_alpha1(part,1);
	part_type_speed(part,0,0,0,0);
	part_type_direction(part,0,0,0,0)
	part_type_orientation(part,0,0,0,0,true);
	part_type_blend(part,false);
	part_type_life(part,99999,99999);
	return part
}