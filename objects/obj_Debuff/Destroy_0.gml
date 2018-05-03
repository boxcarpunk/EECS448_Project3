if(alarm[0] != -1)
{
	with(AppliesTo) //code inside the instance the debuff is applied to
	{
		player_speed = player_speed*2; //reset the instance's speed
	}
}
if(alarm[1] != -1)
{
	with(AppliesTo) //code inside the instance the debuff is applied to
	{
		sprite_index = other.ResetValue; //reset the instance's speed
	}
}
