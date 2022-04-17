draw_set_font(fnt_menu)
draw_sprite_ext(spr_pause_menu, 0, 0,0, global.camera_width/sprite_width,global.camera_height/sprite_height,0,c_white,1)


window_set_cursor(cr_arrow)

scr_draw_clickable_button(global.camera_width - (string_width("BACK") + 32), 25, "BACK", fnt_menu, 32,16, function(){instance_destroy()})

var text_offset_y = global.camera_height*.10
var text_offset_x = 50
var string_h = string_height("Test")
var string_sep_y = 25 // buffer between each string
var string_arr = [
"Movement - WASD",
"Fire Weapon - Left Mouse Button",
"Reload - R",
"Switch Weapon - Q/E or Scroll Wheel",
"Open Buy Menu - Spacebar"

]
draw_text_transformed(text_offset_x,text_offset_y,"Controls",2,2,0 )

for (var i = 0; i < array_length(string_arr); i ++){
	var text_pos = text_offset_y + (string_h + string_sep_y)*(i+1)
	draw_text(text_offset_x,text_pos,string_arr[i])
}
