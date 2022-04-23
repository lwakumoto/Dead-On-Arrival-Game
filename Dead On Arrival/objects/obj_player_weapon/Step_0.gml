/// @description Allow the player to fire and reload their weapons

// correctly position the firearm
if (global.currGameState != gameState.PAUSED){
if (owner != noone){
	if (right_side){
		var offset = 15
	}
	else{
		var offset = -15	
	}
	
	
	x = owner.x + lengthdir_x(offset,owner.direction - 90) + lengthdir_x(weapon_offset,owner.direction)
	y = owner.y + lengthdir_y(offset,owner.direction - 90) + lengthdir_y(weapon_offset,owner.direction)
	direction = owner.direction
	image_angle = direction



}


// allow the player to fire if they click and they have ammunition
#region // firing
if (fire_type == fireType.FULLAUTO){
	var fire = mouse_check_button(mb_left)
}
else{
	var fire = mouse_check_button_pressed(mb_left)	
}

// if the barrel is sticking into the wall, the player cannot fire

if (collision_line(x + lengthdir_x(sprite_width,direction)/2,y + lengthdir_y(sprite_width,direction)/2,
		x + lengthdir_x(sprite_width,direction),
		y + lengthdir_y(sprite_width,direction),obj_obstacle,false,true)){
		gun_obstructed = true
}
else{
	gun_obstructed = false	
}
		
if (fire && canShoot) { // make it impossible to fire while already bursting
	if (fire_type == fireType.BURST){
	if (bursting == false){
		bursting = true
		curr_burst = 3
	}
	else{
		fire = false	
	}
}
}

if (((fire && ammunition[weapon_id][0] > 0 && canShoot)
	|| (canShoot && bursting && curr_burst > 0 && ammunition[weapon_id][0] > 0))
	&& !gun_obstructed){
	image_speed = 1
	sprite_set_speed(sprite_index, (sprite_get_number(sprite_index))/fire_delay, spritespeed_framespersecond);
	if (reloading){
		reloading = false // firing cancels the reload
		image_index = 0
		image_speed = 0
	} else{
		if (bursting){ 
			curr_burst --	
		} 
		canShoot = false
		if (bursting && curr_burst > 0){ // if burst fire, the delay will be shorter between shots
			alarm[0] = 0.1 * room_speed
		}
		else{
			alarm[0] = fire_delay * room_speed
		}
		audio_play_sound(weapon_sound,1,false)

		scr_fire_weapon(x, y,direction)	
		alarm[3] =  1
		
		//scr_fire_weapon(x,y,direction)
		ammunition[weapon_id][0] -- // remove ammo from magazine
		
		// shake the camera a bit
		global.camera_shake = 2.5
	}
	
	
}

if (curr_burst <= 0 || ammunition[weapon_id][0] <= 0){
	bursting = false	
}


#endregion




// allow the player to reload
#region // reloading
var reload = keyboard_check_pressed(ord("R"))
if (fire && (ammunition[weapon_id][0] == 0)){
	reload = true	
}
if (reload && !reloading && ammunition[weapon_id][0] < magazine_capacity + 1 && ammunition[weapon_id][1] > 0 && canShoot){
	reloading = true
	image_index = 0
	
	if (weapon_reload_sound != undefined){
		audio_play_sound(weapon_reload_sound,1,false)
	}
	
	//scr_create_reload_wheel(mouse_x + lengthdir_x(offset,owner.direction - 90), mouse_y + lengthdir_y(offset,owner.direction - 90))
	scr_create_reload_wheel(mouse_x,mouse_y)

	if (reload_type == 0){
		alarm[1] = reload_time * room_speed
	}
	else{
		alarm[2] = reload_time * room_speed
	}
	
}
#endregion

// allow the player to flip gun sides
var flip_gun = keyboard_check_pressed(ord("T"))
if (flip_gun){
	right_side = !right_side	
}
}


