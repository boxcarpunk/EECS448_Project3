prevAlpha = draw_get_alpha();
prevColor = draw_get_color();

//draw a darker cover over the background
draw_set_alpha(.75);
draw_set_color(c_black);
draw_rectangle(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]),camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]),camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]),0);

draw_set_color(c_white);
draw_set_alpha(1);
draw_set_font(HeadingFont);
draw_text(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2,camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/8,"Ability Select");
draw_text(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2,camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/8+40,"Credits: "+string(global.PlayerAbilityCredits));
camWidth = camera_get_view_width(view_camera[0])
camHeight = camera_get_view_height(view_camera[0]) 
camx = camera_get_view_x(view_camera[0])
camy = camera_get_view_y(view_camera[0])
players = [s1_Player, s_Player, s1_Player]
playerDisplay=[s1_Player1,s_Player1, s1_Player]
playerNames = ["Energy absorb", "Reflect","Bouncing Projectiles"];
if(!variable_global_exists("char_index"))
	global.char_index = 0;
if(keyboard_check_pressed(ord("A"))||(gamepad_axis_value(0,gp_axislh)<0))
{
	if(global.char_index > 0)
		global.char_index = global.char_index - 1
}
if(keyboard_check_pressed(ord("D"))||(gamepad_axis_value(0,gp_axislh)>0))
{
	if(global.char_index < array_length_1d(players)-1)
		global.char_index = global.char_index + 1
}
draw_set_font(UIFont -10)
border_width = 2;
for(i = 0; i < array_length_1d(players); i++) 
{
	//charX = camx + (i+1) *camWidth/(array_length_1d(players)+1) - sprite_get_width(players[i])/2;
	charX = camx + camWidth * 1/2 + 2*i*sprite_get_xoffset(players[i])
	charY = camy + camHeight * 7/10 - sprite_get_yoffset(players[i])
	draw_set_color(c_white);
	if(global.char_index == i) 
	{
		draw_set_color(c_yellow);
		draw_rectangle(charX- sprite_get_xoffset(players[i])-border_width , charY- sprite_get_yoffset(players[i])-border_width, charX - sprite_get_xoffset(players[i])+ sprite_get_width(players[i]) + border_width, charY- sprite_get_yoffset(players[i]) + sprite_get_height(players[i]) + border_width, false);
		draw_set_color(c_black);
		draw_rectangle(charX- sprite_get_xoffset(players[i]) , charY- sprite_get_yoffset(players[i]), charX - sprite_get_xoffset(players[i])+ sprite_get_width(players[i]), charY- sprite_get_yoffset(players[i]) + sprite_get_height(players[i]), false);
		draw_set_color(c_yellow);
		//draw_text(charX, charY + 50, playerNames[i]);
		draw_sprite(playerDisplay[i],0,camera_get_view_x(view_camera[0])+1/2*camWidth,camera_get_view_y(view_camera[0])+2/5*camHeight);
		draw_text(camera_get_view_x(view_camera[0])+1/2*camWidth,camera_get_view_y(view_camera[0])+16/30*camHeight, playerNames[i]);
	}
	global.abilityIndex = i;
	draw_sprite(players[i],0, charX, charY);
	//draw_text(charX, charY + 50, playerNames[i]);
}
if((scr_button(camx + camWidth/2, camy + camHeight * 9/10 - buttonHeight, buttonWidth, buttonHeight, 0, buttonPressed, "Play"))||(gamepad_button_check_pressed(0,gp_face1)))
{
	instance_activate_object(obj_Pause);
	if(global.PlayerAbilityCredits>=1)
	{
		if(global.char_index==0)
			global.TankLeveled = true;
		else if(global.char_index==1)
			global.DeflectLeveled = true;
		else if(global.char_index==2)
			global.BounceLeveled = true;
		global.PlayerAbilityCredits-=1;
	}
	Counter = 0;
	global.charSelect = false
	global.displayTitleMenu = false;
}

draw_set_color(prevColor);
draw_set_alpha(prevAlpha);