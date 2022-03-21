/// @description Destroy bullet if they reach their maximum range

if (distance_to_point(xstart,ystart) > range){
	instance_destroy(id)	
}