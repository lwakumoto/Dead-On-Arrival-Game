/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

max_hp = 25
hp = max_hp

corpse_sprite = spr_enemy_boomer_corpse

alert_dist = 5000
attack_dis = 10
attack_delay = .75
idle_sprite = spr_enemy_boomer
attack_animation = spr_enemy_boomer_attack
attack_func = scr_enemy_attack()
damage = 150
move_spd = random_range(3.2,3.8)
value = 5
coin_type = 1

boom_mode = false
myEmitter = 0;
fallStart = 500;
maxDist = 1000;

myEmitter = audio_emitter_create();	
audio_falloff_set_model(audio_falloff_exponent_distance);
audio_emitter_falloff(myEmitter,fallStart,maxDist,1);
useSound = audio_play_sound_on(myEmitter,so_bomb_slow,1,2);
useSound2 = -1





