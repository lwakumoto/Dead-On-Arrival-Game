// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_fire_weapon(x,y, dir){
	var new_bullet = instance_create_layer(x,y,"Instances",obj_player_bullet)
	new_bullet.direction = dir
	new_bullet.image_angle = dir
	

}