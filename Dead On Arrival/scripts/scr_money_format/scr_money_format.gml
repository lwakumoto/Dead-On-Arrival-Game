// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_money_format(str){
	draw_set_color(c_green)
	var result = ""
	var len = string_length(str)
	var com = 0
	for (var i = len; i > 0; i --){
		
		if (com%3 == 0 && com != 0){
			result = "," + result	
		}
		com++
		result = string_char_at(str,i) + result
	}
	return "$" + result
	draw_set_color(c_white)
}