//TODO GUI items

//Loop through all deskitems
var num_items = ds_list_size(global.desk.items);
for (var ii = 0; ii < num_items; ++ii) {
    var item = global.desk.items[| ii];

	//Check if mouse within bounds
	if( position_meeting(mouse_x,mouse_y,item) ) {
		var button_flag = false;
		
		//check if we're touching a button
		for (var ib = 0; ib < ds_list_size(item.buttons); ++ib) {
			var button = item.buttons[| ib];
			var bx = item.x + button.x;
			var by = item.y + button.y;
			
			if( point_in_rectangle(mouse_x,mouse_y,bx,by,bx+button.sprite_width,by+button.sprite_height) ){
				button_flag = true;
				button.on_click();
				break;
			}
		}
		
		// clicked on item, but not on a button;
		if(!button_flag) { 
			
			if(item.object_index == Obj_DarkLight)
				show_debug_message("bro?" + string( item.x ));
			
			//move it to front
			global.desk.move_item_to_front(item);
			//if it has any connections, move them to front
			for (var is = 0; is < ds_list_size(item.in_snaps); ++is) {
				var s = item.in_snaps[| is];
				if(s.connection != noone) {
					global.desk.move_a_above_b(s.connection.parent_item,item);
					for (var i = 0; i < ds_list_size(item.buttons); ++i) {
					    item.buttons[| i].depth = item.depth-1;
					}
				}
			}
			
			
			held_item = item;
			off_x = mouse_x - item.x;
			off_y = mouse_y - item.y;
			
			if( held_item.out_snap != noone )
				held_item.out_snap.un_snap();
			//grab it to drag it
			break;
		}
	}
}