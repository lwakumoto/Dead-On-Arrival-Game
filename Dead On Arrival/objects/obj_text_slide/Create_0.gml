draw_set_font(fnt_game_over)
text_value = "This is a testing value, you shouldn't actually see this"
text_width = string_width(text_value)

curve_enter = animcurve_get(cv_ease_in)
_channel_enter = curve_enter.channels[0];

curve_exit = animcurve_get(cv_ease_out)
_channel_exit = curve_exit.channels[0];
 

percent = 0;

text_anim_delay = 1;

reached_destination = false;
start_exit = false;

start_x = -(string_width(text_value))
x = start_x;
y = global.camera_height/2;