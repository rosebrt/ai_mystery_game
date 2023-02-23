event_inherited();

powered = false;

enum screens {
	startup,
	home,
	forum,
	thread,
	usb_view,
	settings
}
			
current_screen = screens.startup;
previous_screen = screens.home;
font = Fnt_Small;
text_color = SCREENGREEN;

sym_a = 0;
func_a = function () { };

sym_b = 0;
func_b = function () { };

sym_c = 0;
func_c = function () { };

sym_d = 0;
func_d = function () { };

function goto_screen(_screen) {
	previous_screen = current_screen;
	current_screen = _screen;
	switch(current_screen) {
		default:
		case screens.home:
			draw_screen = function() {
				draw_set_font(font);
				draw_set_color(text_color);
				draw_text(x+10,y+10,"Home");
			};
			sym_a = 3;
			func_a = function () { goto_screen(screens.forum) };
			sym_b = 4;
			func_b = function () { goto_screen(screens.settings) };
			sym_c = 0;
			func_c = function () { };
			sym_d = 0;
			func_d = function () { };
			break;
			
		case screens.forum:
			draw_screen = function() {
				draw_set_font(font);
				draw_set_color(text_color);
				draw_text(x+10,y+10,"Forum");
				draw_sprite_stretched(Spr_PCUIBox,0,x+10,y+20,50,10);
				draw_sprite_stretched(Spr_PCUIBox,0,x+10,y+35,50,10);
				draw_sprite_stretched(Spr_PCUIBox,0,x+10,y+50,50,10);
				draw_sprite_stretched(Spr_PCUIBox,0,x+10,y+65,50,10);
			};
			sym_a = 2;
			func_a = function () { goto_screen(previous_screen) };
			sym_b = 1;
			func_b = function () { goto_screen(screens.home) };
			sym_c = 4;
			func_c = function () { goto_screen(screens.settings) };
			sym_d = 0;
			func_d = function () { };
			break
		
		case screens.settings:
			draw_screen = function() {
				draw_set_font(font);
				draw_set_color(text_color);
				draw_text(x+10,y+10,"Settings");
				draw_sprite_stretched(Spr_PCUIBox,0,x+20,y+20,50,50);
			};
			sym_a = 2;
			func_a = function () { goto_screen(previous_screen) };
			sym_b = 1;
			func_b = function () { goto_screen(screens.home) };
			sym_c = 0;
			func_c = function () { };
			sym_d = 0;
			func_d = function () { };
			break
	}
}

draw_screen = function() {
	
}

var b = instance_create_depth(9,109,0,Obj_Button);
	b.sprite_index = Spr_PCButtons;
	b.parent_item = id;
	b.on_click = method(b, function() {parent_item.func_a() });
	b.text_color = #944747;
	ds_list_add(buttons, b);
	b = instance_create_depth(29,109,0,Obj_Button);
	b.sprite_index = Spr_PCButtons;
	b.parent_item = id;
	b.on_click = method(b, function() {parent_item.func_b() });
	b.text_color = #944747;
	ds_list_add(buttons, b);
	b = instance_create_depth(49,109,0,Obj_Button);
	b.sprite_index = Spr_PCButtons;
	b.parent_item = id;
	b.on_click = method(b, function() {parent_item.func_c() });
	b.text_color = #944747;
	ds_list_add(buttons, b);
	b = instance_create_depth(69,109,0,Obj_Button);
	b.sprite_index = Spr_PCButtons;
	b.parent_item = id;
	b.on_click = method(b, function() {parent_item.func_d() });
	b.text_color = #944747;
	ds_list_add(buttons, b);
	
goto_screen(screens.home);