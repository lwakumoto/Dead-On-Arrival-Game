/// @description Insert description here
// You can write your code in this editor

player_weapon = instance_create_layer(x,y,"Instances",obj_player_weapon)
player_weapon.owner = id
weapon_inventory = [0,1,2,3,4,5,6,7]
current_weapon = 0

max_hp = 1000
curr_hp = max_hp

spd = 10