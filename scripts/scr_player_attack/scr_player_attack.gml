sprite_index = argument0;
//Turn Around
if(MoveLeft+MoveRight!=0)
{
	image_xscale = sign(MoveLeft+MoveRight);
}
if(image_index <=4)
{
	obj = instance_create_depth(x,y,-10000,obj_Hitbox);
	with(obj)
	{
		image_xscale = inst_78C8041E.image_xscale;
		with(instance_place(x,y,obj_Enemy_Hurtbox))
		{
			if(place_meeting(x,y,obj_Hitbox))
			{
				with(instance_place(x,y,obj_Monster))
				{
					if(CurrentDamageCooldown==FullDamageCooldown)
					{
						Health--;
						CurrentDamageCooldown = 0;
					}
				}
			}
		}
	}
	instance_destroy(obj);
}
else
{
	state = states.normal;
}