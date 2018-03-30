//movement animation
if(path_speed == 0)
{
	image_speed = 0; //do not loop animations
	image_index = 1; //go to the default position
}
else
{
	image_speed = 1; //loop the animation
}

//sprite direction
if(direction == 0) //if looking right
{
	image_xscale = 1; //set the sprite to look right
}
if(direction == 180) //if looking left
{
	image_xscale = -1; //set the sprite to look left
}

//collision detection
if(instance_place(x, y, object0)) //if colliding with the player
{
	if(object0.state = states.attack) //if the player is attacking
	{
		Health -= 1; //take one damage
	}
	else //if the player isn't attacking
	{
		
	}
}

//if the player is within aggro range
if(distance_to_object(object0) < AggroRange)
{
	mp_potential_path(Room0Patrol, object0.x, object0.y, MoveSpeed, 4, 0); //set a path toward the character
	path_start(Room0Patrol, MoveSpeed, path_action_stop, 0); //start along that path

	//player collision
	if(position_meeting(x, y, object0))
	{
		object0.Health -= MeleeDamage; //make the player take damage
	}
}
*/