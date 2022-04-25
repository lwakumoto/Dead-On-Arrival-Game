/// @description Insert description here
// You can write your code in this editor
draw_self()
draw_set_font(fnt_start)
draw_set_halign(fa_center)
if (!text_blink){
	draw_text(room_width/2,room_height * (3/4), "Press Enter")
}
draw_set_halign(fa_left)
