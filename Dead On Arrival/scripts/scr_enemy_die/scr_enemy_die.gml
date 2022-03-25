// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_die(){
	var corpse = instance_create_layer(x,y,"Bullets",obj_corpse);
	corpse.sprite_index = corpse_sprite
	corpse.image_angle = image_angle
	instance_destroy()
}