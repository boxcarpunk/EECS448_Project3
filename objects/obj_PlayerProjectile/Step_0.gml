/// @description Insert description here
// You can write your code in this editor

if(instance_place(x, y, obj_Solid))//if colliding with collision object
{
	with(instance_place(x, y, obj_Solid))
	{
		if(isWater == false)
		{
			with(instance_place(x,y, obj_PlayerProjectile)){
				DeleteProjectile = true; //destroys the projectile if the collision object is not water
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
		damage = 0; //do not do damage
		
		sprite_index = DestructionSprite; //switch to the death animation
		image_index = 1; //play from the beginning of the animation
		image_speed = 1; //play the animation
	}
	if(image_index > DestructionEndFrame) //if at the end of the animation
	{
		instance_destroy(); //delete the projectile
	}
}
