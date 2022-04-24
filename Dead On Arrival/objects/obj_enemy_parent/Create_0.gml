/// @description Insert description here
// You can write your code in this editor

// when the enemy chases the player
alert = false; 

// how close the player needs to be before the enemy becomes alert
alert_dist = 500; 

// distance to stop from the player
attack_dis = 2;

path = path_add();

// speed to move
move_spd = random_range(2.8,3.2);

// SET DELAY FOR CALCULATING path
calc_path_delay = 30;
// set a time for when to calculate the path
calc_path_timer = irandom(60)

// bias for pathfinding
bias = random_range(-20,20)

max_hp = 100
hp = max_hp


corpse_sprite = noone
// variables dicating how the enemy will attack
attack_delay = 1
can_attack = true
idle_sprite = noone
attack_animation = noone
attack_func = noone
damage = 0


was_spawned = false // determines if it was spawned by the car, which determines if it can drop money
coin_type = 0
value = 10 // how much money they drop when killed


hurt_sound = so_zombie_hit
death_sound = so_zombie_death



