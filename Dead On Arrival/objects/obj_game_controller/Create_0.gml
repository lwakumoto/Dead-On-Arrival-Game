/// @description Create important objects
gpu_set_tex_filter(true)
randomize()
enum gameState {
	PAUSED,
	RUNNING,
	CALM
}

global.currGameState = gameState.RUNNING
global.playerMoney = 0
global.displayed_money = 0
global.playerIsDead = false
global.totalKills = 0

#region // deathText
display_dead_text = false // wether to display the death message or not
dead_text_size = 10
death_text = ""
#endregion

money_increment = 10






curr_wave = 0
wave_delay = 10 * room_speed






// Create 
