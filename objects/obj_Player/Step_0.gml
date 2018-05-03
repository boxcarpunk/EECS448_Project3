switch(currentPlayer){
	
	case playerSelect.DrBardas:
		name = "Dr. Bardas"
		playerProfile = s1_Player
		playerMoveSpr = s1_PlayerMovement;
		playerAttackSpr = s1_PlayerAttack;
		playerDyingSpr = s1_Death_Animation;
		playerDeadSpr = s1_Death_Down;
		break;
		
	case playerSelect.Kurt:
	default:
		name = "Kurt Slagle"
		playerProfile = s_Player
		playerMoveSpr = s_PlayerMovement;
		playerAttackSpr = s_PlayerAttack;
		playerDyingSpr = s_DeathAnimation;
		playerDeadSpr = s_Death_Down;
		break;
}

if(PlayerHealth>0){ //if the player is not dead
	dying = false
	RAttack = mouse_check_button_pressed(mb_right) && sprite_get_name(sprite_index) != "SlimeSprite"; //right mouse click
	if(RAttack)//enters attack state
	{
		image_index = 0;
		state=states.attack;
	}
	scr_player_movement(); //movement script
	//instance_create_depth(x,y,-1000,obj_Char_Hurtbox);
	myHurtbox.image_xscale = image_xscale;
	var ThisPlayer = self; //stores the id of the current player
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
				
				if(Debuff != noone) //if there is a debuff to apply
				{
					DebuffID = instance_create_depth(x, y, -10000, obj_Debuff) //create a debuff object and store its ID
					with(DebuffID) //code in the debuff object just created
					{
						AppliesTo = ThisPlayer; //store the id of the player this debuff is being applied to
						CurrentDebuffType = other.Debuff; //store the type of debuff this is
						DebuffTime = other.DebuffTime; //store the amount of time the debuff will last
					}
					Debuff = noone; //do not apply the debuff again
				}
			}
		}
	}
	switch(state)
	{
		case states.normal:
			scr_player_default(playerProfile, playerMoveSpr);
			break;
		case states.attack:
			scr_player_attack(playerAttackSpr);
			break;
	}
	
	mid = true;


	if(x-370 < 0 && y-280 < 0)
	{
		camera_set_view_pos(view_camera[0], 0, 0);
		mid = false;
	}
	else if(x-370 < 0 && y+295 > room_height)
	{
		camera_set_view_pos(view_camera[0], 0, room_height-580);
		mid = false;
	}
	else if(x+410 > room_width&& y-280 < 0)
	{
		camera_set_view_pos(view_camera[0], room_width-780, 0);
		mid = false;
	}
	else if(x+410 > room_width && y+295 > room_height)
	{
		camera_set_view_pos(view_camera[0], room_width-780, room_height-580);
		mid = false;
	}
	else
		{
		if(x-370 < 0)
		{
			camera_set_view_pos(view_camera[0], 0, y-280);
			mid = false;
		}
	
		if(x+410 > room_width)
		{
			camera_set_view_pos(view_camera[0], room_width-780, y-280);
			mid = false;
		}
	
		if(y-280 < 0)
		{
			camera_set_view_pos(view_camera[0], x-370, 0);
			mid = false;
		}
	
		if(y+295 > room_height)
		{
			camera_set_view_pos(view_camera[0], x-370, room_height-580);
			mid = false;
		}
	}

	if(mid)
	{
		camera_set_view_pos(view_camera[0], x-370, y-280);
	}
	
	myHurtbox.x = x
	myHurtbox.y = y

}
else if (PlayerHealth <= 0 && !dying) //if player died
{
	sprite_index = playerDyingSpr;
	dying = true;
}	
else if (dying) //after player died
{
	if (image_speed > 0)//if death animation is stopped
	{
		if (image_index > image_number - 1)
		{
			sprite_index=playerDeadSpr; //still death sprite
		}
	}
}

if(keyboard_check_pressed((ord("G"))))
{
	god = !god;
}

if(god)
{
	PlayerHealth = MaxPlayerHealth;
}
if(ProjCount >= MaxProjCount)
{
	ProjCount = 0;
}
else if(ProjCount != 0)
{
	ProjCount++;
}