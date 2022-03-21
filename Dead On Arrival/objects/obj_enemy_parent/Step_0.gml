/// @description Insert description here
// You can write your code in this editor
scr_check_for_player();


var _diff = angle_difference(direction, image_angle);
image_angle += _diff * 0.1;

if (hp <= 0){
	scr_enemy_die()	
}