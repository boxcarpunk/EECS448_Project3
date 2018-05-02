///@arg0 item object being added
///@arg1 item object on the ground


var _item = argument0;//item being added
var _self = argument1;//item on the ground

for(var i = 0; i < array_length_1d(global.inventory); i++)
{
	if(global.inventory[i] == noone) //if inventory slot is empty
	{
		inv_item = instance_create_depth(0,0,0,_item);//create an instance of the object
		inv_item.sprite_index = _self.sprite_index;//copies the sprite from the object on the ground
		inv_item.description = _self.description;//copies the description from the object on the ground
		if(object_get_name(_item) == "obj_spellbook")//if the item is a spellbook
		{
			inv_item.CurrentState = _self.CurrentState;//copies the current state of the spellbook on the ground
			inv_item.damage = _self.damage;//copies the damage of the spellbook on the ground
			
			//sets the description depending on the state of the spellbook
			switch(inv_item.CurrentState)
			{
				case SpellbookType.StandardSpellbook:
					inv_item.description = "A spellbook.";
				break;
				
				case SpellbookType.GreaterSpellbook:
					inv_item.description = "A very powerful spellbook.";
				break;
				
			}
		}
		inv_item.persistent = true; //make the item persistent so it doesn't despawn in inv between rooms
		global.inventory[i] = inv_item;//add the item to the open inventory slot
		//global.inventory[i].itemIndex = _selfSprite;
		break;//break out of loop to avoid filling all slots with duplicates
	}
}