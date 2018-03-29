/*
//if the monster can fire a projectile, has waited an appropriate amount of time since the last shot, and is within firing range
if(FiresProjectile && ((get_timer()-LastFire)/1000000 >= FiringDelay) && (distance_to_object(obj_Player) < FiringRange))
{
	ProjectileID = instance_create_layer(x, y, instance_layer, ProjectileType); //makes the projectile and stores its id
	ProjectileID.Damage = ProjectileDamage; //sets the projectile's damage
	LastFire = get_timer(); //updates the last firing time
}
*/

//Add projectile type

//if the player is within aggro range
if(distance_to_object(object0) < AggroRange)
{
	if(MoveOrDelay) //move after a delay
	{
		if(MoveStart) //if this is the first step of movement
		{
			mp_potential_path(MonsterPatrol, object0.x, object0.y, MoveSpeed, 4, 0); //set a path toward the character
			path_start(MonsterPatrol, MoveSpeed, path_action_stop, 0); //start along that path
			image_speed = 1; //start the move animation
			MoveStart = false; //do not run this code again until after the next delay
		}
		
		//player collision
		if(position_meeting(x, y, object0))
		{
			object0.Health -= MeleeDamage; //make the player take damage
		}
		
		if((get_timer()-LastMove)/1000000 >= MoveDuration) //movement is complete
		{
			MoveOrDelay = false; //toggle to delay
			MoveStart = true; //run the first step delay code
			LastMove = get_timer(); //update the last movement time
		}
	}
	else if(!MoveOrDelay) //delay after a move
	{
		if(MoveStart) //if this is the first step of the delay
		{
			path_end(); //stop movement
			image_speed = 0; //stop the move animation
			MoveStart = false; //do not run this code again until after the next move
		}
		
		if((get_timer()-LastMove)/1000000 >= MoveDelay) //delay is complete
		{
			MoveOrDelay = false; //toggle to move
			MoveStart = true; //run the first step code for movement
			LastMove = get_timer(); //update the last movement time
		}
	}
}

//death condition
if(Health <= 0)
{
	instance_destroy();
}