if(PlayerHealth>0){ //if the player is not dead
	dying = false
	RAttack = mouse_check_button_pressed(mb_right); //right mouse click
	if(RAttack)//enters attack state
	{
		image_index = 0;
		state=states.attack;
	}
	scr_player_movement(); //movement script
	//instance_create_depth(x,y,-1000,obj_Char_Hurtbox);
	myHurtbox.image_xscale = image_xscale;
	with(instance_place(x,y,myHurtbox))
	{
		if(place_meeting(x, y, obj_MonsterProjectile)) //if colliding with the player
		{
			 //take one damage
			with(instance_place(x,y,obj_MonsterProjectile))
			{
				inst_78C8041E.PlayerHealth -= Damage;
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
	myHurtbox.x = x
	myHurtbox.y = y

}
else if (PlayerHealth <= 0 && !dying) //if player died
{
	sprite_index = Kurt_death_animation;
	dying = true;
}	
else if (dying) //after player died
{
	if (image_speed > 0)//if death animation is stopped
	{
		if (image_index > image_number - 1)
		{
			sprite_index=Kurt_death_down; //still death sprite
		}
	}
}
/*
with(instance_place(x,y,obj_Char_Hurtbox))
{
	instance_destroy();//destroys player hurtbox
}*/