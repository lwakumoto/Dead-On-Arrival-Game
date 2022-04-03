// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_die(enemy){
	var corpse = instance_create_layer(enemy.x,enemy.y,"Corpses",obj_corpse);
	corpse.sprite_index = enemy.corpse_sprite
	corpse.image_angle = image_angle
	instance_destroy()
}