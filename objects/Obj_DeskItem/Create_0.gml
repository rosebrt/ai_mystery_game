//physics stuff
xsp = random_range(-3,3);
ysp = random_range(-3,3);
asp = random_range(-3,3);
target_angle = 0;

drag_mode = drag_modes.leaning;

//button stuff
buttons = ds_list_create();

//snapping stuff
locks_after_snap = false;
out_snap = noone;
in_snaps = ds_list_create();

//method functions
function check_snap() { //called when item is dropped
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

function rotate_from_center(_angle) {
	rotate_sprite_offset(id,x_midpoint(),y_midpoint(),_angle);
}

//helpers/accessors
function is_held() {
	if(global.mouse.held_item != noone) {
		return (global.mouse.held_item == id)
	}
	return false;
}

function is_moving() {
	return(abs(xsp) > 0.01 || abs(ysp) > 0.01)
}

function is_snapped() {
	if( out_snap == noone )
		return false;
	
	return (out_snap.connection != noone);
}

function x_midpoint() {
	return sprite_width/2;
}

function y_midpoint() {
	return sprite_height/2;
}
