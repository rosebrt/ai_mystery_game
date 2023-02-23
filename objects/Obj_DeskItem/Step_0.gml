//Fix button depths
for (var i = 0; i < ds_list_size(buttons); ++i) {
    buttons[| i].depth = depth-1;
}


//Update snap nodes
if out_snap != noone {
	out_snap.x = x + out_snap.x_rel;
    out_snap.y = y + out_snap.y_rel;
}
for (var i = 0; i < ds_list_size(in_snaps); ++i) {
	var s = in_snaps[| i];
    s.x = x + s.x_rel;
    s.y = y + s.y_rel;
}