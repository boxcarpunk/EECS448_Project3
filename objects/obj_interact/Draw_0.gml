/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_white);
draw_set_alpha(1);
draw_set_font(TitleFont-20);
draw_text(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2-string_length(Message)*5,camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/4+40,Message);

self.visible = false;