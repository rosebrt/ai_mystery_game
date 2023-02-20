if(!hidden) {
	if(hover)
		image_alpha = 1;
	else
		image_alpha = 0.7;
	
	draw_sprite_ext(sprite_index,image_index,parent_item.x+x,parent_item.y+y,1,1,0,image_blend,image_alpha);
}