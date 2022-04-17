
	draw_set_halign(fa_right)
	draw_set_font(fnt_health)
	draw_set_color(c_white)
	draw_text(global.camera_width - 10,10,"Wave: " + string(curr_wave))
	draw_text(global.camera_width - 10, 10 + string_height("Test"), "Enemies: " + string(instance_number(obj_enemy_parent)))
	
	
	// when the player dies, create a text effect
	if (display_dead_text){
		
		dead_text_size += (1 - dead_text_size)/15;
		dead_text_size = max(dead_text_size,1)
		
		draw_set_halign(fa_middle)
		draw_set_valign(fa_middle)
		draw_set_font(fnt_game_over)
		draw_text_transformed(global.camera_width/2,global.camera_height/2,death_text,dead_text_size,dead_text_size,0)
		draw_set_font(fnt_health)
		
		if (dead_text_size <= 1.1){
			draw_text(global.camera_width/2, global.camera_height/2  + string_height("Hello") + 25,	"Press R to Restart")
		}
		
		draw_set_valign(fa_top)
		
		
	}
	

	draw_set_halign(fa_left)
	
	draw_text(10,20 + string_width("H"),"Kills: " + string(global.totalKills))
	

