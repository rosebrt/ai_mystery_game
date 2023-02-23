//if holding item, drag it
if(mouse_check_button(mb_left)){
	if(held_item != noone) {
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
	}
} else {
	if(held_item != noone) {
		//drop the help item and check for interactions
		held_item.check_snap();
	}
	held_item = noone;
}

//set hover
var num_items = ds_list_size(global.desk.items);
for (var ii = 0; ii < num_items; ++ii) {
    var item = global.desk.items[| ii];

	//Check if mouse within bounds
	if( position_meeting(mouse_x,mouse_y,item) ) {
		
		//check if we're touching a button
		for (var ib = 0; ib < ds_list_size(item.buttons); ++ib) {
			var button = item.buttons[| ib];
			var bx = item.x + button.x;
			var by = item.y + button.y;
			
			if( point_in_rectangle(mouse_x,mouse_y,bx,by,bx+button.sprite_width,by+button.sprite_height) ){
				button.hover();
				break;
			}
		}
		
		break;
	}
}