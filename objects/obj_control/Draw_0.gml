/// @description Insert description here
// You can write your code in this editor

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_circle(xx, yy, raio, true);

var _ball_x = xx + lengthdir_x(raio, dir);
var _ball_y = yy + lengthdir_y(raio, dir);

var _flip_y = 1;
var _flip_x = 1;
if (_ball_y > yy)
{
	//quad_3_4 = true;
	_flip_y = -1;
}
//else
//	quad_3_4 = false;
	
if (_ball_x < xx)
{
	_flip_x = -1;
}

if (!mouse_direction)
{
	dir += 2;
	
	if (draw_sin_wave)
	{
		// draw sin wave
		var _sin_wave_timer_time = 2;
		sin_wave_timer--;
		if (sin_wave_timer <= 0)
		{
			ds_list_add(sin_points, xx, _ball_y);
			if (ds_list_size(sin_points) > total_points)
			{
				ds_list_delete(sin_points, 0);
				ds_list_delete(sin_points, 1);	
			}
			sin_wave_timer = _sin_wave_timer_time;
		}
		
		for (var i = ds_list_size(sin_points) - 1; i >= 0; i-=2)
		{
			if (i >= 4)
			{
				draw_set_color(c_red);
				draw_set_alpha(0.5);
				draw_line(sin_points[| i - 3], sin_points[| i - 2], sin_points[| i - 1], sin_points[| i]);
				draw_set_color(c_white);
				draw_set_alpha(1);
			}
			sin_points[| i - 1] += 1;
		}
	}
	else
		ds_list_clear(sin_points);
	
	if (draw_cos_wave)
	{
		// draw cos wave
		var _cos_wave_timer_time = 2;
		cos_wave_timer--;
		if (cos_wave_timer <= 0)
		{
			ds_list_add(cos_points, xx, yy - point_distance(xx, yy, _ball_x, yy) * _flip_x);
			if (ds_list_size(cos_points) > total_points)
			{
				ds_list_delete(cos_points, 0);
				ds_list_delete(cos_points, 1);	
			}
			cos_wave_timer = _cos_wave_timer_time;
		}
		
		for (var i = ds_list_size(cos_points) - 1; i >= 0; i-=2)
		{
			if (i >= 4)
			{
				draw_set_color(c_blue);
				draw_set_alpha(0.5);
				draw_line(cos_points[| i - 3], cos_points[| i - 2], cos_points[| i - 1], cos_points[| i]);
				draw_set_color(c_white);
				draw_set_alpha(1);
			}
			cos_points[| i - 1] += 1;
		}
	}
	else
		ds_list_clear(cos_points);
	
	if (draw_tan_wave)
	{
		// draw tan x = 1 line
		draw_line_color(xx + raio, -10, xx + raio, room_height + 10, c_yellow, c_yellow);
	
		draw_set_color(c_yellow);
		for(var i = 0; i < 150; i++)
		{
			if (dir > 90 && dir < 270)
			{
				var _xx = xx + lengthdir_x(i * 2, dir - 180);
				var _yy = yy + lengthdir_y(i * 2, dir - 180);
			}
			else
			{
				var _xx = xx + lengthdir_x(i * 2, dir);
				var _yy = yy + lengthdir_y(i * 2, dir);
			}
			if (_xx < xx + raio) draw_point(_xx, _yy);
			if (_xx > xx + raio && _xx < xx + raio + 1)
			{
				var _tan_wave_timer_time = 1;
				tan_wave_timer--;
				if (tan_wave_timer <= 0)
				{
					ds_list_add(tan_points, xx + raio, _yy);
					if (ds_list_size(tan_points) > total_points)
					{
						ds_list_delete(tan_points, 0);
						ds_list_delete(tan_points, 1);	
					}
					tan_wave_timer = _tan_wave_timer_time;
				}
			}
		}
		
		for (var i = ds_list_size(tan_points) - 1; i >= 0; i-=2)
		{
			if (i >= 4)
			{	
				draw_set_alpha(0.5);
				if (point_distance(tan_points[| i - 3], tan_points[| i - 2], tan_points[| i - 1], tan_points[| i]) < 150)
					draw_line(tan_points[| i - 3], tan_points[| i - 2], tan_points[| i - 1], tan_points[| i]);
				draw_set_alpha(1);
			}
			tan_points[| i - 1] += 1;
		}
		draw_set_color(c_white);
	}
	else
		ds_list_clear(tan_points);
}

// x
var _x_x = raio * 1.5 + 10;
draw_line(xx - raio * 1.5, yy, xx + raio * 1.5, yy);
draw_text(xx + _x_x, yy, "x");
// y
draw_line(xx, yy - raio * 1.5, xx, yy + raio * 1.5);
var _y_y = -raio * 1.5 - 15;
draw_text(xx, yy + _y_y, "y");

// mouse line
draw_line(xx, yy, _ball_x, _ball_y);


// draw sin
draw_line_color(_ball_x, _ball_y, _ball_x, _ball_y + point_distance(_ball_x, _ball_y, _ball_x, yy) * _flip_y, c_red, c_red);
// draw sen circle
draw_circle_color(xx, _ball_y, 4, c_red, c_red, false);

// draw cos
draw_line_color(xx, yy, xx + point_distance(xx, yy, _ball_x, yy)*_flip_x, yy, c_blue, c_blue);
// draw cos circle
draw_circle_color(xx, yy - point_distance(xx, yy, _ball_x, yy) * _flip_x, 4, c_blue, c_blue, false);


// mouse line circle
draw_circle_color(_ball_x, _ball_y, 4, c_green, c_green, false);

// draw graus
draw_text(_ball_x + lengthdir_x(30, dir), _ball_y + lengthdir_y(30, dir), string(graus) + "°");// / " + string(rads));

// draw rads
draw_text(xx + _x_x + 30, yy, "2Pi");
draw_text(xx - _x_x - 10, yy, "Pi");
draw_text(xx, yy - _y_y + 5, "3Pi / 2");
draw_text(xx, yy + _y_y - 15, "Pi/2");

if (dir >= 359)
	dir = 0;

draw_set_halign(-1);
draw_set_valign(-1);