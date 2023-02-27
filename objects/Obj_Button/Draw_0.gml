if(!hidden) {
	if(hover)
		image_alpha = 1;
	else
		image_alpha = 0.7;
	
	image_angle = parent_item.image_angle;
	draw_sprite_ext(sprite_index,image_index,parent_item.x+x_rel_rotated(x,y,image_angle),parent_item.y+y_rel_rotated(x,y,image_angle),1,1,image_angle,image_blend,image_alpha);
}