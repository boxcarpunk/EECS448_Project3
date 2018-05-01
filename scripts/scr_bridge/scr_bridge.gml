
if(layer_get_visible("Bridge2_Tiles"))
{
	layer_set_visible("Bridge3_Tiles", true);
}

if(layer_get_visible("Bridge1_Tiles"))
{
	layer_set_visible("Bridge2_Tiles", true);
	layer_destroy("Bridge2_Collision");
}

if(!layer_get_visible("Bridge1_Tiles"))
{
	layer_set_visible("Bridge1_Tiles", true);
	layer_destroy("Bridge1_Collision");
}
