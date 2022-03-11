/// @description Insert description here
// You can write your code in this editor

if (!reloading){
	sprite_index = weapon_sprite
} else{ // if the player is reloading, play the reloading animation
	if (weapon_reload != undefined){
		image_speed = 1
		sprite_index = weapon_reload
		sprite_set_speed(weapon_reload, (sprite_get_number(weapon_reload))/reload_time, spritespeed_framespersecond);
	}
}


draw_self()
