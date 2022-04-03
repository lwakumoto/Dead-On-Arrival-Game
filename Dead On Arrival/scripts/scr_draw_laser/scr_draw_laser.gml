// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_laser(xx,yy,dir,maxRange,color){
	//draw_line(x,y,x + lengthdir_x(500,image_angle),y + lengthdir_y(500,image_angle))
	//draw_line(xx,yy,xx + lengthdir_x(500,dir),yy + lengthdir_y(500,dir))
	
	var las_x = xx + lengthdir_x(maxRange,dir)
	var las_y = yy + lengthdir_y(maxRange,dir)
	
	var target = collision_line(xx,yy,las_x,las_y,obj_hittable_parent,true,true)
	if (target == noone){
		draw_line_color(xx,yy,las_x,las_y,color,color)
	} else{ // use binary search to figure out where to draw the laser
		var contact_x = las_x
		var contact_y = las_y
		var percent_start = 0
		var percent_end = 1
		var distance_x = las_x - xx
		var distance_y = las_y - yy
		var iterations = ceil(log2(point_distance(xx,yy,las_x,las_y)))
		repeat(iterations){
			var middle_way = (percent_end - percent_start)	 * 0.5 + percent_start
			var end_x = distance_x * middle_way + xx
			var end_y = distance_y * middle_way + yy
			var start_x = distance_x * percent_start + xx
			var start_y = distance_y * percent_start + yy
			var found = collision_line(start_x,start_y,end_x,end_y,obj_hittable_parent,true,true)
			if (found == noone){
				percent_start = middle_way;

			}else{
				target = found
				contact_x = end_x
				contact_y = end_y
				percent_end = middle_way
			}
			
		}
		
		draw_circle_color(contact_x,contact_y,4,color,color,false)
		draw_line_color(xx,yy,contact_x,contact_y,color,color)
	}
	
	
}