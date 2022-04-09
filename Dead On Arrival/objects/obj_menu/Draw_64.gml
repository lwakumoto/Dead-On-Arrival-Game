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
		
		var text_x_percent = (3/4)
		var text_x = menu_width*text_x_percent - string_width(weapon_name)/2
		var text_y = op_border_height*2*i + op_space * i + op_y_offset
		var button_color = c_white
		var button_width = op_border_width*2
		var text_scale = 1
		
		
		
		// check if the player is hovering over a menu item
		if (point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),
			menu_width*text_x_percent - op_border_width, text_y - op_border_height, menu_width*text_x_percent + op_border_width, text_y + string_height(weapon_name ) + op_border_height)
			){ //&& !scr_player_has_weapon(menu_item[i][? "wep_id"])){
			
			hovering = i
		}
		
		// if the mouse is hovering over the option, color the text and the button yellow
		if (hovering == i){
				draw_set_color(c_yellow)	
				button_width = op_border_width * 2.5
				text_scale = 1.1
		}
		
		draw_sprite_ext(spr_buy_menu_button,image_index,menu_width * text_x_percent - button_width/2,text_y - op_border_height,
		button_width / sprite_get_width(spr_buy_menu_button),  (op_border_height * 2 + op_space) / sprite_get_width(spr_buy_menu_button),0,button_color,1)
		
		if (scr_player_has_weapon(menu_item[i][? "wep_id"])){
			draw_set_color(c_green)
		}
			
		draw_text_transformed(text_x,text_y,weapon_name,text_scale,text_scale,0)
		draw_set_color(c_white)
		
	}
		

	if (hovering != -1){
		window_set_cursor(cr_handpoint)	
	} else{
		window_set_cursor(cr_arrow)	
	}
	
	if (selected_item != noone){
		if (!scr_player_has_weapon(menu_item[selected_item][? "wep_id"])){
			scr_draw_icon(10,10,global.camera_width/4,menu_item[selected_item][? "wep_silhouette"])
		} else{
			scr_draw_icon(10,10,global.camera_width/4,menu_item[selected_item][? "wep_icon"])
		}
		draw_text(0,0,menu_item[selected_item][? "wep_name"])
		
	}

	
	// Draw the weapon statistics and the buy button

	if (selected_item != noone){

		
		if (!scr_player_has_weapon(menu_item[selected_item][? "wep_id"])){ // If the player already has the weapon, sell ammo instead
			
			draw_set_color(c_green)
			draw_text_transformed(10,global.camera_height/2, "Cost: " + scr_money_format(menu_item[selected_item][? "wep_cost"]), 1.5,1.5,0)
			draw_set_color(c_white)
			
			
			scr_draw_clickable_button(global.camera_width/3,global.camera_height/2,"BUY", fnt_menu, 32, 16, function(){scr_buy_weapon(menu_item[selected_item])})
		} else{
			scr_draw_clickable_button(global.camera_width/3,global.camera_height/2,"BUY AMMO", fnt_menu, 32, 16, function(){})
		}
	}
}
else{
	window_set_cursor(cr_none)	
	hovering = -1
	selected_item = noone
}

