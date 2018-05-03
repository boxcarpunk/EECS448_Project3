with(AppliesTo) //code inside the instance the debuff is applied to
{
	player_speed = player_speed*2; //reset the instance's speed
	if(player_speed > MaxPlayerSpeed) //puts an upper limit on the player speed
	{
		player_speed = MaxPlayerSpeed;
	}
}

instance_destroy(); //delete the debuff object