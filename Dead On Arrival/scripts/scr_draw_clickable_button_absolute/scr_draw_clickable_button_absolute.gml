// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_clickable_button_absolute(v_align,h_align, xx, yy, string, font, width, height, onClick = noone){
	draw_set_font(font)
	draw_set_valign(v_align)
	draw_set_halign(h_align)
	
	var hover = false
	var hover_width = 0
	
		if (point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),
		xx - width/2,yy - height/2,xx + width/2,yy + height/2)){
			draw_set_color(c_yellow)	
			window_set_cursor(cr_handpoint)	
			hover = true
			hover_width = width*.5
			
	}
	
	
	
	draw_sprite_ext(spr_buy_menu_button,0,xx - width/2 - hover_width/2,yy - height/2,	(width + hover_width) / sprite_get_width(spr_buy_menu_button), 
		(height) / sprite_get_width(spr_buy_menu_button)
		,0,c_white,1)
	draw_text(xx,yy,string)
	
	if (hover && mouse_check_button_pressed(mb_left)){
		if (onClick != noone){
			onClick()	// anonymous function that will run when the button is clicked
		}
	}
	
	
	draw_set_color(c_white)
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)
}