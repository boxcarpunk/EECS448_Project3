/// @description Insert description here
// You can write your code in this editor
image_angle = point_direction(x, y, mouse_x, mouse_y);
self.direction=point_direction(x, y, mouse_x, mouse_y);
self.speed=15;

if(global.equippedItem != noone)//if the equip slot is not empty
{
	damage = global.equippedItem.damage;//projectile damage is set to the damage of the equipped item
}