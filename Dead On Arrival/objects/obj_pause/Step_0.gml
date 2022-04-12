/// @description Insert description here
// You can write your code in this editor

var pause_key = keyboard_check_pressed(vk_escape)

if (pause_key){
	if (!instance_exists(obj_pause)){
		instance_create_layer(0,0,"Game_Objects",obj_pause)	
	} else{
		instance_destroy(obj_pause)	
	}
}

