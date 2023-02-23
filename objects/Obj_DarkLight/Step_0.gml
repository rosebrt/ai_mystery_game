// Inherit the parent event
event_inherited();

if( in_snaps[| 0].connection != noone )
	image_index = 1;
else
	image_index = 0;