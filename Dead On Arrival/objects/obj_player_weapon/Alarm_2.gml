/// @description Control reloading for guns where rounds are reloaded once at a time
if (reloading){
	
	var bullets_to_add = min(1,ammunition[weapon_id][1])

	ammunition[weapon_id][1] -= bullets_to_add
	ammunition[weapon_id][0] += bullets_to_add


	if (ammunition[weapon_id][0] < magazine_capacity ){
		alarm[2] = reload_time * room_speed
		scr_create_reload_wheel()
	}
	else{
		reloading = false	
	}

}
