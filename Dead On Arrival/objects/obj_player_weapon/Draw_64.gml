/// @description Draw Weapon icon, ammo display, etc.

// draw the weapon icon
scr_draw_weapon_icon(0,global.camera_height - 175,175)

/*
var scale_factor = 0.25
var icon_biggest_width = sprite_get_width(spr_weapon_sniper_intervention_silhouette)
var icon_biggest_height = sprite_get_height(spr_weapon_sniper_intervention_silhouette)

draw_sprite_ext(weapon_icon,0,0 + icon_biggest_width/8,room_height - icon_biggest_height/8,0.25,0.25,0, c_white,1)
*/
/*
// draw the weapon icon
var max_height = 150
var max_width = 300
var scale = min(max_height/sprite_get_height(weapon_icon), max_width/sprite_get_width(weapon_icon))
//var scale = max_width/sprite_get_width(weapon_icon)
var y_offset = 90
//var yScale = sprite_get_height(weapon_icon)*scale/2
var rect_height = 175
var rec_width = max_width + 50

draw_set_alpha(0.5)
draw_rectangle_color(0,room_height - rect_height,rec_width,room_height,c_grey,c_grey,c_grey,c_grey,false)
draw_set_alpha(1)


draw_sprite_ext(weapon_icon, 0,rec_width/2, room_height - y_offset, scale, scale, 0, c_white, 1)





// Draw the ammo text
var text_height = string_height("sample")
if (weapon_type = weaponType.FIREARM){
	var ammo_text = string(ammunition[weapon_id][0]) + "\\" + string(ammunition[weapon_id][1])
}else{
	var ammo_text = ""	
}

var weapon_name_text = weapon_name

draw_text(0,room_height - text_height, ammo_text)
draw_text(string_width(ammo_text) + 15,room_height - text_height, weapon_name)
draw_text(string_width(ammo_text) + string_width(weapon_name_text) + 30,room_height - text_height, caliber_name)