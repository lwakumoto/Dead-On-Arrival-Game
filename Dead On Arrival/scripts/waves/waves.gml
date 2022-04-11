// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_distribution(enemy, distribution) constructor{
	enemy_type = enemy // the enemy type (i.e crawler)
	enemy_dist = distribution // the percentage of the enemy the wave should be compose of (.5 means the enemy makes up 50% of the wave)
}

function wave_struct(num_enemies,enemy_distribution_array,time_delay) constructor{
	total_enemies = num_enemies // total number of enemies in the wave
	enemy_dist_array = enemy_distribution_array // the enemy distribution
	delay = time_delay // the amount of time that should elapse before the next wave spawns
}

function wave1() constructor{
		
}
