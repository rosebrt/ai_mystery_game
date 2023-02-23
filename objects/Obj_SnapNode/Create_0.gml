type = sn_type.in_node;
x_rel = 0;
y_rel = 0;
parent_item = noone;
dir = 0;
snap_id = "any";

connection = noone;

function snap_to_input(_input_snap) {
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