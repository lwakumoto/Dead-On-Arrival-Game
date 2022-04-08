/// @description Insert description here
// You can write your code in this editor
x += (xTo - x)/25;
y += (yTo - y)/25;

var cam_w = camera_get_view_width(id)
var cam_ww = cam_w*.5;

var cam_h = camera_get_view_height(id)
var cam_hh = cam_h*.5;
	//var _x = clamp(obj_player.x-view_width/2,0,room_width - view_width);
	//var _y = clamp(obj_player.y-view_height/2,0,room_width - view_height);
//	camera_set_view_pos(view,_x,_y);

if (follow != noone){
	//xTo = follow.x;
	//yTo = follow.y;
	xTo = clamp(follow.x - cam_w/2, 0,room_width - cam_ww);
	yTo = clamp(follow.y - cam_h/2, 0,room_height - cam_hh);
}




x = clamp(x, global.camera_width/2, room_width-(global.camera_width/2));
y = clamp(y, global.camera_height/2, room_height-(global.camera_height/2));

var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
camera_set_view_mat(global.camera,vm);

