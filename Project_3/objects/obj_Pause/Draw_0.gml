/// @description Insert description here
// You can write your code in this editor
healthOffset = 5;
lineLength = 30;
lineWidth = 3;
depth = -5;
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if(myHealth < 0)
{
	myHealth = maxHealth;	
}
if(keyboard_check_pressed(vk_escape)){
	global.pause = not(global.pause);
}

if(global.pause){
	instance_deactivate_all(true);
	
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
	draw_text(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2,camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/4,"Pause");
	
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
		
		//if the mouse is hobering over a button
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
					case 0: //Resume Button
						global.pause = false;
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
			text = "Resume";
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
else{
	instance_activate_all();
	
	myHealth = myHealth-random_range(1,10)/5;
	size = 1/23.75;
	
	//draw player health bar
	profileOffsetX = 2;
	profileWidth = 60;
	healthLength = 200;
	healthHeight = 20;
	borderWidth = 2;
	borderColor = c_blue;
	draw_rectangle_color(camera_get_view_x(view_camera[0]) + profileWidth + healthOffset + profileOffsetX - borderWidth,camera_get_view_y(view_camera[0]) + profileWidth + healthOffset - borderWidth, camera_get_view_x(view_camera[0])+profileWidth + healthOffset + healthLength + profileOffsetX + borderWidth,camera_get_view_y(view_camera[0])+profileWidth + healthOffset + healthHeight + borderWidth,borderColor, borderColor,borderColor, borderColor, false);
	draw_rectangle_color(camera_get_view_x(view_camera[0]) + profileWidth + healthOffset + profileOffsetX, camera_get_view_y(view_camera[0]) + profileWidth + healthOffset, camera_get_view_x(view_camera[0])+profileWidth + healthOffset + healthLength + profileOffsetX,camera_get_view_y(view_camera[0])+profileWidth + healthOffset+healthHeight,c_red, c_red,c_red, c_red, false);
	draw_rectangle_color(camera_get_view_x(view_camera[0]) + profileWidth + healthOffset  + profileOffsetX, camera_get_view_y(view_camera[0]) + profileWidth + healthOffset, camera_get_view_x(view_camera[0])+profileWidth + healthOffset + profileOffsetX + healthLength*myHealth/maxHealth ,camera_get_view_y(view_camera[0])+profileWidth + healthOffset+healthHeight,c_green, c_green,c_green, c_green, false);
	
	//draw player profile
	profileOffsetY = healthOffset + healthHeight;
	draw_rectangle_color(camera_get_view_x(view_camera[0]) + profileOffsetX,camera_get_view_y(view_camera[0]) + profileOffsetY - borderWidth, camera_get_view_x(view_camera[0]) + profileWidth + profileOffsetX + borderWidth*2,camera_get_view_y(view_camera[0]) + profileWidth + profileOffsetY + borderWidth,borderColor, borderColor,borderColor, borderColor, false);
	draw_sprite_ext(PlayerFace, 0, camera_get_view_x(view_camera[0]) + profileOffsetX +  borderWidth, camera_get_view_y(view_camera[0]) + profileOffsetY,profileWidth/sprite_get_width(PlayerFace) ,profileWidth/sprite_get_width(PlayerFace),0,c_white,1 );
	
	//draw player name
	playerName = "Alex Bardas";
	textOffsetX = 7/16 * font_get_size(NameFont);
	textOffsetX = string_length(playerName) * textOffsetX;
	draw_set_color(borderColor);
	draw_set_alpha(1);
	draw_set_font(NameFont);
	draw_text(camera_get_view_x(view_camera[0])+profileWidth + healthOffset + textOffsetX,camera_get_view_y(view_camera[0])+profileWidth + healthOffset - 10, playerName);
	
	//draw the player ability icon	
	abilityBoxSize = 60;
	abilityBackgroundColor = c_gray;
	ability1X = camera_get_view_x(view_camera[0]) - abilityBoxSize/2 + 100;
	ability1Y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])- abilityBoxSize/2 - 30;
	
	draw_rectangle_color(ability1X - abilityBoxSize/2,ability1Y - abilityBoxSize/2,ability1X + abilityBoxSize/2,ability1Y + abilityBoxSize/2, borderColor,borderColor,borderColor,borderColor,false);
	draw_rectangle_color(ability1X - abilityBoxSize/2+2,ability1Y - abilityBoxSize/2+2,ability1X + abilityBoxSize/2-2,ability1Y + abilityBoxSize/2-2, abilityBackgroundColor,abilityBackgroundColor,abilityBackgroundColor,abilityBackgroundColor,false);
	draw_sprite(sprite4,0,ability1X+2,ability1Y+4);
	//-----------Draw Cooldown Cycle------------
	//find the cooldown for the ability
	cooldown1TimeLeft = (cooldown1 - (current_time - timeAbility1Used)/1000)/cooldown1;
	if(cooldown1TimeLeft > 0) {
		
		//draw the cooldown box
		draw_set_color(c_black);
		draw_set_alpha(.75);
		draw_primitive_begin(pr_trianglefan);
			//draw the center point of the cooldown box
			draw_vertex(ability1X, ability1Y);
			
			//draw the top center point of the cooldown box
			draw_vertex(ability1X, ability1Y - abilityBoxSize/2);
			
			//draw the corners of the cooldown box
			if(cooldown1TimeLeft > .125) {draw_vertex(ability1X - abilityBoxSize/2, ability1Y - abilityBoxSize/2);}
			if(cooldown1TimeLeft > .375) {draw_vertex(ability1X - abilityBoxSize/2, ability1Y + abilityBoxSize/2);}
			if(cooldown1TimeLeft > .625) {draw_vertex(ability1X + abilityBoxSize/2, ability1Y + abilityBoxSize/2);}
			if(cooldown1TimeLeft > .875) {draw_vertex(ability1X + abilityBoxSize/2, ability1Y - abilityBoxSize/2);}
			
			//draw the rotating edge of the cooldown box
			degreeOfRotation = -360 * (cooldown1TimeLeft)-90;
			cooldownX = cos(degtorad(degreeOfRotation));
			cooldownY = sin(degtorad(degreeOfRotation));
			if((degreeOfRotation + 360 + 90) % 180 > 45 && (degreeOfRotation + 360 + 90) % 180 < 135){
				edgeConst = abs(abilityBoxSize/2/cooldownX);
			}
			else{
				edgeConst = abs(abilityBoxSize/2/cooldownY);
			}
			cooldownX = cooldownX * edgeConst;
			cooldownY = cooldownY * edgeConst;
			draw_vertex(ability1X + cooldownX, ability1Y + cooldownY);
		draw_primitive_end();
		
		//draw the cooldown time
		draw_set_color(c_black);
		draw_set_alpha(1);
		draw_set_font(UIFont);
		textOffsetX = 0;//13
		textOffsetY = 0;//27
		myText = string(ceil(cooldown1TimeLeft * cooldown1));
		textOffsetX = textOffsetX * string_length(myText);
		draw_text(ability1X, ability1Y, myText);
	}
	//-----------End Draw Cooldown Cycle------------
}

