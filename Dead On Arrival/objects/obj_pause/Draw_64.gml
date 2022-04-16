// Draw the menu

draw_sprite_ext(spr_pause_menu, 0, 0,0, global.camera_width/sprite_width,global.camera_height/sprite_height,0,c_white,1)


window_set_cursor(cr_arrow)

draw_set_font(fnt_pause)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_text(global.camera_width/2, global.camera_height/3, "PAUSED")
draw_set_halign(fa_left)
draw_set_valign(fa_top)

scr_draw_clickable_button(global.camera_width/2, global.camera_height/2, "RESUME", fnt_menu, 32,16, function(){instance_destroy()})
scr_draw_clickable_button(global.camera_width/2, global.camera_height/2 + 64, "RESTART", fnt_menu, 32,16, function(){game_restart()
	part_system_destroy(global.particle_system)
part_system_destroy(global.explosion_system)
part_system_destroy(global.blood_particle)
part_system_destroy(global.smear_particle)

part_type_destroy(global.explosion_center_part)
part_type_destroy(global.explosion_particle_part)
part_type_destroy(global.smoke_particle_part)})
scr_draw_clickable_button(global.camera_width/2, global.camera_height/2 + 128, "QUIT", fnt_menu, 32, 16, function(){game_end()})
