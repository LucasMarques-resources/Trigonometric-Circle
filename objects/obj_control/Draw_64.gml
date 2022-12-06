/// @description Insert description here
// You can write your code in this editor

var _inc = 15;
draw_text(10, 10, "degrees: " + string(graus) + "°");
draw_text(10, 10 + _inc, "radians: " + string(rads));

draw_text_color(10, 10 + _inc * 2, "sin " + string(graus) + "° : " + string(sin(rads)), c_red, c_red, c_red, c_red, 1);
draw_text_color(10, 10 + _inc * 3, "cos " + string(graus) + "° : " + string(cos(rads)), c_blue, c_blue, c_blue, c_blue, 1);
var _tan = tan(rads);
if (_tan >= 10000)
	_tan = "{ }"
draw_text_color(10, 10 + _inc * 4, "tan " + string(graus) + "° : " + string(_tan), c_yellow, c_yellow, c_yellow, c_yellow, 1);

draw_set_halign(fa_right);
draw_text(room_width - 10, 10, "L - lock mouse: " + string(mouse_locked));
draw_text(room_width - 10, 10 + _inc, "M - mouse direction: " + string(mouse_direction));
draw_text(room_width - 10, 10 + _inc * 2, "S - draw sin wave (mouse off): " + string(draw_sin_wave));
draw_text(room_width - 10, 10 + _inc * 3, "C - draw cos wave (mouse off): " + string(draw_cos_wave));
draw_text(room_width - 10, 10 + _inc * 4, "T - draw tan wave (mouse off): " + string(draw_tan_wave));
draw_set_halign(-1);