prevAlpha = draw_get_alpha();
prevColor = draw_get_color();
//draw a darker cover over the background
draw_set_alpha(.75);
draw_set_color(c_black);
draw_rectangle(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]),camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]),camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]),0);

if(!variable_global_exists("charSelect") || global.charSelect = false) {
	//draw Pause Menu
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_set_font(HeadingFont);
	draw_text(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2,camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/6,"Dungeon 448");
	
	//--------------Draw Buttons--------------
	//button dimensions
	buttonWidth = 175;
	buttonHeight = 55;
	buttonX = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2;
	buttonY = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/4 + buttonHeight;
	//buttonZ = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/4 + 2*buttonHeight;
	buttonOffset = buttonHeight + 20;
	
	//button vars
	buttonPressed = argument0;
	if(scr_button(buttonX, buttonY, buttonWidth, buttonHeight, 0, buttonPressed, "Play")) {
		global.charSelect = true
		//global.displayTitleMenu = false;
	}
	
	if(scr_button(buttonX, buttonY + buttonOffset, buttonWidth, buttonHeight, 1, buttonPressed, "Test Room")) {
		global.charSelect = true
		global.testRoom = true;
	}

	if(scr_button(buttonX, buttonY + buttonOffset, buttonWidth, buttonHeight, 2, buttonPressed, "Quit")) {
		game_end();
	}
}
else{
	scr_char_select();
}
draw_set_color(prevColor);
draw_set_alpha(prevAlpha);