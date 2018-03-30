/*
//if the monster can fire a projectile, has waited an appropriate amount of time since the last shot, and is within firing range
if(FiresProjectile && ((get_timer()-LastFire)/1000000 >= FiringDelay) && (distance_to_object(obj_Player) < FiringRange))
{
	ProjectileID = instance_create_layer(x, y, instance_layer, object3); //makes the projectile and stores its id
	ProjectileID.Damage = ProjectileDamage; //sets the projectile's damage
	ProjectileID.sprite_index = Slimeball;
	LastFire = get_timer(); //updates the last firing time
}
*/

//movement
scr_monster_movement();

//death condition
if(Health <= 0)
{
	instance_destroy();
}