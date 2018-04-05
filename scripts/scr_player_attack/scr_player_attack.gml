sprite_index = sprite6;
//Turn Around
if(MoveLeft+MoveRight!=0)
{
	image_xscale = sign(MoveLeft+MoveRight);
}
if(image_index <=4)
{
	with(instance_create_depth(x,y,-10000,obj_hitbox))
	{
		image_xscale = inst_78C8041E.image_xscale;
		with(instance_place(x,y,obj_enemy_hurtbox))
		{
			if(place_meeting(x,y,obj_hitbox))
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
}
else
{
	state = states.normal;
}