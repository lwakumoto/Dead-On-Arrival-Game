/// @description Insert description here
// You can write your code in this editor

if (keyboard_check_pressed(vk_enter)){
	audio_stop_sound(so_ominous)
	audio_play_sound(so_gunire,1,false)
	room_goto_next()	
}
