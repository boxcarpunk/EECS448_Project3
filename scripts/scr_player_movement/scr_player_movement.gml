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
	MoveLeft = -player_speed;
}
if(MRight)
{
	MoveRight = player_speed;
}
if(MUp)
{
	MoveUp = -player_speed;
}
if(MDown)
{
	MoveDown = player_speed;
}
//Horizontal Collision
if(place_meeting(x+MoveLeft+MoveRight,y,obj_Solid))
{
	while(!place_meeting(x+sign(MoveLeft+MoveRight),y,obj_Solid))
	{
		x+=sign(MoveLeft+MoveRight);
	}
	MoveLeft = 0;
	MoveRight = 0;
}
//Vertical Collision
if(place_meeting(x,y+MoveUp+MoveDown,obj_Solid))
{
	while(!place_meeting(x,y+sign(MoveUp+MoveDown),obj_Solid))
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

if(abs(MoveLeft+MoveRight)==abs(MoveUp+MoveDown))
{
	x+=sign(MoveLeft+MoveRight)*player_speed/sqrt(2);
	y+=sign(MoveUp+MoveDown)*player_speed/sqrt(2);
}
else
{
	x+=MoveLeft+MoveRight;
	y+=MoveUp+MoveDown;
}