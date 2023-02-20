//TODO GUI items

//Loop through all deskitems
var num_items = ds_list_size(global.desk.items);
for (var i = 0; i < num_items; ++i) {
    var item = global.desk.items[| i];

	//Check within bounds
	if( position_meeting(mouse_x,mouse_y,item) ) {
		var button_flag = false;
		
		//check if we're touching a button
		for (var i = 0; i < ds_list_size(item.buttons); ++i) {
			var button = item.buttons[| i];
			var bx = item.x + button.x;
			var by = item.y + button.y;
			
			if( point_in_rectangle(mouse_x,mouse_y,bx,by,bx+button.sprite_width,by+button.sprite_height) ){
				button_flag = true;
				button.on_click();
				break;
			}
		}
		
		if(!button_flag) {
			global.desk.move_item_to_front(item);
			held_item = item;
			off_x = mouse_x - item.x;
			off_y = mouse_y - item.y;
			//grab it to drag it
			break;
		}
	}
}