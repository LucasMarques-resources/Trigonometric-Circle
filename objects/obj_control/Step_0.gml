/// @description Insert description here
// You can write your code in this editor

if (!mouse_locked)
{
	mouse_xx = mouse_x;
	mouse_yy = mouse_y;
}

if (mouse_direction)
{
	draw_sin_wave = false;
	draw_cos_wave = false;
	draw_tan_wave = false;
	dir = point_direction(xx, yy, mouse_xx, mouse_yy);
}

graus = floor(dir);
rads = degtorad(dir);