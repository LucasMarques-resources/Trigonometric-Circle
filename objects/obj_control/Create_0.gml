/// @description Insert description here
// You can write your code in this editor


xx = room_width / 2;
yy = room_height / 2;
raio = 80;
dir = 0;

mouse_xx = mouse_x;
mouse_yy = mouse_y;
mouse_locked = false;
mouse_direction = true;

draw_sin_wave = false;
draw_cos_wave = false;
draw_tan_wave = false;

graus = 0;
rads = 0;

sin_points = ds_list_create();

cos_points = ds_list_create();

tan_points = ds_list_create();

draw_set_font(fnt_text);

// Waves
sin_wave_timer = 0;
cos_wave_timer = 0;
tan_wave_timer = 0;