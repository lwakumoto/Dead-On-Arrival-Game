/// @description Insert description here
// You can write your code in this editor
draw_self()
//draw_healthbar(x-50,y+50,x+50,y+ 40,(curr_hp/max_hp)*100,c_black,c_red,c_lime,0,true,true)
scr_draw_health_bar(room_width - sprite_get_width(spr_health_bar),
					room_height - sprite_get_height(spr_health_bar),curr_hp,max_hp)
