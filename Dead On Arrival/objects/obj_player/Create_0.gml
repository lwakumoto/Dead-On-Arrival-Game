/// @description Insert description here
// You can write your code in this editor

player_weapon = instance_create_layer(x,y,"Instances",obj_player_weapon)
player_weapon.owner = id
weapon_inventory = [0,1,2,3,4,5,6]
current_weapon = 0

spd = 10