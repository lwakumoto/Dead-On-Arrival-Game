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
death_texts = [
"You Died",
"You Died Messily", 
"Oof, that's gotta hurt",
"Snake? Snake? Snaaaaake!",
"Rip in Piece",
"F",
"Well, this was expected",
"At least you took " + string(global.totalKills) + " to hell with you",
string(global.totalKills) + " zombies down, about a billion more to go",
"Jeez, you made quite a mess",
"Do you want a band-aid?",
"We call this a difficulty tweak!",
"F$%@!!!!!",
"Survivor Points Lost: 2,500",
"Anyone can live. Have the courage to die!",
"You died, AGAIN?",
"Pro Tip: Try not to die",
"Bummer, right?",
"That looks like it hurt",
"Damn, not here!",
"You really kind of suck at this game, \ndon't you?",
"If at first you don't succeed, \ndie and die again."]
death_text = death_texts[irandom_range(0,array_length(death_texts) - 1)]
#endregion

money_increment = 10






curr_wave = 0
wave_delay = 10 * room_speed






// Create 
