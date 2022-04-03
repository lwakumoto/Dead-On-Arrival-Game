/// @description Insert description here
// You can write your code in this editor
// draw the weapon icon
var text_height = string_height("sample")

var max_height = 150
var max_width = 300
var rect_height = 175
var rect_width = max_width + 50

draw_set_alpha(0.5)
draw_rectangle_color(x,y,x + rect_width, y + rect_height,c_grey,c_grey,c_grey,c_grey,false)
draw_set_alpha(1)

if (weapon_to_display != noone){
	with(weapon_to_display){
		// draw the weapon icon

		var scale = min(max_height/sprite_get_height(weapon_icon), max_width/sprite_get_width(weapon_icon))
		var y_offset = 90


		draw_sprite_ext(weapon_icon, 0,other.x + rect_width/2,other.y + y_offset, scale, scale, 0, c_white, 1)





		// Draw the ammo text
		
		if (weapon_type = weaponType.FIREARM){
			var ammo_text = string(ammunition[weapon_id][0]) + "\\" + string(ammunition[weapon_id][1])
		}else{
			var ammo_text = ""	
		}

		var weapon_name_text = weapon_name
		draw_set_font(fnt_weapon)
		draw_text(0,other.y + rect_height - text_height*1, ammo_text)
		draw_text(string_width(ammo_text) + 15,other.y + rect_height - text_height, weapon_name)
		draw_text(string_width(ammo_text) + string_width(weapon_name_text) + 30,other.y + rect_height - text_height, caliber_name)
	}
}
else{
	draw_text(0,other.y + rect_height - text_height*1, "Empty")	
}
