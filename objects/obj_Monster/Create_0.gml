//health
Health = 3; //amount of health the monster has
MaxHealth = 3; //maximum amount of health the monster has
FullDamageCooldown = 20;
CurrentDamageCooldown = FullDamageCooldown;

//movement and ranges
MoveSpeed = 4; //movement speed (in pixels per step) of the monster 
AggroRange = 250; //range at which the monster will start engaging the player
StopRange = 100; //range at which the monster will stop persuing the player and just fire
FleeRange = 50; //range at which the monster will go get help (or panic)
enum MonsterMovementState
{
	PatrolState,
	SearchState,
	ReturningState,
	AggroState,
	StopState,
	FleeState,
	GettingHelpState
}
CurrentState = MonsterMovementState.PatrolState;

//projectile
ProjectileDamage = 1; //amount of damage the monster's projectiles do
ProjectileRange = 250; //range at which the monster will fire projectiles
ProjectileCooldown = 2; //amount of time (in seconds) between firing a projectile
CanFire = true; //flag indicating whether the monster can fire a projectile

//sprites
DeathAnimation = SlimeDeath; //the sprite that the monster will use when it dies
DeathEndFrame = 7; //the last frame of the death animation
ProjectileSprite = Slimeball; //the sprite that the monster's projectile will use
ProjectileDestruction = SlimeballExplosion; //the sprite that the projectile will use upon death
ProjectileDeathEndFrame = 5; //the last frame in the projectile's death animation

//other
SearchTime = 2; //amount of time the monster will search for the player (time between disengaging and continuing patrol)
SearchTimer = false; //a flag that indicates whether the search timer has been set or not
myHurtbox = instance_create_depth(x,y,-1000,obj_Enemy_Hurtbox);

