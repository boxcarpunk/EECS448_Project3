if(PlayerHealth>0){
	RAttack = mouse_check_button_pressed(mb_right);
	if(RAttack)
	{
		image_index = 0;
		state=states.attack;
	}
	instance_create_depth(x,y,-1000,obj_char_hurtbox);
	with(instance_place(x,y,obj_char_hurtbox))
	{
		if(place_meeting(x, y, obj_MonsterProjectile)) //if colliding with the player
		{
			inst_78C8041E.PlayerHealth -= obj_MonsterProjectile.Damage; //take one damage
			with(instance_place(x,y,obj_MonsterProjectile))
			{
				Damage = 0;
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

	obj_char_hurtbox.image_xscale = inst_78C8041E.image_xscale;
}
else if (PlayerHealth = 0)
{
	sprite_index = Kurt_death_animation;
	//PlayerHealth=MaxPlayerHealth;
	PlayerHealth = PlayerHealth-1;



}	
else if (PlayerHealth<0)
{
	if (image_speed > 0)
	{
		if (image_index > image_number - 1)
		{
			sprite_index=Kurt_death_down;
		}
	}
}

