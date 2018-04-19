NearestPlayer = instance_nearest(self.x, self.y, obj_Player); //finds the nearest player
self.direction = point_direction(x, y, NearestPlayer.x, NearestPlayer.y);
image_angle = point_direction(x, y, NearestPlayer.x, NearestPlayer.y)-32;
self.speed=15;
Damage = 0;
DeleteProjectile = false;
self.depth = 0;

//sprites
ProjectileSprite = Slimeball; //the sprite for the projectile
DestructionSprite = SlimeballExplosion; //the death sprite for the projectile
DestructionEndFrame = 5; //the last frame in the death sprite animation