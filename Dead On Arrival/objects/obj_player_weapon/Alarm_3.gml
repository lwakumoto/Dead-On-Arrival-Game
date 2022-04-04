/// @description Create shell casing
// create shell casing
if (casing_sprite != 0){
		
	
	var new_casing = instance_create_layer(x + lengthdir_x(sprite_get_width(weapon_sprite)/2,direction),y + lengthdir_y(sprite_get_width(weapon_sprite)/2,direction),"Instances", obj_casing)
	new_casing.sprite_index = casing_sprite
	new_casing.image_angle = direction
	new_casing.max_height = 100 + irandom_range(-25,25)
	new_casing.height = new_casing.max_height
	new_casing.rotational_velocity = irandom_range(-17,17)
	new_casing.casing_vel = [cos((direction - 90  + irandom_range(-15,15)) * pi/180), sin((direction - 90 + irandom_range(-15,15)) * pi/180)]
	new_casing.part_effect = casings_particles[caliber_index]
		
	
}
	
