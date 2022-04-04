/// @description Insert description here
// You can write your code in this editor

player_weapon = instance_create_layer(x,y,"Instances",obj_player_weapon)
player_weapon.owner = id
weapon_inventory = [weapon.DEAGLE, weapon.MK18, weapon.G3A1, weapon.SPAS, weapon.MP5K,weapon.INTERVENTION, weapon.STONER]
current_weapon = 0

with (player_weapon){
	scr_change_weapon(other.weapon_inventory[other.current_weapon])
}


max_hp = 100
curr_hp = max_hp

player_spd = 4