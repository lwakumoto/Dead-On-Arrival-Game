// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// draw a clickable button with the text centered
function scr_draw_clickable_button(xx, yy, string, font, horizontal_padding, vertical_padding, onClick = noone){
	


	draw_set_font(font)
	var text_width = string_width(string)
	var text_height = string_height(string)
	
	
	// check if hovering mouse
	var button_width = (horizontal_padding * 2) + text_width
	var text_scale = 1

	var hover = false
	if (point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),xx,yy,
	xx + text_width + horizontal_padding * 2, yy + text_height + vertical_padding * 2)){
			draw_set_color(c_yellow)	
			window_set_cursor(cr_handpoint)	
			hover = true
	}
	
	draw_sprite_ext(spr_buy_menu_button,image_index,xx,yy,
		(button_width) / sprite_get_width(spr_buy_menu_button), 
		(text_height + vertical_padding * 2) / sprite_get_width(spr_buy_menu_button)
		,0,c_white,1)
	

	draw_text_transformed(xx + horizontal_padding ,yy + vertical_padding, string, text_scale, text_scale, 0)
	draw_set_color(c_white)
	
	if (hover && mouse_check_button_pressed(mb_left)){
		if (onClick != noone){
			onClick()	// anonymous function that will run when the button is clicked
		}
	}
		
}