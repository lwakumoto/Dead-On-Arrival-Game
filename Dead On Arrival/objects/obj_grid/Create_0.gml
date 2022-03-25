/// @description Insert description here
// You can write your code in this editor
#macro TileSize 16

var width = ceil(room_width / TileSize)
var height = ceil(room_height / TileSize)

global.mp_grid = mp_grid_create(0,0,width,height,TileSize,TileSize)
mp_grid_add_instances(global.mp_grid,obj_obstacle, false)
/*
global.cell_width = room_width/40
global.cell_height = room_height / 40
global.grid = mp_grid_create(0,0,room_width,room_height,global.cell_width,global.cell_height);
mp_grid_add_instances(global.grid,obj_obstacle,false);
