/// @description Insert description here
// You can write your code in this editor

if (!reached_destination){
	percent += 1/room_speed
	position = animcurve_channel_evaluate(_channel_enter,percent)

	x = -(text_width) + ((global.camera_width/2 + (text_width)) * position);

}

if (percent >= 1 && !start_exit){
	percent = 0;
	reached_destination = true
	alarm[0] = text_anim_delay * room_speed
}

if (start_exit){
	percent += 1/room_speed
	position = animcurve_channel_evaluate(_channel_exit,percent)
	
	x = (global.camera_width/2) + ((global.camera_width +  (text_width)) - global.camera_width/2) * position
	if (percent == 1){
		instance_destroy()	
	}
}
