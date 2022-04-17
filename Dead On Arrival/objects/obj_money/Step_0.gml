/// @description Insert description here
// You can write your code in this editor

if (instance_exists(obj_player)){
	if (point_distance(x,y,obj_player.x,obj_player.y) <= collect_radius){
		move_towards_point(obj_player.x,obj_player.y,coin_spd)
	} 
	
	var player_id = instance_place(x,y,obj_player)
	
	if (player_id != noone){
		audio_play_sound(coin_collect,1,false)
		global.playerMoney += value;
		instance_destroy(id)	
	}
}
