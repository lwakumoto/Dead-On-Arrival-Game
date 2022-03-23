/// @description Insert description here
// You can write your code in this editor

// make sure enemies are only hit once by any given bullet
if (ds_list_find_index(enemies_hit,other) == -1){
	ds_list_add(enemies_hit,other)
	scr_bullet_hit(id,other)
	
	damage *= 0.95 // decrease damage slightly
	damage = ceil(damage)
}
