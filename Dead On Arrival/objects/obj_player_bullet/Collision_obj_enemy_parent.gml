/// @description Insert description here
// You can write your code in this editor

show_debug_message(ds_list_find_index(enemies_hit, other))
if (ds_list_find_index(enemies_hit,other) == -1){
	ds_list_add(enemies_hit,other)
	scr_bullet_hit(id,other)
}
