RAttack = mouse_check_button_pressed(mb_right);
if(RAttack)
{
	image_index = 0;
	state=states.attack;
}
if(instance_place(x, y, obj_Monster)) //if colliding with the player
{
	PlayerHealth -= 1; //take one damage
}
scr_movement();
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
instance_create_depth(x,y,-1000,char_Col);
char_Col.image_xscale = inst_78C8041E.image_xscale;