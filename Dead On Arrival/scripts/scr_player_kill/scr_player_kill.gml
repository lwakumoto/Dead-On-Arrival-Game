// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_kill(){
	with (instance_create_layer(x,y,"Corpses",obj_corpse)){
		sprite_index = spr_player_corpse
		image_angle = random(360)
		image_xscale = 1.5
		image_yscale = image_xscale
	}
	// spawn blood
	repeat(25){
		var pellet = instance_create_layer(x,y,"Instances",obj_blood_pellet);
		var rand_dir = random(360)
		pellet.direction = rand_dir;
		pellet.image_angle = rand_dir;
	}
	instance_deactivate_object(obj_player)
	instance_deactivate_object(obj_player_weapon)
	global.playerIsDead = true

}