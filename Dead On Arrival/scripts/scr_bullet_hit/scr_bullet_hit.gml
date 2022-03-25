// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_bullet_hit(bullet, target){
	// create blood bellet when the target gets hit
	repeat(max(min(ceil(bullet.damage)/5,10),1)){
		var pellet = instance_create_layer(x,y,"Instances",obj_blood_pellet);
		pellet.direction = bullet.direction  - 180 + random_range(-15,15);
		pellet.image_angle = pellet.direction
	}
		
	if (bullet.penetration <= 0){
		instance_destroy(bullet)	
	}else{
		bullet.penetration --;	
		bullet.direction += irandom_range(-1,1)
		bullet.image_angle = bullet.direction
		// create blood bellet when the target gets hit
		repeat(max(min(ceil(bullet.damage)/5,10),1)){
			var pellet = instance_create_layer(x,y,"Instances",obj_blood_pellet);
			pellet.direction = bullet.direction + random_range(-15,15);
			pellet.image_angle = pellet.direction
		}

	}
	
	target.hp -= damage
}