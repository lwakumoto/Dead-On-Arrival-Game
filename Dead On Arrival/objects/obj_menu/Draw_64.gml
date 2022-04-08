/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
if (menu_active){

	draw_sprite_ext(sprite_index,image_index,0,0,menu_width div sprite_width, menu_height div sprite_height,0,c_white,1)

	draw_set_font(fnt_menu)
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)

	hovering = -1
	// draw the text, check if its selected by the mouse
	for (var i = 0; i < array_length(menu_item); i ++){
		
		var weapon_name = menu_item[i][? "wep_name"]
		
		var text_x = menu_width/2 - string_width(weapon_name)/2
		var text_y = op_border_height*2*i + op_space * i + op_y_offset
		
		
		
		draw_rectangle(menu_width/2 - op_border_width, text_y - op_border_height, menu_width/2 + op_border_width, text_y + string_height(weapon_name ) + op_border_height,true)
		// check if the player is hovering over a menu item
		if (point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),
			menu_width/2 - op_border_width, text_y - op_border_height, menu_width/2 + op_border_width, text_y + string_height(weapon_name ) + op_border_height)
			&& !scr_player_has_weapon(menu_item[i][? "wep_id"])){
			
			hovering = i
		}
		
		if (hovering == i){
				draw_set_color(c_yellow)	
		}
		
		if (scr_player_has_weapon(menu_item[i][? "wep_id"])){
			draw_set_color(c_grey)
		}
			
		draw_text(text_x,text_y,weapon_name)
		draw_set_color(c_white)
		
	}
		

	if (hovering != -1){
		window_set_cursor(cr_handpoint)	
	} else{
		window_set_cursor(cr_arrow)	
	}
	
	if (selected_item != noone){
		draw_text(0,0,menu_item[selected_item][? "wep_name"])
		scr_draw_icon(0,0,200,menu_item[selected_item][? "wep_icon"])
	}


}
else{
	window_set_cursor(cr_none)	
	hovering = -1
	selected_item = noone
}

