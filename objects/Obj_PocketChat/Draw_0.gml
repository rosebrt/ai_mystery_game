event_inherited();

//draw to the screen surface
surface_set_target(screen_surface);
draw_clear_alpha(c_black, 0);

//draw_buttons
draw_sprite(Spr_PCUI,0,4, 93);
draw_sprite(Spr_PCUI,0,24,93);
draw_sprite(Spr_PCUI,0,44,93);
draw_sprite(Spr_PCUI,0,64,93);

draw_sprite(Spr_PCSymbols,sym_a,5, 95);
draw_sprite(Spr_PCSymbols,sym_b,25,95);
draw_sprite(Spr_PCSymbols,sym_c,45,95);
draw_sprite(Spr_PCSymbols,sym_d,65,95);

draw_screen();

//draw screen surface
surface_reset_target();
draw_surface_ext(screen_surface,x+x_rel_rotated(5,5,image_angle),y+y_rel_rotated(5,5,image_angle),1,1,image_angle,c_white,image_alpha);

draw_set_color(c_white);
