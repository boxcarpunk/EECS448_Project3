NearestPlayer = instance_nearest(self.x, self.y, obj_Player); //finds the nearest player

//goes around the entire event, the monster will only do something if there is a player
if(NearestPlayer != noone)
{

//projectile attack
myHurtbox.image_xscale = image_xscale
myHurtbox.x = x;
myHurtbox.y = y;
if(CanFire && (distance_to_object(NearestPlayer) < ProjectileRange)) //if the player is within range and cooldown is over
{
	CanFire = false; //reset the cooldown flag
	ProjectileID = instance_create_depth(x, y, -10000, obj_MonsterProjectile); //makes the projectile and stores its id
	ProjectileID.Damage = ProjectileDamage; //sets the projectile's damage
	alarm[0] = ProjectileCooldown*game_get_speed(gamespeed_fps); //sets the cooldown until the monster can shoot again
}
with(instance_place(x,y,myHurtbox))
{
	if(place_meeting(x, y, obj_PlayerProjectile)) //if colliding with character projectile
	{
		with(instance_place(x,y,obj_PlayerProjectile))
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
if(NearestPlayer.y < self.y)
{
	depth=-10;
}
else if(NearestPlayer.y > self.y)
{
	depth=0;
}
if(NearestPlayer.x < self.x)
{
	image_xscale=-1;
}
else if(NearestPlayer.x > self.x)
{
	image_xscale=1;
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
	
	if(sprite_index != DeathAnimation) //if the death animation is not playing
	{
		sprite_index = DeathAnimation; //switch to the death animation
		image_index = 0; //start at the beginning of the animation
	}
	image_speed = 1; //play the animation
	
	if(image_index > DeathEndFrame) //if the animation is done playing
	{
		instance_destroy(); //destroy the monster
	}
}

}