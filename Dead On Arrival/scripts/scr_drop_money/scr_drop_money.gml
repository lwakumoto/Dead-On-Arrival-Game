// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_drop_money(xx,yy,amount){
	repeat(amount div 5){
		var rand_x = xx + random_range(-16,16)
		var rand_y = yy + random_range(-16,16)
		with(instance_create_layer(rand_x, rand_y, "Floor", obj_money)){
			speed = 4
			friction = .2
			direction = point_direction(rand_x, rand_y, xx, yy)
			image_xscale = .25
			image_yscale = image_xscale
			value = 5
		}
	}
}