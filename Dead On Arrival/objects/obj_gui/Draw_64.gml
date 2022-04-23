/// @description Insert description here
// You can write your code in this editor
scr_draw_money()

if (global.moneyToAdd > 0){
	global.moneyToAddTimer ++;
} else{
	global.moneyToAddTimer = 0	
}


if (global.moneyToAddTimer >= addmoneyDelay){
	global.playerMoney += global.moneyToAdd
	global.moneyToAdd = 0
}
