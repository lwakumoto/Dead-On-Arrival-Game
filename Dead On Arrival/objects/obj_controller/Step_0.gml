/// @description Insert description here
// You can write your code in this editor

if(room == asset_get_index("Room1")){
	global.game_state = states.preplay;
	//var rm = asset_get_index("Room1");
	if(keyboard_check_pressed(vk_enter)){
		room_goto_next();
	}
	
	if(keyboard_check_pressed(vk_escape)){
		game_end();
	}

}else if(room == asset_get_index("Room2")){
	if (keyboard_check_pressed(vk_enter)){
		global.game_state = states.gameover;
		room_goto_next();
	}
}else if(room == asset_get_index("Room3")){
	
}
	
