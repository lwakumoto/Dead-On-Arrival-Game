/// @description Insert description here
// You can write your code in this editor
draw_set_font(fnt_health)

draw_text(10,10,"Funds: " + scr_money_format(global.displayed_money ))



// create effect that makes the money counter "go up" or "go down" incrementally
money_increment = ceil( abs(global.displayed_money  - global.playerMoney)/10)
if (abs(global.displayed_money - global.playerMoney) <= money_increment){
	global.displayed_money = global.playerMoney	
}
else if(global.displayed_money  < global.playerMoney){
	global.displayed_money += money_increment	
	
}
else if(global.displayed_money > global.playerMoney){
	global.displayed_money -= money_increment	
}
