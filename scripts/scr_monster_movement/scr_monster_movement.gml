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
	AggroPath = path_add(); //
	Aggro = true; //the player has entered aggro range
}

//if the player is outside of aggro range
if(distance_to_object(inst_78C8041E) > AggroRange)
{
	if(Aggro) //if the player has recently come out of aggro range
	{
		Aggro = false; //the player is no longer pulling aggro
		alarm[2] = SearchTime*game_get_speed(gamespeed_fps); //the monster searches for the player (waits for the player to re-enter aggro range)
	}
}
