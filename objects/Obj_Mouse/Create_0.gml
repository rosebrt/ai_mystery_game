held_item = noone;

off_x = 0;
off_y = 0;

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