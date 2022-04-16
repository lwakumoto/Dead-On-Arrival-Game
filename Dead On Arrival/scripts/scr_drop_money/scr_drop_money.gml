// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_drop_money(xx,yy,amount,type){
	repeat(amount){
		var rand_x = xx + random_range(-16,16)
		var rand_y = yy + random_range(-16,16)
		
		with(instance_create_layer(rand_x, rand_y, "Floor", obj_money)){
			speed = 4
			friction = .2
			direction = point_direction(rand_x, rand_y, xx, yy)
			image_xscale = .25
			image_yscale = image_xscale
			image_speed = 0
			if (type == 0){
				value = 5
				image_index = 0
			} else if (type == 1){
				value = 10
				image_index = 1
			} else{
				value = 20
				image_index = 2
			}
			
		}
	}
}