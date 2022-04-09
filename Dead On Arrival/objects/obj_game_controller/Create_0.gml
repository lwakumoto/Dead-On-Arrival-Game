/// @description Create important objects
gpu_set_tex_filter(true)

enum gameState {
	PAUSED,
	RUNNING
}

global.currGameState = gameState.RUNNING
global.playerMoney = 0
global.displayed_money = 0
money_increment = 10
