draw_set_font(fnt12);
draw_set_halign(fa_left);
draw_text(4, 16, string(global.serverName));
draw_text(4, 32, string(global.serverIP));
draw_text(4, 48, string(global.serverPort));

if count > 0 
{
	var i;
	var slen = ds_list_size(server_list);
	for (i=0;i<slen;i++) 
	{
		var sval = ds_list_find_value(server_list , i);
		var pval = ds_list_find_value(server_ports, i);
		var nval = ds_list_find_value(server_names, i);
		draw_set_valign(fa_top);
		if selected == i { draw_set_color(c_orange); }
			else if picked == i { draw_set_color(c_green); } 
				else { draw_set_colour(c_white); }
		draw_set_halign(fa_left);
		draw_text(xx1, yy1+(i*v_sep), string(sval));
		draw_set_halign(fa_center);
		draw_text(xx0, yy1+(i*v_sep), string(pval));
		draw_set_halign(fa_right);
		draw_text(xx2, yy1+(i*v_sep), string(nval));
	}
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
}
else 
{
	draw_set_halign(fa_center);
	draw_text(xx0, yy0, "No servers found. Select 'Host Game' to create a server.");
	draw_set_font(fnt12);
}

//draw_text(mouse_x, mouse_y, string(picked));