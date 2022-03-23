// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_fire_weapon(x,y, dir){
	
	//spawn bullet(s)
	repeat(caliber_num_shot){
		
		var new_bullet = instance_create_layer(x,y,"Bullets",obj_player_bullet);

		new_bullet.speed = caliber_speed
		new_bullet.direction = dir + irandom_range(-weapon_spread, weapon_spread) // add random spread to the weapon
		new_bullet.image_angle = dir
		new_bullet.sprite_index = caliber_sprite
		new_bullet.range = weapon_range
		new_bullet.penetration = caliber_penetration
		new_bullet.damage = caliber_damage
		
	}
	
	// create muzzle flash if it's a firearm
	if (weapon_type != weaponType.MELEE){
		scr_create_muzzle_flash(x,y,dir)	
	}

	
	// create shell casing
	if (casing_sprite != 0){
		
	
		var new_casing = instance_create_layer(x - lengthdir_x(sprite_get_width(weapon_sprite)/2,dir),y - lengthdir_y(sprite_get_width(weapon_sprite)/2,dir),"Instances", obj_casing)
		new_casing.sprite_index = casing_sprite
		new_casing.image_angle = dir
		new_casing.max_height = 100 + irandom_range(-25,25)
		new_casing.height = new_casing.max_height
		new_casing.rotational_velocity = irandom_range(-17,17)
		new_casing.casing_vel = [cos((dir - 90  + irandom_range(-15,15)) * pi/180), sin((dir - 90 + irandom_range(-15,15)) * pi/180)]
		new_casing.part_effect = casings_particles[caliber_index]
		
	
	}
	
	
	

	

}