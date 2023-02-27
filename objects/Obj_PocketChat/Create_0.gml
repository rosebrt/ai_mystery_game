event_inherited();

powered = false;
font = Fnt_Small;
text_color = SCREENGREEN;
screen_surface = surface_create(128, 128);


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

sym_a = 0;
func_a = function () { };
sym_b = 0;
func_b = function () { };
sym_c = 0;
func_c = function () { };
sym_d = 0;
func_d = function () { };

draw_screen = function() { };

// create softkey buttons
function create_pc_button(_i) {
var b = instance_create_depth(9 + (20*_i),108,0,Obj_Button);
	b.sprite_index = Spr_PCButtons;
	b.parent_item = id;
	switch(_i) {
		default:
		case 0:	b.on_click = method(b, function() {parent_item.func_a() }); break;
		case 1:	b.on_click = method(b, function() {parent_item.func_b() }); break;
		case 2:	b.on_click = method(b, function() {parent_item.func_c() }); break;
		case 3:	b.on_click = method(b, function() {parent_item.func_d() }); break;
	}
	ds_list_add(buttons, b);
}
for(var i=0;i<4;i++) create_pc_button(i);
	
// PROGRAM SCREENS HERE vvvvvvvvvvvvvvvvvvv
function goto_screen(_screen) {
	previous_screen = current_screen;
	current_screen = _screen;
	switch(current_screen) {
		default:
		case screens.home:
			draw_screen = function() {
				draw_set_font(font);
				draw_set_color(text_color);
				draw_text(10,10,"Home");
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
				draw_text(10,10,"Forum");
				draw_sprite_stretched(Spr_PCUIBox,0,10,20,50,10);
				draw_sprite_stretched(Spr_PCUIBox,0,10,35,50,10);
				draw_sprite_stretched(Spr_PCUIBox,0,10,50,50,10);
				draw_sprite_stretched(Spr_PCUIBox,0,10,65,50,10);
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
				draw_text(10,10,"Settings");
				draw_sprite_stretched(Spr_PCUIBox,0,20,20,50,50);
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
	
goto_screen(screens.home);

