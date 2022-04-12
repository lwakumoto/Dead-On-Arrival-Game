// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_money(){
	draw_set_color(c_white)
	draw_set_font(fnt_health)

	draw_text(10,10,"Funds: " + scr_money_format(global.displayed_money ))



	// create effect that makes the money counter "go up" or "go down" incrementally
	money_increment = ceil( abs(global.displayed_money  - global.playerMoney)/25)
	if (abs(global.displayed_money - global.playerMoney) <= money_increment){
		global.displayed_money = global.playerMoney	
	}
	else if(global.displayed_money  < global.playerMoney){
		global.displayed_money += money_increment	
	
	}
	else if(global.displayed_money > global.playerMoney){
		global.displayed_money -= money_increment	
	}
}