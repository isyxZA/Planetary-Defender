if keyboard_check_pressed(ord("B"))
{
	if global.debug == false { global.debug = true; show_debug_overlay(true); } 
		else { global.debug = false; show_debug_overlay(false); }
}

if keyboard_check_pressed(vk_escape)
{
	game_end();
}