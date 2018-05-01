/// @description Insert description here

if(run)
{
	var _warp = instance_create_depth(self.x, self.y, layer_get_depth("Collision_Instance"), obj_Warp)
	_warp.targetRoom = room1;
	_warp.targetX = self.x;
	_warp.targetY = self.y;
	
}