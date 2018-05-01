with(AppliesTo) //code inside the instance the debuff is applied to
{
	player_speed = player_speed*2; //reset the instance's speed
}

instance_destroy(); //delete the debuff object