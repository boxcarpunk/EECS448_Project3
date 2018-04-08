//collision
if(place_meeting(x, y, other)) //check if colliding with a solid object
{
	DeleteProjectile = true;
}

//death animation
if(DeleteProjectile)
{
	if(sprite_index != SlimeballExplosion) //if not playing the death animation
	{
		speed = 0; //do not move
		Damage = 0; //do not do damage
		
		sprite_index = SlimeballExplosion; //switch to the death animation
		image_index = 1; //play from the beginning of the animation
		image_speed = 1; //play the animation
	}
	if(image_index > 5) //if at the end of the animation
	{
		instance_destroy(); //delete the projectile
	}
}