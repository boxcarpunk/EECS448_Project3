//draw a darker cover over the background
if(global.fade>=1)
{
	instance_deactivate_object(inst_78C8041E);
}
prevAlpha = draw_get_alpha();
prevColor = draw_get_color();

draw_set_alpha(global.fade);
draw_set_color(c_black);
draw_rectangle(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]),camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]),camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]),0);	

if(global.fade >= 1)
{
	//draw Pause Menu
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_set_font(HeadingFont);
	draw_text(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2,camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/4,"You Died.");
	
	//--------------Draw Buttons--------------
	//button dimensions
	buttonWidth = 155;
	buttonHeight = 55;
	buttonX = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2;
	buttonY = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/4 + buttonHeight;
	buttonOffset = buttonHeight + 20;
	
	//the colors for the normal button
	darkGrey = make_color_rgb(137,137,137);
	mediumGrey = make_color_rgb(183,183,183);
	lightGrey = make_color_rgb(215,215,215);
	
	//the colors for the hover button
	darkGreen = make_color_rgb(0,166,81);
	mediumGreen = make_color_rgb(53,181,74);
	lightGreen = make_color_rgb(124,197,118);
	
	//color offsets
	mediumOffset = 1;
	innerOffset = mediumOffset + 2;
	
	//button vars
	buttonPressed = argument0;
	if(scr_button(buttonX, buttonY, buttonWidth, buttonHeight, 0, buttonPressed, "Respawn")) {
		instance_activate_object(inst_78C8041E);
		inst_78C8041E.PlayerHealth = inst_78C8041E.MaxPlayerHealth;
		if(room_get_name(room) == "room5")
		{
			room_goto(room5);
			inst_78C8041E.x = 640;
			inst_78C8041E.y = 750;
			global.fade = 0.01;
		}
		else
		{
			room_goto(room0);
			inst_78C8041E.x = 612;
			inst_78C8041E.y = 1428;
			global.fade = 0.01;
		}
	}
	if(scr_button(buttonX, buttonY + buttonOffset, buttonWidth, buttonHeight, 2, buttonPressed, "Quit")) {
		game_end();
	}
}
draw_set_alpha(prevAlpha);
draw_set_color(prevColor);