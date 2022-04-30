/// @description Insert description here
// You can write your code in this editor
// toggle fullscreen
if (keyboard_check(vk_shift) && keyboard_check_pressed((ord("F")))){
	if (window_get_fullscreen()){
		window_set_fullscreen(false)	
	} else{
		window_set_fullscreen(true)
	}	
}