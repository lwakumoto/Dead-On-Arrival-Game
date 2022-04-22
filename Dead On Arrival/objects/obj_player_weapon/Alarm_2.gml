/// @description Control reloading for guns where rounds are reloaded once at a time
if (reloading){
	
	var bullets_to_add = min(1,ammunition[weapon_id][1])

	ammunition[weapon_id][1] -= bullets_to_add
	ammunition[weapon_id][0] += bullets_to_add


	
	if (ammunition[weapon_id][0] < magazine_capacity  && ammunition[weapon_id][1] > 0){
		
		if (weapon_reload_sound != undefined){
			audio_play_sound(weapon_reload_sound,1,false)
		}
		
		alarm[2] = reload_time * room_speed
		scr_create_reload_wheel(mouse_x,mouse_y)
	}
	else{
		reloading = false	
		image_speed = 0
	}

}
