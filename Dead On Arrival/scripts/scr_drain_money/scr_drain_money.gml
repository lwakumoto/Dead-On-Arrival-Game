// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_drain_money(amount){
	if (amount <= global.playerMoney){
		audio_play_sound(so_purchase_complete,1,0)
		global.playerMoney-= amount
		return true
	} else{
		
		audio_play_sound(so_purchase_rejected,1,0)
		return false
	}

}