///@arg x
///@arg y


//draw a darker cover over the background
draw_set_alpha(.75);
draw_set_color(c_black);
draw_rectangle(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]),camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]),camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]),0);
draw_text(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]),"People");
	
//pause the cooldown counter;
timeAbility1Used = (cooldown1TimeLeft * cooldown1  - cooldown1) * 1000 + current_time;
	
//draw Pause Menu
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_font(UIFont);
draw_text(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2,camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/4,"Inventory");


var _x = argument0;
var _y = argument1;

for(var i=0; i< array_length_1d(global.inventory); i++)
{
	var box_x = _x+i*64;
	var box_y = _y;
	draw_sprite(s_inventory_box, 0, box_x, box_y);
}
