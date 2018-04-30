if(!DebuffApplied) //if the debuff has not been applied yet
{
	switch(CurrentDebuffType)
	{
		case DebuffType.Slow:
			DebuffApplied = true; //the debuff is being applied
			with(AppliesTo) //code inside the instance the debuff is applied to
			{
				other.ResetValue = speed; //store the current player speed
				speed = other.ResetValue*0.5; //reduce the instance's speed by 50%
			}
			alarm[0] = DebuffTime*game_get_speed(gamespeed_fps); //set a timer that will reset the instance's speed upon completion
		break;
	
		case DebuffType.Heal:
			DebuffApplied = true; //the debuff is being applied
			with(AppliesTo) //code inside the instance the debuff is applied to
			{
				if((PlayerHealth+(PlayerHealth*0.1)) <= MaxPlayerHealth) //if healing the player by 10% will not heal over their max health
				{
					PlayerHealth = PlayerHealth+(PlayerHealth*0.1); //heal the player by 10%
				}
				else //if healing by 10% would go over the max health
				{
					PlayerHealth = MaxPlayerHealth; //heal the player to max
				}
			}
			instance_destroy(); //delete the debuff
		break;
	
		case DebuffType.Polymorph:
			DebuffApplied = true; //the debuff is being applied
			with(AppliesTo) //code inside the instance the debuff is applied to
			{
				other.ResetValue = sprite_index; //store the current player sprite
				sprite_index = SlimeSprite; //make the player look like a slime
			}
			alarm[1] = DebuffTime*game_get_speed(gamespeed_fps); //set a timer that will reset the instance's sprite upon completion
		break;
	}
}