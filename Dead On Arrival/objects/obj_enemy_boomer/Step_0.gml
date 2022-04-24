/// @description Insert description here
// You can write your code in this editor
event_inherited()

if (!can_attack){
	if (!boom_mode){
		audio_stop_sound(useSound)
		useSound2 = audio_play_sound_on(myEmitter,so_bomb_fast,0,2);
	}
	boom_mode = true	
}
