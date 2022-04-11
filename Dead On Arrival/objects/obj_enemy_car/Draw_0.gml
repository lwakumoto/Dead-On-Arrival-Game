/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
draw_line(x,y,x + 100*cos(image_angle*pi/180), y + 100*sin(image_angle*pi/180))
draw_healthbar(x - sprite_width - 50, y + sprite_height,
				x + sprite_width + 50, y + sprite_height + 20, (hp/max_hp)*100,c_black,c_red,c_lime,0,true,true  )
