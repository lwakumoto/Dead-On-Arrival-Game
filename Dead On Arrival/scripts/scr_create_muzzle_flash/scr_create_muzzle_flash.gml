// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_create_muzzle_flash(pos_x, pos_y,dir){
	var flash = instance_create_layer(pos_x,pos_y,"Instances",obj_muzzle_flash)
	flash.image_angle = dir
}