
	draw_set_halign(fa_right)
	draw_text(global.camera_width - 10,10,"Wave: " + string(curr_wave))
	draw_text(global.camera_width - 10, 10 + string_height("Test"), "Enemies: " + string(instance_number(obj_enemy_parent)))
	draw_set_halign(fa_left)
