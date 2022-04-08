/// @description Insert description here
// You can write your code in this editor

menu_active = true



menu_width = global.camera_width;
menu_height = global.camera_height;

op_y_offset = 50;
op_border_width = 100; // width of the clickable box
op_border_height = 8; // height of the clickable box
op_space = 32; // space between each text

menu_item = array_create(global.num_weapons, "")
/*
menu_item[0] = "first"
menu_item[1] = "second"
menu_item[2] = "third"
menu_item[3] = "fourth"
menu_item[4] = "fith"
menu_item[5] = "sixth"
menu_item[6] = "seventh"
menu_item[7] = "eighth"
*/

for (var i = 0; i < array_length(menu_item); i ++){
	menu_item[i] = scr_get_weapon_from_id(i)
}

selected_item = noone
hovering = -1
