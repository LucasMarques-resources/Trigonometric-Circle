/// @description Insert description here
// You can write your code in this editor

global.view_width = 320 * 2;
global.view_height = 180 * 2;

window_scale = 2;

global.cam_x = 0;
global.cam_y = 0;

window_set_size(global.view_width * window_scale, global.view_height * window_scale);

surface_resize(application_surface, global.view_width, global.view_height);

display_set_gui_size(global.view_width, global.view_height);