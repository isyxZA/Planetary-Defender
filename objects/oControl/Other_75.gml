//show_debug_message("Event = " + async_load[? "event_type"]);        
//show_debug_message("Pad = " + string(async_load[? "pad_index"]));

switch(async_load[? "event_type"])             // Parse the async_load map to see which event has been triggered
{
case "gamepad discovered":                     // A game pad has been discovered
    var pad = async_load[? "pad_index"];       // Get the pad index value from the async_load map
    gamepad_set_axis_deadzone(pad, 0.1);       // Set the "deadzone" for the axis
    gamepad_set_button_threshold(pad, 0.1);    // Set the "threshold" for the triggers
	ds_list_add(global.controllers, pad);      // Store available contollers in a list
	if instance_exists(oPlayerONE)
	{ 
		oPlayerONE.alarm[10] = 1;
	}
	if ds_list_size(global.controllers) > 1
	{
		if instance_exists(oPlayerTWO)
		{ 
			oPlayerTWO.alarm[10] = 1;
		}
	}
	break;
case "gamepad lost":                           // Gamepad has been removed or otherwise disabled
    var pad = async_load[? "pad_index"];       // Get the pad index
	ds_list_delete(global.controllers, ds_list_find_index(global.controllers, pad));
	if instance_exists(oPlayerONE) && oPlayerONE.gamePad == pad
	{ 
		oPlayerONE.gamePad = -1;
		oPlayerONE.playerInput = "KEYBOARD";
	}
	if instance_exists(oPlayerTWO) && oPlayerTWO.gamePad == pad
	{ 
		oPlayerTWO.gamePad = -1;
		oPlayerTWO.playerInput = "KEYBOARD";
	}
    break;
}