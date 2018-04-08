//projectile attack
instance_create_depth(x,y,-1000,obj_enemy_hurtbox);
obj_enemy_hurtbox.image_xscale = obj_Monster.image_xscale;
if(CanFire && (distance_to_object(inst_78C8041E) < ProjectileRange)) //if the player is within range and cooldown is over
{
	CanFire = false; //reset the cooldown flag
	ProjectileID = instance_create_depth(x, y, -10000, obj_MonsterProjectile); //makes the projectile and stores its id
	ProjectileID.Damage = ProjectileDamage; //sets the projectile's damage
	alarm[0] = ProjectileCooldown*game_get_speed(gamespeed_fps); //sets the cooldown until the monster can shoot again
}
with(instance_place(x,y,obj_enemy_hurtbox))
{
	if(place_meeting(x, y, object3)) //if colliding with character projectile
	{
		with(instance_place(x,y,object3))
		{
			instance_destroy(); //destroy character projectile
		}
		with(instance_place(x,y,obj_Monster))
		{
			Health--; //take one damage
		}
	}
}
if(CurrentDamageCooldown!=FullDamageCooldown)
{
	CurrentDamageCooldown++;
}

//layer monster and character correctly
if(inst_78C8041E.y<obj_Monster.y)
{
	obj_Monster.depth=-10;
}
else if(inst_78C8041E.y>obj_Monster.y)
{
	obj_Monster.depth=10;
}
if(inst_78C8041E.x<obj_Monster.x)
{
	obj_Monster.image_xscale=-1;
}
else if(inst_78C8041E.x>obj_Monster.x)
{
	obj_Monster.image_xscale=1;
}

//movement
if(Health > 0)
{
	scr_monster_movement();
}

//death condition
if(Health <= 0)
{
	Health = 0; //sets health back to 0 in case it went below 0
	//don't let the monster move or attack
	MoveSpeed = 0;
	MeleeDamage = 0;
	ProjectileDamage = 0;
	ProjectileRange = 0;
	path_end();
	
	if(sprite_index != SlimeDeath) //if the death animation is not playing
	{
		sprite_index = SlimeDeath; //switch to the death animation
		image_index = 0; //start at the beginning of the animation
	}
	image_speed = 1; //play the animation
	
	if(image_index > 7) //if the animation is done playing
	{
		instance_destroy(); //destroy the monster
	}
}