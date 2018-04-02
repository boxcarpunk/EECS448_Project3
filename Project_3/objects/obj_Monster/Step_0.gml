//projectile attack
if(CanFire && (distance_to_object(inst_78C8041E) < ProjectileRange)) //if the player is within range and cooldown is over
{
	CanFire = false; //reset the cooldown flag
	scr_monster_projectile_attack();
}

//movement
scr_monster_movement();

//death condition
if(Health <= 0)
{
	instance_destroy();
}