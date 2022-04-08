/// @description Insert description here
// You can write your code in this editor
var toggle = keyboard_check_pressed(vk_space)

if (toggle){
	menu_active = !menu_active	
	selected_item = noone // reset selection
}


// check if the player clicked on an item
if (mouse_check_button_pressed(mb_left)){
	if (hovering != -1){
		selected_item = hovering	
		scr_buy_weapon(selected_item)
	}
}

if (keyboard_check(vk_up))  op_border_height ++	
if (keyboard_check(vk_down)) op_border_height --
if (keyboard_check(vk_right)) op_border_width ++	
if (keyboard_check(vk_left))op_border_width --



