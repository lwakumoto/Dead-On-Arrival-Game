/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

max_hp = 15
hp = max_hp

corpse_sprite = spr_enemy_animal_corpse

alert_dist = 5000
attack_dis = 10
attack_delay = 0.15
idle_sprite = spr_enemy_animal
attack_delay = 0.125
attack_animation = spr_enemy_animal_attack
attack_func = scr_enemy_attack()
damage = irandom_range(1,1.5)
move_spd = random_range(8.5,10)
value = 150
