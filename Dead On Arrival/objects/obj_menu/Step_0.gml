/// @description Insert description here
// You can write your code in this editor
var toggle = keyboard_check_pressed(vk_space)

if (toggle && !global.playerIsDead){
	menu_active = !menu_active	
	selected_item = 0 // reset selection
	
	if (menu_active){ // deactivate all objects except the controller, the player, and the player weapon
		global.currGameState = gameState.PAUSED
		instance_deactivate_all(true)
		instance_activate_object(obj_player)
		instance_activate_object(obj_player_weapon)
		instance_activate_object(obj_gui)
	}
	else{
		global.currGameState = gameState.RUNNING	
		instance_activate_all()
	}
	

	
}



if (keyboard_check_pressed(ord("E"))){
	curr_menu = (curr_menu + 1) % 3
}
if (keyboard_check_pressed(ord("Q"))){
	curr_menu = (curr_menu - 1 + 3) % 3
}

if (keyboard_check(vk_up))  op_border_height ++	
if (keyboard_check(vk_down)) op_border_height --
if (keyboard_check(vk_right)) op_border_width ++	
if (keyboard_check(vk_left))op_border_width --



