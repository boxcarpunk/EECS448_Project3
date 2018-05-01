/// @description Insert description here

NearestPlayer = instance_nearest(self.x, self.y, obj_Player);
fadeOut = true;
if(drop)
{
	//room_goto(targetRoom);
	//NearestPlayer.x=targetX;
	//NearestPlayer.y;
}
else
{
	if(warp)
	{
		room_goto(targetRoom);
		NearestPlayer.x=targetX;
		NearestPlayer.y=targetY;
	}
}
