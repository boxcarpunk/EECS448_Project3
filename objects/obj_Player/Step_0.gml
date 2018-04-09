if(PlayerHealth>0){ //if the player is not dead
	RAttack = mouse_check_button_pressed(mb_right); //right mouse click
	if(RAttack)//enters attack state
	{
		image_index = 0;
		state=states.attack;
	}
	scr_player_movement(); //movement script
	instance_create_depth(x,y,-1000,obj_Char_Hurtbox);//draws player hurtbox
	obj_Char_Hurtbox.image_xscale = inst_78C8041E.image_xscale;
	with(instance_place(x,y,obj_Char_Hurtbox))
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

}
else if (PlayerHealth = 0) //if player died
{
	sprite_index = Kurt_death_animation;
	//PlayerHealth=MaxPlayerHealth;
	PlayerHealth = PlayerHealth-1;
}	
else if (PlayerHealth<0) //after player died
{
	if (image_speed > 0)//if death animation is stopped
	{
		if (image_index > image_number - 1)
		{
			sprite_index=Kurt_death_down; //still death sprite
		}
	}
}

with(instance_place(x,y,obj_Char_Hurtbox))
{
	instance_destroy();//destroys player hurtbox
}