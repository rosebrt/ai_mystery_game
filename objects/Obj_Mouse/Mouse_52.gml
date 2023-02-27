var mid_clicked_item = get_hovered_item();
if( mid_clicked_item != noone ) {
	global.desk.move_item_to_front(mid_clicked_item);
	off_x = mouse_x - mid_clicked_item.x;
	off_y = mouse_y - mid_clicked_item.y;
	rotate_sprite_offset(mid_clicked_item,off_x,off_y,5);
}