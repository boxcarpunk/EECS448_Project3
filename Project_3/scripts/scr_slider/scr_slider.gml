//x, y, borderWidth, length, height, slider length, slider color, background color, border color

//border rect
draw_rectangle_color(argument0 - argument2, argument1 - argument2, argument0 + argument3 + argument2, argument1 + argument4 + argument2, argument6, argument6, argument6, argument6, false);
//background rect
draw_rectangle_color(argument0, argument1, argument0 + argument3, argument1 + argument4, argument7, argument7, argument7, argument7, false);
//slider rect
draw_rectangle_color(argument0, argument1, argument0 + argument5, argument1 + argument4, argument8, argument8, argument8, argument8, false);