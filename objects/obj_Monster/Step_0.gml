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
		obj_Monster.Health--; //take one damage
		with(instance_place(x,y,object3))
		{
			instance_destroy(); //destroy character projectile
		}
	}
}
if(CurrentDamageCooldown!=FullDamageCooldown)
{
	CurrentDamageCooldown++;
}
//movement
scr_monster_movement();

//death condition
if(Health <= 0)
{
	instance_destroy();
}