if(run)
{
	instance_deactivate_all(true); //deactivate all objects
	
	if(keyboard_check_pressed((ord("E"))))
	{
		run = false;
		instance_activate_all();
	}
}