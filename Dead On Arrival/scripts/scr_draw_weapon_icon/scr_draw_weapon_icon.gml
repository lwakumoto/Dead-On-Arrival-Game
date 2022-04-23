// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_weapon_icon(xx, yy, height){
	// draw the weapon icon
	draw_set_color(c_white)
	draw_set_font(fnt_weapon)
	var text_height = string_height("sample")

	var max_height = height - 25
	var max_width = max_height * 2
	var rect_height = height 
	var rect_width = max_width + 50

	// draw transparent box
	draw_set_alpha(0.5)
	draw_rectangle_color(xx,yy,xx + rect_width, yy + rect_height,c_grey,c_grey,c_grey,c_grey,false)
	draw_set_alpha(1)



		scr_draw_icon(xx,yy,height,weapon_icon)



		// Draw the ammo text
		
		if (weapon_type = weaponType.FIREARM){
			if (ammunition[weapon_id][0] > magazine_capacity){
				var ammo_text = string(magazine_capacity) + " + " + string(ammunition[weapon_id][0] - magazine_capacity ) + "\\" + string(ammunition[weapon_id][1])
			}
			else{
				var ammo_text = string(ammunition[weapon_id][0]) + "\\" + string(ammunition[weapon_id][1])
			}
		}else{
			var ammo_text = ""	
		}

		var weapon_name_text = weapon_name
		draw_text(xx,yy + rect_height - text_height*1, ammo_text)
		draw_text(xx + string_width(ammo_text) + 15,yy + rect_height - text_height, weapon_name)
		draw_text(xx + string_width(ammo_text) + string_width(weapon_name_text) + 30,yy + rect_height - text_height, caliber_name)
}



