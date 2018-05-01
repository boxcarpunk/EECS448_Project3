if(instance_place(x, y, obj_Solid) )
{
	with(instance_place(x, y, obj_Solid))
	{
		if(isWater == false)
		{
			with(instance_place(x,y,obj_MonsterProjectile))
			{
				DeleteProjectile = true;
			}
		}
	}
}

//death animation
if(DeleteProjectile)
{
	if(sprite_index != DestructionSprite) //if not playing the death animation
	{
		speed = 0; //do not move
		Damage = 0; //do not do damage
		
		sprite_index = DestructionSprite; //switch to the death animation
		image_index = 1; //play from the beginning of the animation
		image_speed = 1; //play the animation
	}
	if(image_index > DestructionEndFrame) //if at the end of the animation
	{
		instance_destroy(); //delete the projectile
	}
}
else //if the death animation is not going
{
	sprite_index = ProjectileSprite; //make sure you are set to the right sprite
}