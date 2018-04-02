ProjectileID = instance_create_depth(x, y, -10000, obj_MonsterProjectile); //makes the projectile and stores its id

ProjectileID.Damage = ProjectileDamage; //sets the projectile's damage

ProjectileID.speed = 15; //set the speed of the projectile
ProjectileID.direction = point_direction(x, y, inst_78C8041E.x, inst_78C8041E.y); //point the projectile at the player

alarm[0] = ProjectileCooldown*game_get_speed(gamespeed_fps); //sets the cooldown until the monster can shoot again