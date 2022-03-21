/// @description Insert description here
// You can write your code in this editor
if (keyboard_check(vk_shift)){
	draw_set_alpha(0.2);
	mp_grid_draw(global.mp_grid);
	draw_set_alpha(1.0);
}
