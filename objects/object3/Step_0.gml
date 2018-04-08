/// @description Insert description here
// You can write your code in this editor
if(instance_place(x, y, o_solid) )
{
	with(instance_place(x, y, o_solid))
	{
		if(isWater == false)
		{
			instance_destroy(object3);
		}
	}
}
