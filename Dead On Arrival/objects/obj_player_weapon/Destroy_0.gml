/// @description Destroy the lists to avoid memory leaks

var num_weapons = 8;
var num_calibers = 7; 

for (var i = 0; i < num_weapons; i ++){
	ds_list_destroy(weapons[i])
}

for (var i = 0; i < num_calibers; i ++){
	ds_list_destroy(calibers[i])
}