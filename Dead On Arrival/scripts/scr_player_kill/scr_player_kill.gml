// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_kill(){

	instance_deactivate_object(obj_player)
	instance_deactivate_object(obj_player_weapon)
	global.playerIsDead = true

}