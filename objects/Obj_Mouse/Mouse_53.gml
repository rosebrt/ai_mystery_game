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
	if(clicked_button == noone)
		pickup_item(clicked_item);
}
