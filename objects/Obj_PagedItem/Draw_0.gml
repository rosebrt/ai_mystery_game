event_inherited();
draw_set_font(font);
draw_set_color(text_color);
draw_text_ext_transformed(x+x_rel_rotated(10,10,image_angle),y+y_rel_rotated(10,10,image_angle),pages[current_page],10,80,1,1,image_angle);
draw_set_color(c_white);