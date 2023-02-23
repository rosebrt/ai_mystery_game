event_inherited();

//draw_buttons
draw_sprite(Spr_PCUI,0,x+9, y+98);
draw_sprite(Spr_PCUI,0,x+29,y+98);
draw_sprite(Spr_PCUI,0,x+49,y+98);
draw_sprite(Spr_PCUI,0,x+69,y+98);

draw_sprite(Spr_PCSymbols,sym_a,x+11,y+100);
draw_sprite(Spr_PCSymbols,sym_b,x+31,y+100);
draw_sprite(Spr_PCSymbols,sym_c,x+51,y+100);
draw_sprite(Spr_PCSymbols,sym_d,x+71,y+100);

draw_screen();

draw_set_color(c_white);
