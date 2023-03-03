held_item = noone;

held_target_angle = 90;

off_x = 0;
off_y = 0;
x = mouse_x;
y = mouse_y;
prev_x = x;
prev_y = y;

function get_hovered_item() {
	//Loop through all deskitems
	var num_items = ds_list_size(global.desk.items);
	for (var ii = 0; ii < num_items; ++ii) {
	    var item = global.desk.items[| ii];
	
		//Check if mouse within bounds
		if( position_meeting(mouse_x,mouse_y,item) )
			return item;
	}
	
	return noone;
}

function pickup_item(_item) {
		// Get initial offset to rotate
		off_x = mouse_x - _item.x; 
		off_y = mouse_y - _item.y;
		// Reset rotation
		rotate_sprite_offset(_item,off_x,off_y,-1*_item.image_angle)
		// Set the offset positions again after rotation so that the dragging works properly,
		// since the above function changes the item's postition
		off_x = mouse_x - _item.x; 
		off_y = mouse_y - _item.y;
		
		// Setup the dragging target angle
		switch (_item.drag_mode) {
			case drag_modes.leaning:
				held_target_angle = 0;
				break;
			case drag_modes.directional:
				held_target_angle = 90;
				break;
			default:
			case drag_modes.still:
				held_target_angle = 0;
				break;
		}
			
		global.desk.move_item_to_front(_item);
		
		// If it has any input connections, move them to front too
		for (var is = 0; is < ds_list_size(_item.in_snaps); ++is) {
			var s = _item.in_snaps[| is];
			if(s.connection != noone) {
				global.desk.move_a_above_b(s.connection.parent_item,_item);
				for (var i = 0; i < ds_list_size(_item.buttons); ++i)
					_item.buttons[| i].depth = _item.depth-1;
			}
		}
			
		// If its output was connected, unsnap it
		if( _item.out_snap != noone )
			_item.out_snap.un_snap();
			
		held_item = _item;
}
	
function drag_held_item() {
	// Fix its rotation first
	rotate_sprite_offset(held_item,off_x,off_y,-1*held_item.image_angle)
	held_item.x = mouse_x - off_x;
	held_item.y = mouse_y - off_y;
		
	//if held item has connections, drag them
	for (var i = 0; i < ds_list_size(held_item.in_snaps); ++i) {
		var s = held_item.in_snaps[| i];
		s.x = held_item.x + s.x_rel;
		s.y = held_item.y + s.y_rel;
	
		//update any items whose nodes are snapped into my input snaps
		if(s.connection != noone) {
			var connected_item = s.connection.parent_item;
			connected_item.x = held_item.x + s.x_rel - s.connection.x_rel;
			connected_item.y = held_item.y + s.y_rel - s.connection.y_rel;
		}
	}
	rotate_sprite_offset(held_item,off_x,off_y,held_target_angle);
}
	
function update_target_angle() {
	switch (held_item.drag_mode) {
		case drag_modes.leaning:
			var new_target = 0;
			var x_vel = clamp(x-prev_x,-50,50);
			new_target -= x_vel;
			if( held_target_angle != new_target )
				held_target_angle += 0.2*(new_target-held_target_angle);
			break;
		case drag_modes.directional:
		
			break;
		default:
		case drag_modes.still:
		
			break;
		
		
	}
}