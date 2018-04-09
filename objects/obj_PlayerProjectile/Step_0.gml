/// @description Insert description here
// You can write your code in this editor

if(instance_place(x, y, obj_Solid))//if colliding with collision object
{
	with(instance_place(x, y, obj_Solid))
	{
		if(isWater == false)
		{
			with(instance_place(x,y, obj_PlayerProjectile)){
				instance_destroy(self);//destroys the projectile if the collision object is not water
			}
		}
	}
}
