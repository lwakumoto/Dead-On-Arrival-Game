// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_create_part_type(sprite, blend, min_life, max_life, min_scale, max_scale, scaling){
	var type = part_type_create()
	part_type_alpha2(type, .75, 0)
	part_type_sprite(type, sprite, false, true, false)
	part_type_blend(type, blend)
	part_type_size(type,min_scale,max_scale,scaling,0)
	part_type_life(type,min_life,max_life)
	part_type_orientation(type,0,360,0,0,0)
	
	return type
}