/// @description Destroy bullet if they reach their maximum range

// destroy bullet if it exceeds max range
if (distance_to_point(xstart,ystart) > range){
	instance_destroy(id)	
}
if (distance_to_point(xstart,ystart) > dist_to_visible && bullet_spread != 0){
	
	direction += bullet_spread
	image_angle = direction
	bullet_spread = 0
}