/// @description Insert description here
// You can write your code in this editor
if (keyboard_check_pressed(ord("P"))){
	game_restart();	
}

if (keyboard_check_pressed(ord("K"))){
	gpu_set_tex_filter(true)
}

if (keyboard_check_pressed(ord("L"))){
	gpu_set_tex_filter(false)
}

var pause_key = keyboard_check_pressed(vk_escape)

if (instance_number(obj_enemy_parent) == 0){
	alarm[0] = wave_delay = 10 * room_speed
	curr_wave ++
}


if (pause_key){
		instance_create_layer(0,0,"Game_Objects",obj_pause)	
}


/*
if (mouse_check_button_pressed(mb_left)){
		scr_create_explosion(mouse_x,mouse_y,200,100,.009)
}
