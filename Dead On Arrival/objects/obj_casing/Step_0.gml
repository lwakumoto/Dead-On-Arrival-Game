/// @description Insert description here
// You can write your code in this editor
image_angle += rotational_velocity

if (height <= 0){
	speed = 0	
	rotational_velocity = 0
	
	
}
else{
	height -= 10
	height = max(height,0)
}

image_xscale = lerp(0.9,1,height/max_height)
image_yscale = image_xscale