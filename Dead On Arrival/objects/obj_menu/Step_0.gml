/// @description Insert description here
// You can write your code in this editor
var toggle = keyboard_check_pressed(vk_space)

if (toggle){
	menu_active = !menu_active	
	selected_item = noone // reset selection
	
	if (menu_active){ // deactivate all objects except the controller, the player, and the player weapon
		global.currGameState = gameState.PAUSED
		instance_deactivate_all(true)
		instance_activate_object(obj_player)
		instance_activate_object(obj_player_weapon)
		instance_activate_object(obj_game_controller)
	}
	else{
		global.currGameState = gameState.RUNNING	
		instance_activate_all()
	}
	

	
}


// check if the player clicked on an item
if (mouse_check_button_pressed(mb_left)){
	if (hovering != -1){
		
		selected_item = hovering	
	}
}

if (keyboard_check(vk_up))  op_border_height ++	
if (keyboard_check(vk_down)) op_border_height --
if (keyboard_check(vk_right)) op_border_width ++	
if (keyboard_check(vk_left))op_border_width --



