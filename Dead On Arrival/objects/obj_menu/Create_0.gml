/// @description Insert description here
// You can write your code in this editor

menu_active = true



menu_width = global.camera_width;
menu_height = global.camera_height;

op_y_offset = 50;
op_x_offset = 0;
op_border_width = 100; // width of the clickable box
op_border_height = 8; // height of the clickable box
op_space = 32; // space between each text


menu_item = array_create(global.num_weapons, "")

menu_item[0] = weapon.DEAGLE
menu_item[1] = weapon.MP5K
menu_item[2] = weapon.SPAS
menu_item[3] = weapon.MK18
menu_item[4] = weapon.G3A1
menu_item[5] = weapon.STONER
menu_item[6] = weapon.INTERVENTION
menu_item[7] = weapon.BASTARD

/*
for (var i = 0; i < array_length(menu_item); i ++){
	menu_item[i] = scr_get_weapon_from_id(i)
}*/

selected_item = noone
hovering = -1
