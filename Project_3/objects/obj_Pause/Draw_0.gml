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