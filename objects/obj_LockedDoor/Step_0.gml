if(Message != UnlockedMessage)
{
	for(var i = 0; i < array_length_1d(global.inventory); i++) //iterate through the inventory
	{
		if(global.inventory[i] == asset_get_index("obj_key")) //if the key is in the player's inventory
		{
			Message = UnlockedMessage;
			break;
		}
	}
}