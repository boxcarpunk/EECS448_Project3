enum playerSelect
{
	Kurt,
	DrBardas
}

///Initialize variables
MoveLeft = 0;
MoveRight = 0;
MoveUp = 0;
MoveDown = 0;
dead = false;
deflectCoolDown = 20;
TankCooldown = 30;
ProjCount = 0;
MaxProjCount = 20;
state=states.normal;
MaxPlayerHealth = 10;
PreviousHealth = MaxPlayerHealth;
PlayerHealth = MaxPlayerHealth;
dying = false;
gamepad_set_axis_deadzone(0,0.25);
if(gamepad_is_connected(0))
	instance_create_depth(x,y,0,obj_Arrow);
myHurtbox = instance_create_depth(x,y,-1000,obj_Char_Hurtbox);//draws player hurtbox
scr_inventory_create(6);
global.equippedItem = noone;
global.item_index = 0;
god = false;
player_speed = 15;
MaxPlayerSpeed = 15;

name = "Kurt Slagle"
currentPlayer = playerSelect.Kurt;
playerProfile = s_Player;
playerMoveSpr = s_PlayerMovement;
playerAttackSpr = s_PlayerAttack;
playerDyingSpr = s_DeathAnimation;
playerDeadSpr = s_Death_Down;