/// @description Insert description here
// You can write your code in this editor

if (keyboard_check_pressed(ord("K"))){
	gpu_set_tex_filter(true)
}

if (keyboard_check_pressed(ord("L"))){
	gpu_set_tex_filter(false)
}

var pause_key = keyboard_check_pressed(vk_escape)

if (instance_number(obj_enemy_parent) == 0){
	alarm[0] = wave_delay = 10 * room_speed
	curr_wave ++
}


if (pause_key){
		instance_create_layer(0,0,"Game_Objects",obj_pause)	
}

if (global.playerIsDead){
	display_dead_text = true	
	#region //death texts
	if (death_text == ""){
		death_texts = [
		"You Died",
		"You Died Messily",
		"You were slain...",
		"Oof, that's gotta hurt",
		"Snake? Snake? Snaaaaake!",
		"Rip in Piece",
		"F",
		"Well, this was expected",
		"At least you took " + string(global.totalKills) + " \nto hell with you",
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
		"If at first you don't succeed, \ndie and die again.",
		"Wasted",
		"Zombies: 1, You: " + string(global.totalKills),
		"Cowabummer"]
		death_text = death_texts[irandom_range(0,array_length(death_texts) - 1)]	
	}
	#endregion
}

if (keyboard_check_pressed(ord("R")) && global.playerIsDead){
	scr_restart()
}

if (!window_has_focus()){
	instance_create_layer(0,0,"Game_Objects",obj_pause)	
}

/*
if (mouse_check_button_pressed(mb_left)){
		scr_create_explosion(mouse_x,mouse_y,200,100,.009)
}
