/// @description This enemy is unique in that it doesn't necessarily attack the player, but it spawns enemies

was_spawned = false
max_hp = 250
hp = max_hp

spd = 2;
turning_spd = .05

value = 1000

spawn_delay = 5.0 // the rate at which it spawns enemies, increases as it loses health
alarm[0] = spawn_delay * room_speed


corpse_sprite = spr_enemy_car_corpse_flipped
image_xscale = 1.5
image_yscale = image_xscale
