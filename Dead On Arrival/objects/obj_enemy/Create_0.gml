/// @description Insert description here
// You can write your code in this editor
event_inherited()

max_hp = 25
hp = max_hp

corpse_sprite = spr_enemy_regular_corpse

alert_dist = 1000
attack_dis = 10
attack_delay = 0.25
idle_sprite = spr_enemy_regular
attack_animation = spr_enemy_regular_attack
attack_func = scr_enemy_attack()
damage = irandom_range(1,3)
move_spd = random_range(3.2,3.8)
value = 100
