type = sn_type.in_node;
x_rel = 0;
y_rel = 0;
parent_item = noone;
dir = 0;
snap_id = "any";

connection = noone;

function snap_to_input(_input_snap) {
	if(_input_snap.connection != noone) {
		_input_snap.un_snap_move_old(5,5);
	}
	
	connection = _input_snap;
	connection.connection = id;
	x = connection.x;
	y = connection.y;
	
	parent_item.x = x - x_rel;
	parent_item.y = y - y_rel;
	
}

function un_snap() {
	if(connection != noone){
		connection.connection = noone;
		connection = noone;
	}
}

function un_snap_move_old(_x=0,_y=0) {
	if(connection != noone){
		
		var old = connection.parent_item;
		old.x += _x;
		old.y += _y;
		connection.x += _x;
		connection.y += _y;
		
		connection.connection = noone;
		connection = noone;
	}
}