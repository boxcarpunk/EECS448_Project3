//draw a darker cover over the background
if(global.fade>=1)
{
	instance_deactivate_object(inst_78C8041E);
}

draw_set_alpha(global.fade);
draw_set_color(c_black);
draw_rectangle(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]),camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]),camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]),0);	
draw_set_alpha(1);

if(global.fade >= 1)
{
	//draw Pause Menu
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_set_font(UIFont);
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
	buttonIndex = 0;
	
	//if the mouse is hovered over the button
	for (buttonIndex = 0; buttonIndex < 2; buttonIndex += 1)
	{
		//draw each button below the other
		buttonY = buttonY + buttonOffset * buttonIndex;
		
		//if the mouse is hovering over a button
		if(mouse_x > buttonX - buttonWidth/2 && mouse_x < buttonX + buttonWidth/2 && mouse_y > buttonY - buttonHeight/2 && mouse_y < buttonY + buttonHeight/2){
			draw_roundrect_color(buttonX - buttonWidth/2, buttonY - buttonHeight/2, buttonX + buttonWidth/2, buttonY + buttonHeight/2, darkGreen, darkGreen, false);
			draw_roundrect_color(buttonX - buttonWidth/2 + mediumOffset, buttonY - buttonHeight/2 + mediumOffset, buttonX + buttonWidth/2 - mediumOffset, buttonY + buttonHeight/2 - mediumOffset, mediumGreen, mediumGreen, false);
		
			//if the mouse is pressed, draw the inside of the button a dark color
			if(mouse_check_button(1)){
				draw_roundrect_color(buttonX - buttonWidth/2 + innerOffset, buttonY - buttonHeight/2 + innerOffset, buttonX + buttonWidth/2- innerOffset, buttonY + buttonHeight/2- innerOffset, darkGreen, darkGreen, false);
				buttonPressed = buttonIndex;
			}
			
			//if the mouse isn't pressed, draw the inside of the button a light color
			else {
				draw_roundrect_color(buttonX - buttonWidth/2 + innerOffset, buttonY - buttonHeight/2 + innerOffset, buttonX + buttonWidth/2- innerOffset, buttonY + buttonHeight/2- innerOffset, lightGreen, lightGreen, false);	
				
				//run the functions for the button
				if(buttonPressed == buttonIndex)
				{
					switch(buttonIndex)
					{
					case 0: //Respawn Button
						instance_activate_object(inst_78C8041E);
						inst_78C8041E.PlayerHealth = inst_78C8041E.MaxPlayerHealth;
						room_goto(room0);
						inst_78C8041E.x = 612;
						inst_78C8041E.y = 1428;
						global.fade = 0.01;
						break;
					case 1: //Quit Button
						game_end();
						break;
					default:
						draw_text(x,y+20,"Yello: " + buttonIndex);
					}
					buttonPressed = -1;
				}
			
			}
			draw_text(x,y,buttonPressed);
		}
		//if the mouse isn't hovered over the button
		else{
			if(buttonPressed == buttonIndex)
				buttonPressed = -1;
			draw_roundrect_color(buttonX - buttonWidth/2, buttonY - buttonHeight/2, buttonX + buttonWidth/2, buttonY + buttonHeight/2,darkGrey, darkGrey, false);
			draw_roundrect_color(buttonX - buttonWidth/2 + mediumOffset, buttonY - buttonHeight/2 + mediumOffset, buttonX + buttonWidth/2 - mediumOffset, buttonY + buttonHeight/2 - mediumOffset,mediumGrey, mediumGrey, false);
			draw_roundrect_color(buttonX - buttonWidth/2 + innerOffset, buttonY - buttonHeight/2 + innerOffset, buttonX + buttonWidth/2- innerOffset, buttonY + buttonHeight/2- innerOffset,lightGrey, lightGrey, false);
		}
	
		//draw the text for the button
		draw_set_color(c_black);
		draw_set_alpha(1);
		draw_set_font(UIFont);
		switch(buttonIndex)
		{
		case 0:
			text = "Respawn";
			break;
		case 1:
			text = "Quit";
			break;
		default:
			text = "YOLO";
		}
		draw_text(buttonX, buttonY, text);
	}
	//-------------End Draw Buttons--------------
}

