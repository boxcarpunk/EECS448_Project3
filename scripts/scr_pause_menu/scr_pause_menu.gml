prevAlpha = draw_get_alpha();
prevColor = draw_get_color();

//draw a darker cover over the background
draw_set_alpha(.75);
draw_set_color(c_black);
draw_rectangle(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]),camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]),camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]),0);

//draw Pause menu
if(!variable_global_exists("help") || !global.help)
{
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_set_font(TitleFont);
	draw_text(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2,camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/6,"Pause");
	
	//--------------Draw Buttons--------------
	//button dimensions
	buttonWidth = 155;
	buttonHeight = 55;
	buttonX = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2;
	buttonY = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/4 + buttonHeight;
	buttonOffset = buttonHeight + 20;


	//button vars
	buttonPressed = argument0;
	if(scr_button(buttonX, buttonY, buttonWidth, buttonHeight, 1, buttonPressed, "Resume")) {
		global.pause = false;
	}

	if(scr_button(buttonX, buttonY + buttonOffset, buttonWidth, buttonHeight, 2, buttonPressed, "Help")) {
		global.help = true;
	}
	if(scr_button(buttonX, buttonY + buttonOffset, buttonWidth, buttonHeight, 0, buttonPressed, "Quit")) {
		game_end();
	}
}
//draw help menu
else{
	scr_help_screen(buttonPressed);	
}
draw_set_alpha(prevAlpha);
draw_set_color(prevColor);