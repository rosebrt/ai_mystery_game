if(mouse_check_button(mb_left)){
	if(held_item != noone) {
		held_item.x = mouse_x - off_x;
		held_item.y = mouse_y - off_y;
	}
} else {
	held_item = noone;
}