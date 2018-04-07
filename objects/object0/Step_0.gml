RAttack = mouse_check_button_pressed(mb_right);
if(RAttack)
{
	image_index = 0;
	state=states.attack;
}
with(instance_place(x,y,obj_char_hurtbox))
{
	if(place_meeting(x, y, obj_MonsterProjectile)) //if colliding with the player
	{
		inst_78C8041E.PlayerHealth -= obj_MonsterProjectile.Damage; //take one damage
		with(instance_place(x,y,obj_MonsterProjectile))
		{
			DeleteProjectile = true;
		}
	}
}
scr_player_movement();
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
instance_create_depth(x,y,-1000,obj_char_hurtbox);
obj_char_hurtbox.image_xscale = inst_78C8041E.image_xscale;

//death condition
//if(PlayerHealth <= 0)
//{
	
//	instance_destroy();
	//object_set_sprite(object0, sprite14);

//}	
