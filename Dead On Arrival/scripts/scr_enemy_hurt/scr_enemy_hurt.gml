// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_hurt(enemy, damage){
	if (instance_exists(enemy)){
		audio_sound_pitch(enemy.hurt_sound,random_range(0.8,1.2))
		audio_play_sound(enemy.hurt_sound, 1, false);
		enemy.hp -= ceil(damage);
	}
}