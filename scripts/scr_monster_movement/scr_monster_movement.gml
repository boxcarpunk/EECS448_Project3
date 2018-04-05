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
if(instance_place(x, y, obj_hitbox) && CanDamage)
{
	Health -= 1; //take damage
	CanDamage = false; //don't let the monster take damage for a bit
	alarm[1] = InvincibilityCooldown*game_get_speed(gamespeed_fps); //set the time until the monster can take damage again
}

//generic collision
if(instance_place(x, y, solid)) //check if colliding with a solid object
{
	collisionID = instance_position(x, y, solid); //stores the id of the colliding object
	direction = point_direction(collisionID.x, collisionID.y, x, y); //point from the colliding object to the monster
	move_outside_solid(direction, -1); //move away from the object until collision has ended
}

//if the player is within aggro range
if(distance_to_object(inst_78C8041E) < AggroRange)
{
	if(!Aggro) //if the player just entered aggro range
	{
		AggroPath = path_add(); //create a new dynamic path, used to follow the player
		Aggro = true; //the player has entered aggro range
		alarm[2] = -1; //the monster stops searching for the player
	}
	mp_potential_path(AggroPath, inst_78C8041E.x, inst_78C8041E.y, MoveSpeed, 4, 0); //set a path toward the player
	path_start(AggroPath, MoveSpeed, path_action_stop, 0); //start along that path
}

//if the player is outside of aggro range
if(distance_to_object(inst_78C8041E) > AggroRange)
{
	if(Aggro) //if the player has just come out of aggro range
	{
		Aggro = false; //the player is no longer pulling aggro
		path_delete(AggroPath); //delete the dynamic path since the monster is not following the player anymore
		alarm[2] = SearchTime*game_get_speed(gamespeed_fps); //the monster searches for the player (waits for the player to re-enter aggro range)
	}
}
