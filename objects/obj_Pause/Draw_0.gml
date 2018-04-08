/// @description Insert description here
// You can write your code in this editor


depth = -300;
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if(keyboard_check_pressed(vk_escape)){
	global.pause = not(global.pause);
}
else if(keyboard_check_pressed(vk_tab)){
	global.inventoryIsOpened = !global.inventoryIsOpened;
}

if(global.displayTitleMenu)
{
	instance_deactivate_all(global.displayTitleMenu);
	scr_title_menu(buttonPressed);
}
else if(global.pause){
	instance_deactivate_all(global.pause);
	scr_pause_menu(buttonPressed);
}
else if(global.inventoryIsOpened){
	instance_deactivate_all(global.inventoryIsOpened);
	scr_inventory_menu();
}
else if(inst_78C8041E.PlayerHealth <=0)
{
	
	if(fadeStartTime == 0){
		fadeStartTime = current_time;	
	}
	global.fade = (current_time - fadeStartTime)/1000 / 1.5;
	scr_death_menu(buttonPressed);
}
else{
	//instance_activate_all();
	instance_activate_region(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]),camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]),true);
	
	fadeStartTime = 0;
	healthOffset = 5;
	healthLength = 200;
	healthHeight = 20;
	borderWidth = 2;
	borderColor = c_blue;
	profileOffsetX = 2;
	profileOffsetY = healthOffset + healthHeight;
	profileSize = 60;

	if(!global.pause && !global.displayTitleMenu){
		//draw player health bar
		scr_slider(camera_get_view_x(view_camera[0]) + profileSize + healthOffset + profileOffsetX, camera_get_view_y(view_camera[0]) + profileSize + healthOffset, borderWidth,  healthLength, healthHeight, inst_78C8041E.PlayerHealth/inst_78C8041E.MaxPlayerHealth, borderColor, c_red, c_green);
	
		//draw player profile
		draw_rectangle_color(camera_get_view_x(view_camera[0]) + profileOffsetX,camera_get_view_y(view_camera[0]) + profileOffsetY - borderWidth, camera_get_view_x(view_camera[0]) + profileSize + profileOffsetX + borderWidth*2,camera_get_view_y(view_camera[0]) + profileSize + profileOffsetY + borderWidth,borderColor, borderColor,borderColor, borderColor, false);
		draw_sprite_ext(PlayerFace, 0, camera_get_view_x(view_camera[0]) + profileOffsetX +  borderWidth, camera_get_view_y(view_camera[0]) + profileOffsetY, profileSize/sprite_get_width(PlayerFace), profileSize/sprite_get_width(PlayerFace),0,c_white,1 );
	
		//draw player name
		playerName = "Alex Bardas";
		textOffsetX = 3
		draw_set_color(borderColor);
		draw_set_alpha(1);
		draw_set_font(NameFont);
		draw_set_halign(fa_left);
		draw_outlined_text(camera_get_view_x(view_camera[0])+profileSize + healthOffset + textOffsetX,camera_get_view_y(view_camera[0])+profileSize + healthOffset - 10, playerName, c_dkgray, c_ltgray);
	
		//draw the player ability icon	
		abilityBoxSize = 60;
		abilityBackgroundColor = c_gray;
		ability1X = camera_get_view_x(view_camera[0]) - abilityBoxSize/2 + 100;
		ability1Y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])- abilityBoxSize/2 - 30;
		draw_rectangle_color(ability1X - abilityBoxSize/2,ability1Y - abilityBoxSize/2,ability1X + abilityBoxSize/2,ability1Y + abilityBoxSize/2, borderColor,borderColor,borderColor,borderColor,false);
		draw_rectangle_color(ability1X - abilityBoxSize/2+2,ability1Y - abilityBoxSize/2+2,ability1X + abilityBoxSize/2-2,ability1Y + abilityBoxSize/2-2, abilityBackgroundColor,abilityBackgroundColor,abilityBackgroundColor,abilityBackgroundColor,false);
		draw_sprite(sprite4,0,ability1X+2,ability1Y+4);
		scr_cooldown_box(ability1X, ability1Y, abilityBoxSize, abilityBoxSize, (inst_78C8041E.MaxProjCount - inst_78C8041E.ProjCount)/inst_78C8041E.MaxProjCount, 1);
	
	
		if(inst_78C8041E.PlayerHealth > 0){
			//draw all monster health bars
			monsterHealthXOffset = -10;
			monsterHealthYOffset = -35;
			monsterHealthLength = 30;
			monsterHealthHeight = 5;
			monsterBorderWidth = 1;
			for (i = 0; i < instance_number(obj_Monster); i += 1)
			{
				monster = instance_find(obj_Monster,i);
				scr_slider(monster.x+monsterHealthXOffset, monster.y+monsterHealthYOffset, monsterBorderWidth, monsterHealthLength, monsterHealthHeight, monster.Health/3, c_black, c_red, c_green);
			}
		}
	}
}