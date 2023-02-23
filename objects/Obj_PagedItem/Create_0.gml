event_inherited();
pages = [	"This is a test page for reading and such. Lots of info to read and such. Big long wooooooords, n lso shrt wrds.",
			"This is the second page! Click the arrows to change pages.",
			"Page three isn't as exciting, sorry :/"];
			
current_page = 0;
font = Fnt_Serif1;
text_color = #222222;

var b = instance_create_depth(85,110,0,Obj_Button);
	b.image_index = 2;
	b.image_blend = #944747;
	b.parent_item = id;
	b.on_click = method(b, function() {
			if(parent_item.current_page < (array_length(parent_item.pages)-1))
				parent_item.current_page++; });
	ds_list_add(buttons, b);
	
b = instance_create_depth(5,110,0,Obj_Button);
	b.image_index = 3;
	b.image_blend = #944747;
	b.parent_item = id;
	b.on_click = method(b, function() {
			if(parent_item.current_page > 0)
				parent_item.current_page--; });
	ds_list_add(buttons, b);