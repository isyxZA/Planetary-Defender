/// @description  Detect clicking on server list
count = ds_list_size(server_list);
if count > 0 
{
	if (mouse_y>=yy1) && (mouse_y<(yy1+(count*v_sep))) 
	{
		if (mouse_x>xx1) && (mouse_x<xx2) 
		{
			picked = floor((mouse_y+yy1)/(v_sep)-4);
		}
		else 
		{ 
			picked = -1; 
		}
	}
	else 
	{ 
		picked = -1; 
	}
	if picked != -1 
	{
		if mouse_check_button_pressed(mb_left) 
		{
			global.serverIP   = ds_list_find_value(server_list , picked);
			global.serverPort = ds_list_find_value(server_ports, picked);
			global.serverName = ds_list_find_value(server_names, picked);
			selected = picked;
		}
	}
}
else 
{ 
	picked = -1; 
}
	

if global.canClick 
{
	canClick = true;
}
else 
{ 
	canClick = false; 
}