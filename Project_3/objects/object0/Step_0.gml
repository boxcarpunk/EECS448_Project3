switch(state)
{
	case states.normal:
		scr_player_default();
		break;
	case states.attack:
		scr_player_attack();
		break;
}
camera_set_view_pos(view_camera[0], x-370, y-280);
