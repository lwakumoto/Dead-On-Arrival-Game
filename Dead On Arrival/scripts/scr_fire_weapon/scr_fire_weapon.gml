// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_fire_weapon(x,y, dir){
	
	//spawn bullet(s)
	repeat(caliber_num_shot){
		
		if (caliber_num_shot > 1){ // add variance to scattershot weapons to make it appear more natural
			var positional_variance = irandom_range(-20.5,20.5)
			var new_bullet = instance_create_layer(x + cos(image_angle*pi/180.0) * positional_variance,
							y + sin(image_angle*pi/180.0) * positional_variance ,"Instances",obj_player_bullet)
		}
		else{
			var new_bullet = instance_create_layer(x,y,"Instances",obj_player_bullet)
		}

		new_bullet.speed = caliber_speed
		new_bullet.direction = dir + irandom_range(-weapon_spread, weapon_spread) // add random spread to the weapon
		new_bullet.image_angle = dir
		new_bullet.sprite_index = caliber_sprite
		
	}
	
	// create shell casing
	var new_casing = instance_create_layer(x - lengthdir_x(sprite_get_width(weapon_sprite)/2,dir),y - lengthdir_y(sprite_get_width(weapon_sprite)/2,dir),"Instances", obj_casing)
	new_casing.sprite_index = casing_sprite
	new_casing.direction = dir - 90 + random_range(-15,15)
	new_casing.image_angle = irandom_range(0,360)
	new_casing.max_height = 100 + irandom_range(-25,25)
	new_casing.height = new_casing.max_height
	new_casing.rotational_velocity = irandom_range(-7,7)
	
	if (weapon_id == 2){
		var new_casing = instance_create_layer(x - lengthdir_x(sprite_get_width(weapon_sprite)/2,dir),y - lengthdir_y(sprite_get_width(weapon_sprite)/2,dir),"Instances", obj_casing)
		new_casing.sprite_index = spr_player_casing_steel_link
		new_casing.direction = dir - 90 + random_range(-15,15)
		new_casing.image_angle = irandom_range(0,360)
		new_casing.max_height = 100 + irandom_range(-25,25)
		new_casing.height = new_casing.max_height
		new_casing.rotational_velocity = irandom_range(-7,7)
	}
	
	
	

	

}