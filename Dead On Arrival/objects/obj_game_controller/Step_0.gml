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


/*
if (mouse_check_button_pressed(mb_left)){
		scr_create_explosion(mouse_x,mouse_y,200,100,.009)
}
