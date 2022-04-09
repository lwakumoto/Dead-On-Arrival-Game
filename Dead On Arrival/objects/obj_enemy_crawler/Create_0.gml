/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

max_hp = 15
hp = max_hp

corpse_sprite = spr_enemy_crawler_corpse

alert_dist = 500
attack_dis = 10
attack_delay = 0.25
idle_sprite = spr_enemy_crawler
attack_delay = 0.125
attack_animation = spr_enemy_crawler_attack
attack_func = scr_enemy_attack()
damage = irandom_range(1,2)
move_spd = random_range(4.5,5)
value = 300
