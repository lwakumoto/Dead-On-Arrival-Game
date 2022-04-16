/// @description Insert description here
// You can write your code in this editor

// Player Movement (to be worked on)

if (global.currGameState == gameState.RUNNING){

#region // movement
var right_pressed = keyboard_check(ord("D"));
var left_pressed = keyboard_check(ord("A"));
var up_pressed = keyboard_check(ord("W"));
var down_pressed = keyboard_check(ord("S"));



var horiz_vel = (right_pressed - left_pressed)*player_spd
var vertic_vel = (down_pressed - up_pressed)*player_spd
if (position_meeting(x,y+vertic_vel,obj_obstacle)){
	vertic_vel = 0;	
}
if (position_meeting(x + horiz_vel,y,obj_obstacle)){
	horiz_vel = 0;	
}

var speed_modifier = player_weapon.weapon_weight


if (place_meeting(x,y,obj_enemy_parent)){
	speed_modifier *= 0.5
}


x += horiz_vel * speed_modifier;
y += vertic_vel * speed_modifier;



direction = point_direction(x,y, mouse_x, mouse_y) // make the player face the mouse
image_angle = direction

#endregion

// Handle weapon changing
#region // changing weapons
var change_weapon_forward = keyboard_check_pressed(ord("E"))
var change_weapon_backward = keyboard_check_pressed(ord("Q"))

if ((change_weapon_forward || change_weapon_backward) && player_weapon.canShoot){
	if (change_weapon_forward) current_weapon = (current_weapon + 1) % ds_list_size(weapon_inventory)
	else if (change_weapon_backward) current_weapon = (current_weapon - 1 + ds_list_size(weapon_inventory)) % ds_list_size(weapon_inventory)
	
	player_weapon.image_index = 0
	player_weapon.image_speed = 0
	with (obj_player_weapon){
		if (!bursting){
			scr_change_weapon(other.weapon_inventory[| other.current_weapon])
			reloading = false;
		}
		
	}
}
#endregion

// regenerating health
if (curr_hp < max_hp){ 
	curr_hp += regen_health_rate / room_speed
	curr_hp = min(curr_hp,max_hp)
}


}


if (curr_hp <= 0){ // kill the player if they get to a low enough health
	scr_player_kill()
}



