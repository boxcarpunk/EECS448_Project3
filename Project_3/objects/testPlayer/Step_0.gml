if(keyboard_check(vk_right) and keyboard_check(vk_up) && !place_meeting(x+speed_, y, o_solid) and not place_meeting(x, y-speed_, o_solid))
{
	x+=speed_;
	y-=speed_;
}
else if(keyboard_check(vk_left) and keyboard_check(vk_up) and not place_meeting(x, y-speed_, o_solid) && !place_meeting(x-speed_, y, o_solid))
{
	x-=speed_;
	y-=speed_;
}
else if(keyboard_check(vk_right) and keyboard_check(vk_down) && !place_meeting(x, y+speed_, o_solid) && !place_meeting(x+speed_, y, o_solid))
{
	x+=speed_;
	y+=speed_;
}
else if(keyboard_check(vk_left) and keyboard_check(vk_down) && !place_meeting(x-speed_, y, o_solid) && !place_meeting(x, y+speed_, o_solid))
{
	x-=speed_;
	y+=speed_;
}
else if(keyboard_check(vk_up) and not place_meeting(x, y-speed_, o_solid))
{
	y-=speed_;
}
else if(keyboard_check(vk_down) && !place_meeting(x, y+speed_, o_solid))
{
	y+=speed_;
}
else if(keyboard_check(vk_left) && !place_meeting(x-speed_, y, o_solid))
{
	x-=speed_;
}
else if(keyboard_check(vk_right) && !place_meeting(x+speed_, y, o_solid))
{
	x+=speed_;
}

camera_set_view_pos(view_camera[0], x-370,y-280);