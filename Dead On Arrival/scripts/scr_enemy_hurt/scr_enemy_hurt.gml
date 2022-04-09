// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_hurt(enemy, damage){
	if (instance_exists(enemy)){
		enemy.hp -= ceil(damage);
		audio_play_sound(so_zombie_hit, 1, false);
	}
}