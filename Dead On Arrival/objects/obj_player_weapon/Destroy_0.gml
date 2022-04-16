/// @description Insert description here
// You can write your code in this editor
var num_weapons = 8;
var num_calibers = 7; 

for (var i = 0; i < num_weapons; i ++){
	ds_list_destroy(weapons[i])
}

for (var i = 0; i < num_calibers; i ++){
	ds_list_destroy(calibers[i])
}
