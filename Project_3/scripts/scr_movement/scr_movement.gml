MLeft = keyboard_check(ord("A"));
MRight = keyboard_check(ord("D"));
MUp = keyboard_check(ord("W"));
MDown = keyboard_check(ord("S"));
MoveLeft = 0;
MoveRight = 0;
MoveUp = 0;
MoveDown = 0;
if(MLeft)
{
	MoveLeft = -30;
}
if(MRight)
{
	MoveRight = 30;
}
if(MUp)
{
	MoveUp = -30;
}
if(MDown)
{
	MoveDown = 30;
}
//Horizontal Collision
if(place_meeting(x+MoveLeft+MoveRight,y,o_solid))
{
	while(!place_meeting(x+sign(MoveLeft+MoveRight),y,o_solid))
	{
		x+=sign(MoveLeft+MoveRight);
	}
	MoveLeft = 0;
	MoveRight = 0;
}
//Vertical Collision
if(place_meeting(x,y+MoveUp+MoveDown,o_solid))
{
	while(!place_meeting(x,y+sign(MoveUp+MoveDown),o_solid))
	{
		y+=sign(MoveUp+MoveDown);
	}
	MoveUp = 0;
	MoveDown = 0;
}
//Turn Around
if(MoveLeft+MoveRight!=0)
{
	image_xscale = sign(MoveLeft+MoveRight)*-1;
}
x += MoveLeft+MoveRight;
y += MoveUp+MoveDown;