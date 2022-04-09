/// @description Create important objects
gpu_set_tex_filter(true)

enum gameState {
	PAUSED,
	RUNNING
}

global.currGameState = gameState.RUNNING
