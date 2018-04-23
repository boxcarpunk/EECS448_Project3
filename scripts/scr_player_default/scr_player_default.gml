//default character
LAttack = mouse_check_button_pressed(mb_left);
if((LAttack)&&(ProjCount == 0))
{
	var Proj = instance_create_depth(x,y,inst_78C8041E.depth,obj_PlayerProjectile);
	ProjCount++;
}
else if(ProjCount == MaxProjCount)
{
	ProjCount = 0;
}
else if(ProjCount != 0)
{
	ProjCount++;
}
//Turn Around
if(MoveLeft+MoveRight!=0)
{
	image_xscale = sign(MoveLeft+MoveRight);
}
if((MoveLeft+MoveRight == 0)&&(MoveUp+MoveDown == 0))
{
	sprite_index = s_Player;
}
else
{
	sprite_index = s_PlayerMovement;
}