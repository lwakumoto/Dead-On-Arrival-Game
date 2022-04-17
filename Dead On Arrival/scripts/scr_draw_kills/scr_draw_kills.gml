// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_kills(){
	draw_set_color(c_white)
	draw_set_font(fnt_health)

	draw_text(10,10 + string_width("H"),"Funds: " + string(global.displayed_money ))
}
