/// @description Insert description here
// You can write your code in this editor

// when the enemy chases the player
alert = false; 

// how close the player needs to be before the enemy becomes alert
alert_dist = 250; 

// distance to stop from the player
attack_dis = 1;

path = path_add();

// speed to move
move_spd = 5;

// SET DELAY FOR CALCULATING path
calc_path_delay = 30;
// set a time for when to calculate the path
calc_path_timer = irandom(60)

hp = 100

