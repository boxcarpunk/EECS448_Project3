event_inherited();

Health = 5; //amount of health the monster has
MaxHealth = 5; //maximum amount of health the monster has
MoveSpeed = 2; //movement speed (in pixels per step) of the monster
MeleeDamage = 2; //amount of damage the monster's melee attack does
DefaultSprite = Frank_Movement; //the sprite that the monster will use by default
AttackAnimation = Frank_Attack; //the sprite that the monster will use when melee attacking
AttackEndFrame = 6; //the last frame of the attack animation
DeathAnimation = noone; //the sprite that the monster will use when it dies
DeathEndFrame = 0; //the last frame of the death animation
DamageType = "Melee"; //the type of damage the monster does, either Ranged or Melee