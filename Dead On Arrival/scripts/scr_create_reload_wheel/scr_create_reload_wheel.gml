// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_create_reload_wheel(xx,yy){
	instance_create_layer(xx,yy,"Instances", obj_reload_wheel)
	sprite_set_speed(spr_reload_wheel, (sprite_get_number(spr_reload_wheel))/reload_time, spritespeed_framespersecond);
}