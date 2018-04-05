//default character
LAttack = mouse_check_button_pressed(mb_left);
if((LAttack)&&(ProjCount == 0))
{
	var Proj = instance_create_depth(x,y,-10000,object3);
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
	sprite_index = sprite5;
}
else
{
	sprite_index = sprite2;
}