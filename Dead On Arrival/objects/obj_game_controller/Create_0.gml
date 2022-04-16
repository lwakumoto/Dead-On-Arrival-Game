/// @description Create important objects
gpu_set_tex_filter(true)

enum gameState {
	PAUSED,
	RUNNING,
	CALM
}

global.currGameState = gameState.RUNNING
global.playerMoney = 0
global.displayed_money = 0
global.playerIsDead = false
money_increment = 10






curr_wave = 1
wave_delay = 10 * room_speed






// Create 
