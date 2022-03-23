/// @description Destroy bullet if they reach their maximum range

// destroy bullet if it exceeds max range
if (distance_to_point(xstart,ystart) > range){
	instance_destroy(id)	
}