/// @description Create a camera to follow the player around


global.camera_width = view_wport[0];
global.camera_height = view_hport[0];
global.camera = camera_create();



var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
var pm = matrix_build_projection_ortho(global.camera_width,global.camera_height,1,10000)

camera_set_view_mat(global.camera,vm);
camera_set_proj_mat(global.camera,pm);

view_camera[0] = global.camera;

follow = obj_player; 
xTo = x;
yTo = y;
