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

//hitbox collision
if(instance_place(x, y, obj_Hitbox))
{
	Health -= 1; //take damage
}

if(!GettingHelp) //if the monster is not running toward another monster
{
	if(distance_to_object(inst_78C8041E) < AggroRange) //if the player is within aggro range
	{
		if(!Aggro) //if the player just entered aggro range
		{
			AggroPath = path_add(); //create a new dynamic path, used to follow the player
			Aggro = true; //the player has entered aggro range
			alarm[2] = -1; //the monster stops searching for the player
		}
		if(distance_to_object(inst_78C8041E) < StopRange) //if the player is within the stop range
		{
			if(distance_to_object(inst_78C8041E) < FleeRange) //if the player is within flee range
			{
				if(instance_number(obj_Monster) == 1) //if this is the last monster
				{
					mp_potential_path(AggroPath, irandom(room_height), irandom(room_width), MoveSpeed, 4, 0); //move to a random place, who cares where? You're the last monster and the player is coming toward you!
					path_start(AggroPath, MoveSpeed, path_action_stop, 0); //move! Move anywhere! Now!
				}
				else //if there are other monsters
				{
					Comrade = instance_find(obj_Monster, 0); //find a friend
					if(Comrade == self) //if the monster found was yourself
					{
						Comrade = instance_find(obj_Monster, 1); //find a different friend
					}
					GettingHelp = true; //the monster is running toward another monster
					mp_potential_path(AggroPath, Comrade.x, Comrade.y, MoveSpeed, 4, 0); //set a path toward your friend
					path_start(AggroPath, MoveSpeed, path_action_stop, 0); //start along that path
				}
			}
			else //if the player is not within flee range
			{
				path_end(); //stop moving along the path
			}
		}
		else
		{
			mp_potential_path(AggroPath, inst_78C8041E.x, inst_78C8041E.y, MoveSpeed, 4, 0); //set a path toward the player
			path_start(AggroPath, MoveSpeed, path_action_stop, 0); //start along that path
		}
	}

	if(distance_to_object(inst_78C8041E) > AggroRange) //if the player is outside of aggro range
	{
		if(Aggro) //if the player has just come out of aggro range
		{
			Aggro = false; //the player is no longer pulling aggro
			path_delete(AggroPath); //delete the dynamic path since the monster is not following the player anymore
			alarm[2] = SearchTime*game_get_speed(gamespeed_fps); //the monster searches for the player (waits for the player to re-enter aggro range)
		}
		if(Returning && (x == path_get_x(PatrolPath, 0)) && (y == path_get_y(PatrolPath, 0))) //if the monster is returning to its patrol and arrived
		{
			Returning = false; //the monster is no longer returning
			path_delete(ReturnPath); //delete the path that returns to the patrol
			path_start(PatrolPath, MoveSpeed, path_action_continue, true); //start patrolling again
		}
	}
}
else //if the monster is running toward another monster
{
	Comrade = instance_find(obj_Monster, 0); //find a friend
	if(Comrade == self) //if the monster found was yourself
	{
		Comrade = instance_find(obj_Monster, 1); //find a different friend
	}
	
	if(distance_to_object(Comrade) > 100) //if the monster is still sufficently far away
	{
		mp_potential_path(AggroPath, Comrade.x, Comrade.y, MoveSpeed, 4, 0); //set a path toward your friend
		path_start(AggroPath, MoveSpeed, path_action_stop, 0); //start along that path
	}
	else //if close to the monster
	{
		GettingHelp = false; //help was recieved
	}
}
