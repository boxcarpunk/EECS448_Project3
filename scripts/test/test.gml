//draw a darker cover over the background
prevAlpha = draw_get_alpha();
prevColor = draw_get_color();

draw_set_alpha(global.dim);
draw_set_color(c_black);
draw_rectangle(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]),camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]),camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]),0);	

draw_set_alpha(prevAlpha);
draw_set_color(prevColor);