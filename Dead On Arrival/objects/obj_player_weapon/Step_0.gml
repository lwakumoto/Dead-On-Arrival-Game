/// @description Allow the player to fire and reload their weapons

// correctly position the firearm
if (owner != noone){
	x = owner.x + lengthdir_x(50,owner.direction)
	y = owner.y + lengthdir_y(50, owner.direction)
	direction = owner.direction
	image_angle = direction
}

// allow the player to fire if they click and they have ammunition

if (fire_type == fireType.FULLAUTO){
	var fire = mouse_check_button(mb_left)
}
else{
	var fire = mouse_check_button_pressed(mb_left)	
}



if (fire && ammunition[weapon_id][0] > 0 && canShoot){
	if (reloading){
		reloading = false // firing cancels the reload
	} else{
		canShoot = false
		alarm[0] = fire_delay * room_speed
		scr_fire_weapon(x + lengthdir_x(sprite_width/2,direction), y + lengthdir_y(sprite_width/2,direction),direction)	
		ammunition[weapon_id][0] -- 
	}
}





// allow the player to reload
var reload = keyboard_check_pressed(ord("R"))
if (reload && !reloading && ammunition[weapon_id][0] < magazine_capacity + 1){
	reloading = true
	
	scr_create_reload_wheel()
	
	
	if (reload_type == 0){
		alarm[1] = reload_time * room_speed
	}
	else{
		alarm[2] = reload_time * room_speed
	}
	
}


// if we're reloading we want to replace the sprite with a reload wheel, otherwise, use the crosshair
if (reloading){
	cursor_sprite = noone	
}
else{
	cursor_sprite = curr_crosshair	
	if (instance_exists(obj_reload_wheel)){
		instance_destroy(obj_reload_wheel)	
	}
}