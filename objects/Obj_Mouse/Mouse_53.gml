//TODO GUI items

var clicked_item = get_hovered_item();
if( clicked_item != noone ) {

	var clicked_button = noone;
	//check if we're touching a button
	for (var ib = 0; ib < ds_list_size(clicked_item.buttons); ++ib) {
		var button = clicked_item.buttons[| ib];
		var bx = clicked_item.x + button.x;
		var by = clicked_item.y + button.y;
			
		if( point_in_rectangle(mouse_x,mouse_y,bx,by,bx+button.sprite_width,by+button.sprite_height) ){
			clicked_button = button;
			button.on_click();
			break;
		}
	}
		
	// clicked on item, but not on a button;
	if(clicked_button == noone) { 
		//reset it's rotation
		//off_x = x_rel_rotated(mouse_x-clicked_item.x,mouse_y-clicked_item.y,clicked_item.image_angle*-1);
		//off_y = y_rel_rotated(mouse_x-clicked_item.x,mouse_y-clicked_item.y,clicked_item.image_angle*-1);
		
		off_x = mouse_x - clicked_item.x; 
		off_y = mouse_y - clicked_item.y;
		rotate_sprite_offset(clicked_item,off_x,off_y,-1*clicked_item.image_angle)
		//set the offset positions again after rotation so that the dragging works properly,
		//as the above function changes the item's postition
		off_x = mouse_x - clicked_item.x; 
		off_y = mouse_y - clicked_item.y;
			
		//move it to front
		global.desk.move_item_to_front(clicked_item);
		
		//drag it
		held_item = clicked_item;
		
		//if it has any input connections, move them to front too
		for (var is = 0; is < ds_list_size(clicked_item.in_snaps); ++is) {
			var s = clicked_item.in_snaps[| is];
			if(s.connection != noone) {
				global.desk.move_a_above_b(s.connection.parent_item,clicked_item);
				for (var i = 0; i < ds_list_size(clicked_item.buttons); ++i)
					clicked_item.buttons[| i].depth = clicked_item.depth-1;
			}
		}
			
		//if its output was connected, unsnap it
		if( held_item.out_snap != noone )
			held_item.out_snap.un_snap();

	}
}
