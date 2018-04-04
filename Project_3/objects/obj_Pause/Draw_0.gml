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
else if(keyboard_check_pressed(vk_tab)){
	global.inventoryOpened = !global.inventoryOpened;
}

if(global.pause){
	instance_deactivate_all(global.pause);
	scr_pause_menu();
}
else if(global.inventoryOpened){
	instance_deactivate_all(global.inventoryOpened);
	scr_inventory_menu(inst_78C8041E.x, inst_78C8041E.y);
}
else{
	instance_activate_all();
}

healthOffset = 5;
healthLength = 200;
healthHeight = 20;
borderWidth = 2;
borderColor = c_blue;
profileOffsetX = 2;
profileOffsetY = healthOffset + healthHeight;
profileSize = 60;

//draw player health bar
scr_slider(camera_get_view_x(view_camera[0]) + profileSize + healthOffset + profileOffsetX, camera_get_view_y(view_camera[0]) + profileSize + healthOffset, borderWidth,  healthLength, healthHeight, healthLength*inst_78C8041E.PlayerHealth/inst_78C8041E.MaxPlayerHealth, borderColor, c_red, c_green);
//draw player profile
draw_rectangle_color(camera_get_view_x(view_camera[0]) + profileOffsetX,camera_get_view_y(view_camera[0]) + profileOffsetY - borderWidth, camera_get_view_x(view_camera[0]) + profileSize + profileOffsetX + borderWidth*2,camera_get_view_y(view_camera[0]) + profileSize + profileOffsetY + borderWidth,borderColor, borderColor,borderColor, borderColor, false);
draw_sprite_ext(PlayerFace, 0, camera_get_view_x(view_camera[0]) + profileOffsetX +  borderWidth, camera_get_view_y(view_camera[0]) + profileOffsetY, profileSize/sprite_get_width(PlayerFace), profileSize/sprite_get_width(PlayerFace),0,c_white,1 );
	
//draw player name
playerName = "Alex Bardas";
textOffsetX = 7/16 * font_get_size(NameFont);
textOffsetX = string_length(playerName) * textOffsetX;
draw_set_color(borderColor);
draw_set_alpha(1);
draw_set_font(NameFont);
draw_text(camera_get_view_x(view_camera[0])+profileSize + healthOffset + textOffsetX,camera_get_view_y(view_camera[0])+profileSize + healthOffset - 10, playerName);
	
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

cooldown1TimeLeft = (inst_78C8041E.MaxProjCount - inst_78C8041E.ProjCount)/inst_78C8041E.MaxProjCount;
if(cooldown1TimeLeft > 0 && cooldown1TimeLeft < 1) {
		
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
	myText = string(ceil(cooldown1TimeLeft * 2));
	textOffsetX = textOffsetX * string_length(myText);
	draw_text(ability1X, ability1Y, myText);
	//-----------End Draw Cooldown Cycle------------
}