items = ds_list_create();

//TEMP: add any alreay created items to list
for (var i = 0; i < instance_number(Obj_DeskItem); ++i) {
    ds_list_add(items,instance_find(Obj_DeskItem,i));
}

function move_item_to_front(_item) {
	var i = ds_list_find_index(items, _item);
	ds_list_delete(items,i);
	ds_list_insert(items,0,_item);
}

function move_a_above_b(_item_a, _item_b) {
	var ia = ds_list_find_index(items, _item_a);
	ds_list_delete(items,ia);
	
	var ib = ds_list_find_index(items, _item_b);
	ds_list_insert(items,ib,_item_a);
}