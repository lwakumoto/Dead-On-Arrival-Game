// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_bullet_hit(bullet, target){
	if (bullet.penetration <= 0){
		instance_destroy(bullet)	
	}else{
		bullet.penetration --;	
		bullet.direction += irandom_range(-1,1)
		bullet.image_angle = bullet.direction
	}
	
	target.hp -= damage
}