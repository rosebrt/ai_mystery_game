//draw shadow if held
if(global.mouse.held_item != noone) {
	if(global.mouse.held_item == id)
		draw_sprite_ext(sprite_index,image_index,x+5,y+5,image_xscale,image_yscale,image_angle,c_black,0.4);
	
}
draw_self()