/// @description Insert description here

if(run)
{
	//draws the bridge (1 row per second)
	counter++;
	if(counter >= 30) 
	{
	    scr_bridge();
	    counter = 0;
	}
	
	
	if(layer_get_visible("Bridge3_tiles"))//if the bridge is built
	{
		run = false;//stop running
	}
}

if(!instance_exists(obj_Monster) && spawned == false)//if monsters have been killed and the spellbook has not spawned
{
	spell = instance_create_depth(811, 775, layer_get_depth("Player_Instance"), obj_spellbook);//spawn a spellbook
	spell.CurrentState = SpellbookType.GreaterSpellbook;//make the spellbook a greater spellbook
	spell.sprite_index = s_greaterSpellbook;//use the greater spellbook sprite
	spell.damage = 2;//set the spellbook damage
	spawned = true;//set spawned to true
}