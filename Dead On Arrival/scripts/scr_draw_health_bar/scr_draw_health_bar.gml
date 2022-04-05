// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// draw the health bar at the given position
function scr_draw_health_bar(xx, yy, current, maximum){
	
	draw_healthbar(xx + 100, yy, xx + 490, yy + 45, (current/maximum)*100,c_black,c_red,c_lime,0,true,true)
	draw_sprite(spr_health_bar,0,xx,yy)

	draw_set_font(fnt_health)
	var text_x = xx + 25
	var text_y = yy + 25
	
	// shake the text if the player is low on health (< 20%)
	
	var text_shake = 0
	if (((current/maximum)*100) < 20){
		draw_set_color(c_red)
		text_shake = random_range(-1,1)
	}
	else{
		draw_set_color(c_white)	
	}
	
	current = max(current,0)
	current = floor(current)
	if (current == maximum){
		draw_set_color(c_lime)	
	}
	draw_text(xx + 25 + text_shake, yy + 12.5 + text_shake,current)
	draw_set_color(c_white)
}