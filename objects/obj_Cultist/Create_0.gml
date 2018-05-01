//health
Health = 3; //amount of health the monster has
MaxHealth = 3; //maximum amount of health the monster has
FullDamageCooldown = 20;
CurrentDamageCooldown = FullDamageCooldown;

//movement
enum CultistMovement
{
	Firing,
	Teleporting,
	Idle
}
CultistMovementState = CultistMovement.Teleporting;
TeleportCooldown = 3+random_range(-.5,.5); //amount of time (in seconds) after firing that a cultist will teleport

//attack
ProjectileDamage = 1; //amount of damage the monster's projectiles do
ProjectileCooldown = 2+random_range(-.5,.5); //amount of time (in seconds) after teleporting that a cultist will fire
DebuffTime = 2; //amount of time (in seconds) to apply debuffs for
CanAttack = false; //flag indicating whether the monster can attack or not
DamageType = "Ranged"; //the type of damage the monster does, either Ranged or Melee

//projectiles
AmountProjectileTypes = 6; //stores the amount of projectiles the cultist can use
enum ProjectileType
{
	Lightning,
	SlowPlayer,
	HealPlayer,
	PolymorphPlayer,
	PolymorphSelf,
	Default
}

//sprites
ProjectileSprite = RedProjectileSprite; //the sprite that the monster's projectile will use

//other
myHurtbox = instance_create_depth(x,y,-1000,obj_Enemy_Hurtbox);