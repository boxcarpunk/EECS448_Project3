//default character
LAttack = mouse_check_button_pressed(mb_left);
if((LAttack)&&(ProjCount == 0))
{
	if(global.equippedItem != noone)//if an item is equipped
	{
		var Proj = instance_create_depth(x,y,inst_78C8041E.depth,obj_PlayerProjectile);//create a projectile
		ProjCount++;//increment projectile count
	}
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
	if(sprite_index != SlimeSprite && argument_count > 0) //if the player is not being polymorphed
	{
		sprite_index = argument[0];
	}
}
else
{
	if(sprite_index != SlimeSprite && argument_count > 1) //if the player is not being polymorphed
	{
		sprite_index = argument[1];
	}
}