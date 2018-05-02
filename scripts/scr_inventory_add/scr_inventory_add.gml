///@arg item object

var _item = argument0;//item being added
var _self = argument1;

for(var i = 0; i < array_length_1d(global.inventory); i++)
{
	if(global.inventory[i] == noone) //if inventory slot is empty
	{
		instance_create_depth(0,0,0,_item);//create an instance of the object
		//_item.sprite_index = _selfSprite;
		_item.description = _self.description;
		global.inventory[i] = _item;//add the item to the open inventory slot
		//global.inventory[i].itemIndex = _selfSprite;
		break;//break out of loop to avoid filling all slots with duplicates
	}
}