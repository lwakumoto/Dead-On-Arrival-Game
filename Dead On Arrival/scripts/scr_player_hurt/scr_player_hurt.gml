// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_hurt(player_id, damage){
	if (instance_exists(player_id)){
		player_id.curr_hp -= ceil(damage)	
		audio_play_sound(so_player_hit, 1, false);
	}
	
	// spawn blood
	repeat(max(min(ceil(damage)/5,10),1)){
		var pellet = instance_create_layer(x,y,"Instances",obj_blood_pellet);
		pellet.direction = random_range(0,359)
		pellet.image_angle = pellet.direction
	}
}