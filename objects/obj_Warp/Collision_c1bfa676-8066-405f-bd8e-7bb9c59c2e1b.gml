/// @description Insert description here

NearestPlayer = instance_nearest(self.x, self.y, obj_Player);
if(drop)
{
	room_goto(targetRoom);
	//NearestPlayer.x=targetX;
	//NearestPlayer.y;
}
else
{
	room_goto(targetRoom);
	NearestPlayer.x=targetX;
	NearestPlayer.y=targetY;
}
