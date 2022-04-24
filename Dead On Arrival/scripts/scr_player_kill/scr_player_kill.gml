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
	
favWeaponStruct = function(favoriteName, favoriteIcon,favoriteKills) constructor
{
	name = favoriteName
	icon = favoriteIcon
	kills = favoriteKills
}

	if (instance_exists(obj_player_weapon)){
		delete global.favoriteWeapon
		global.favoriteWeapon = new favWeaponStruct(
		obj_player_weapon.weapons[scr_array_max_index(global.weapon_kills)][? "wep_name"],
		obj_player_weapon.weapons[scr_array_max_index(global.weapon_kills)][? "wep_icon"],
		global.weapon_kills[scr_array_max_index(global.weapon_kills)])	
	}
	
	instance_deactivate_object(obj_player)
	instance_deactivate_object(obj_player_weapon)
	show_debug_message(global.favoriteWeapon.name)
		show_debug_message(global.favoriteWeapon.kills)
	
	global.playerIsDead = true


}