/// @description This enemy is unique in that it doesn't necessarily attack the player, but it spawns enemies

was_spawned = false
max_hp = 250
hp = max_hp

spd = 2;
turning_spd = .05


spawn_delay = 5.0 // the rate at which it spawns enemies, increases as it loses health
alarm[0] = spawn_delay * room_speed


corpse_sprite = spr_enemy_car_corpse_flipped
image_xscale = 2
image_yscale = image_xscale

value = 15
coin_type = 2



myEmitter = 0;
fallStart = 500;
maxDist = 1000;
useSound = so_car_drive


myEmitter = audio_emitter_create();	
audio_falloff_set_model(audio_falloff_exponent_distance);
audio_emitter_falloff(myEmitter,fallStart,maxDist,1);
audio_play_sound_on(myEmitter,useSound,1,2);
audio_play_sound(so_car_honk,4,0);

hurt_sound = so_metal_impact
death_sound = so_explosion
