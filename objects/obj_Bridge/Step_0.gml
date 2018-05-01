/// @description Insert description here

if(run)
{
	counter++;
	if(counter >= 30) 
	{
	    scr_bridge();
	    counter = 0;
	}
	
	if(layer_get_visible("Bridge3_tiles"))
	{
		run = false;
	}
}

if(!instance_exists(obj_Cultist) && spawned == false)
{
	instance_create_depth(811, 775, layer_get_depth("Player_Instance"), obj_spellbook);
	spawned = true;
}