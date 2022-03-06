/// @description Insert description here
// You can write your code in this editor

// Player Movement (to be worked on)
var move_up = keyboard_check(ord("W"))
var move_down = keyboard_check(ord("S"))
var move_left = keyboard_check(ord("A"))
var move_right = keyboard_check(ord("D"))

var vert_move = move_down - move_up
var horiz_move = move_right - move_left

y += vert_move * spd
x += horiz_move * spd

direction = point_direction(x,y, mouse_x, mouse_y) // make the player face the mouse
image_angle = direction



// Handle weapon changing
var change_weapon_forward = keyboard_check_pressed(ord("E"))
var change_weapon_backward = keyboard_check_pressed(ord("Q"))

if (change_weapon_forward || change_weapon_backward){
	if (change_weapon_forward) current_weapon = (current_weapon + 1) % array_length(weapon_inventory)
	else if (change_weapon_backward) current_weapon = (current_weapon - 1 + array_length(weapon_inventory)) % array_length(weapon_inventory)
	
	with (obj_player_weapon){
		if (!bursting){
			scr_change_weapon(other.weapon_inventory[other.current_weapon])
			reloading = false;
		}
		
	}
}