// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_icon(xx, yy, height, icon){


	var max_height = height - 25
	var max_width = max_height * 2
	var rect_height = height 
	var rect_width = max_width + 50

	// draw transparent box
	draw_set_alpha(0.5)
	draw_rectangle_color(xx,yy,xx + rect_width, yy + rect_height,c_grey,c_grey,c_grey,c_grey,false)
	draw_set_alpha(1)



		// draw the weapon icon

		var scale = min(max_height/sprite_get_height(icon), max_width/sprite_get_width(icon))
		var y_offset = height/2


		draw_sprite_ext(icon, 0,xx + rect_width/2,yy + y_offset, scale, scale, 0, c_white, 1)



}