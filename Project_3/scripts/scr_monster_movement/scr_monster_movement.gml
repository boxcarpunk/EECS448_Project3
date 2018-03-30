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
if(instance_place(x, y, char_Col))
{
	Health -= 1; //take damage
}

//generic collision
if(collisionID = instance_position(x, y, solid)) //check if colliding with a solid object and store the id if so
{
	direction = point_direction(collisionID.x, collisionID.y, x, y); //point from the colliding object to the monster
	move_outside_solid(direction, -1); //move away from the object until collision has ended
}

//if the player is within aggro range
if(distance_to_object(object0) < AggroRange)
{
	mp_potential_path(Room0Patrol, object0.x, object0.y, MoveSpeed, 4, 0); //set a path toward the character
	path_start(Room0Patrol, MoveSpeed, path_action_stop, 0); //start along that path
}
