shadow = 0.4
if( is_held() )
	shadow = 0.6;

if( !is_snapped() )
	draw_sprite_ext(sprite_index,image_index,x+4,y+6,image_xscale,image_yscale,image_angle,c_black,shadow);

draw_self()