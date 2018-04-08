/// @description Insert description here
// You can write your code in this editor
if(instance_place(x, y, obj_Solid) )
{
	with(instance_place(x, y, obj_Solid))
	{
		if(isWater == false)
		{
			instance_destroy(obj_PlayerProjectile);
		}
	}
}
