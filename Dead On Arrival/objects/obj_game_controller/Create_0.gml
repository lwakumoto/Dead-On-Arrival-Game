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

wave_list = ds_list_create()



#region // create waves

//wave1 = new wave_struct(15,[new enemy_distribution(obj_enemy,0.5)],30)

#endregion






// Create 
