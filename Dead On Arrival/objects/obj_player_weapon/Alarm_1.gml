/// @description Control reloading

if (reloading){
	
	if (ammunition[weapon_id][0] == 0){
		var bullets_to_add = min(max(magazine_capacity - ammunition[weapon_id][0],0),ammunition[weapon_id][1])
	}
	else{
		var bullets_to_add = min(max(magazine_capacity + 1 - ammunition[weapon_id][0],0),ammunition[weapon_id][1])
	}
	ammunition[weapon_id][1] -= bullets_to_add
	ammunition[weapon_id][0] += bullets_to_add

	reloading = false
	
	image_speed = 0 // make sure the weapon doesn't animate at the end of reloading
	image_index = 0
	
}


