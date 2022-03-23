/// @description Insert description here
// You can write your code in this editor
draw_self()

if (height <= 0){
	if (surface_exists(global.surface)){
		image_alpha = 0
		
		surface_set_target(global.surface);
		draw_set_alpha(0.3);
		draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,image_angle,c_white,0.3);
		draw_set_alpha(1.0);
		surface_reset_target();
	}
	else{
		global.surface = surface_create(room_width,room_height);	
	}
		
}
