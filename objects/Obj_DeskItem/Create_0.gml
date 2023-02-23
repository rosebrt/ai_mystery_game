buttons = ds_list_create();

locks_after_snap = false;
out_snap = noone;
in_snaps = ds_list_create();

function check_snap() {
	if( out_snap == noone )
		return;
	
	var n = instance_nearest_except(out_snap.x,out_snap.y,Obj_SnapNode,out_snap);
	if(n != noone) {
		var dist = point_distance(out_snap.x, out_snap.y, n.x, n.y);
		if(dist < 10){
			out_snap.snap_to_input(n);
		}
	}
	
}