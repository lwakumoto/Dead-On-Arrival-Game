/// @description Allow the player to fire and reload their weapons

// correctly position the firearm
if (owner != noone){
	var offset = 15
	
	x = owner.x + lengthdir_x(offset,owner.direction - 90) + lengthdir_x(weapon_offset,owner.direction)
	y = owner.y + lengthdir_y(offset,owner.direction - 90) + lengthdir_y(weapon_offset,owner.direction)
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

if ((fire && ammunition[weapon_id][0] > 0 && canShoot) || (canShoot && bursting && curr_burst > 0 && ammunition[weapon_id][0] > 0)){
	image_speed = 1
	if (reloading){
		reloading = false // firing cancels the reload
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
		
		//scr_fire_weapon(x,y,direction)
		ammunition[weapon_id][0] -- 
	}
	
	
}

if (curr_burst <= 0 || ammunition[weapon_id][0] <= 0){
	bursting = false	
}





// allow the player to reload
var reload = keyboard_check_pressed(ord("R"))
if (reload && !reloading && ammunition[weapon_id][0] < magazine_capacity + 1 && ammunition[weapon_id][1] > 0){
	reloading = true
	
	
	//scr_create_reload_wheel(mouse_x + lengthdir_x(offset,owner.direction - 90), mouse_y + lengthdir_y(offset,owner.direction - 90))
	scr_create_reload_wheel(mouse_x,mouse_y)

	if (reload_type == 0){
		alarm[1] = reload_time * room_speed
	}
	else{
		alarm[2] = reload_time * room_speed
	}
	
}


