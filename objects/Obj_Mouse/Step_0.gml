x = mouse_x;
y = mouse_y;

if(mouse_check_button(mb_left)) {
	if(held_item != noone) {
		
		update_target_angle();
		
		drag_held_item();
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
	Obj_Button.hover = false;
	
	//Check if mouse within bounds
	if( position_meeting(mouse_x,mouse_y,item) ) {
		
		//check if we're touching a button
		for (var ib = 0; ib < ds_list_size(item.buttons); ++ib) {
			var button = item.buttons[| ib];
			var bx = item.x + button.x;
			var by = item.y + button.y;
			
			if( point_in_rectangle(mouse_x,mouse_y,bx,by,bx+button.sprite_width,by+button.sprite_height) ){
				button.hover = true;
				break;
			}
		}
		
		break;
	}
}

prev_x = x;
prev_y = y;