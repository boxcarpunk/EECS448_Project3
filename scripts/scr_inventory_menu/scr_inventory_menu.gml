///@arg x
///@arg y


//draw a darker cover over the background
draw_set_alpha(.75);
draw_set_color(c_black);
draw_rectangle(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]),camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]),camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]),0);
draw_text(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]),"People");
	
//draw Pause Menu
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_font(HeadingFont);
draw_text(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2,camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/4,"Inventory");


var boxSize = 64;//size of inventory box

//get coordinates to draw the boxes at
var _x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2 - (array_length_1d(global.inventory)-1)/2 * boxSize;
var _y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2;

if(keyboard_check_pressed(ord("D")))
{
	//MLeft = !MLeft;
	global.item_index = min(global.item_index+1, array_length_1d(global.inventory)-1);
}
if(keyboard_check_pressed(ord("A")))
{
	//MRight = !MRight;
	global.item_index = max(global.item_index-1, 0);
}

if(keyboard_check(vk_enter))
{
	if(global.inventory[global.item_index] = obj_spellbook)
	{
		global.equippedItem = global.inventory[global.item_index];
	}
}
else if(keyboard_check(vk_backspace))
{
	if(global.inventory[global.item_index] = global.equippedItem)
	{
		global.equippedItem = noone;
	}
}

for(var i=0; i< array_length_1d(global.inventory); i++)//for each slot in array
{
	var box_x = _x+i*boxSize;//spaces the boxes out in the x direction
	var box_y = _y;//gets the y value to draw the boxes at. Can be modified as above to add multiple rows if desired
	draw_sprite(s_inventory_box, 0, box_x, box_y);//draws the empty inventory slot boxes
	
	instance_activate_object(global.inventory[i]);//activates the object (previously deactivated in pause object)
	
	//var _item = global.inventory[i];//gets the item
	
	if(global.inventory[i] != noone)//if item exists (and is not deactivated)
	{
		draw_sprite(global.inventory[i].sprite_index,0, box_x, box_y);//draw the sprite of the object -- NEEDS UPDATED WHEN ITEMS ARE ADDED
	}
	
	if(i == global.item_index)
	{
		draw_sprite(InventoryCursor, image_index/8, box_x, box_y);
		
		if(instance_exists(global.inventory[i]))
		{
			draw_set_font(HeadingFont-20);
			draw_text(_x+4, _y+48, global.inventory[i].description);
			//var desc_height = string_height(global.item_index.description);
		}
	}
	
	draw_sprite(s_inventory_box, 0, _x, _y-64);
	if(global.equippedItem == noone)//if item exists (and is not deactivated)
	{
		draw_sprite(emptySpellbook,0, _x, _y-64);//draw the sprite of the object -- NEEDS UPDATED WHEN ITEMS ARE ADDED
	}
	else if(instance_exists(global.equippedItem))
	{
		draw_sprite(global.equippedItem.sprite_index, 0, _x, _y-64);
	}
	
}





