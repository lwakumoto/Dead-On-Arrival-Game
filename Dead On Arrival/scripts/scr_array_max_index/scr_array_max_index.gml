// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

///@description find the index that has the highest element in the array
function scr_array_max_index(arr){
	var highest_index = 0;
	
	for (var i = 0; i < array_length(arr); i ++){
		if (arr[i] > arr[highest_index]){
			highest_index = i;	
		}
	}
	
	return highest_index

}