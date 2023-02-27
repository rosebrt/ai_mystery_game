if( !is_held() ) {
	//Move with velocity
	xsp *= (1-global.fric);
	ysp *= (1-global.fric);
	asp *= (1-global.fric);
	
	x += xsp;
	y += ysp;
	rotate_from_center(asp);
} else {
	//Move smoothly
	if (image_angle != target_angle) {
		//rotate_sprite_offset(id,global.mouse.off_x,global.mouse.off_y, angle_difference(target_angle,image_angle)*0.1 );
		//global.mouse.off_x = mouse_x - x; 
		//global.mouse.off_y = mouse_y - y;
	}
}

//Fix button depths
for (var i = 0; i < ds_list_size(buttons); ++i) {
    buttons[| i].depth = depth-1;
}


//Update snap nodes
if out_snap != noone {
	out_snap.x = x + x_rel_rotated(out_snap.x_rel,out_snap.y_rel,image_angle);
    out_snap.y = y + y_rel_rotated(out_snap.x_rel,out_snap.y_rel,image_angle);
}
for (var i = 0; i < ds_list_size(in_snaps); ++i) {
	var s = in_snaps[| i];
    s.x = x + s.x_rel;
    s.y = y + s.y_rel;
}