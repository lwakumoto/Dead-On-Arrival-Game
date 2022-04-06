/// @description Insert description here
// You can write your code in this editor
if(room == asset_get_index("Room1")){
	var cam_w = display_get_gui_width();
	var cam_h = display_get_gui_height();

	x = (cam_w/2)-270; 
	y = (cam_h/2);

	draw_set_color(c_white);
	draw_set_font(description);
	draw_text(x, y, "PRESS ENTER TO READ DESCRIPTION");


}
else if(room == asset_get_index("Room2")){
	draw_set_color(c_white);
	draw_set_font(description);
	draw_text(300, 300, "DESCRIPTION! Press enter");
}
else if(room == asset_get_index("Room3")){
	if(global.game_state == states.gameover and keyboard_check_pressed(vk_enter)){
		global.game_state = states.preplay;
		room_goto(asset_get_index("Room1"));
    	
	}
}
	
