scr_movement();
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
		/*
		with(instance_place(x,y,obj_enemy))
		{
			vspeed = -12;
			hspeed = sign(x-other.x)*9;
			image_xscale = sign(hspeed);
		}
		*/
	}
}
else
{
	state = states.normal;
}