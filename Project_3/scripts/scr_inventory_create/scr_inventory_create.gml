///@arg size
var inventory_size = argument0;
global.inventory = [];

var i = 0;
repeat(inventory_size)
{
	global.inventory[i] = noone;
	i++;
}
//show_message(array_length_1d(global.inventory));