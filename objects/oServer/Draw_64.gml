/// @description Connected Sockets.
draw_set_font(fnt12);
draw_set_color(c_white);
draw_set_halign(fa_left);

if global.serverName == "" { draw_text(4, 16, "Enter a server name."); }
else { draw_text(4, 16, string(global.serverName)); }

if global.serverIP == "" { draw_text(4, 32, "Choose a server type."); }
else { draw_text(4, 32, string(global.serverIP)); }

draw_text(4, 48, string(global.serverPort));


if room == rmLobby {
	if ds_list_size(global.clients) > 0 { draw_text(4, 64, "Player 2 connected."); }
	else { draw_text(4, 64, "Waiting for player...."); }
	
	if locked == true { draw_text(4, 80, "You are locked in."); }
	else { draw_text(4, 80, "Waiting for your lock..."); }
	
	if greenLight == true { draw_text(4, 96, "Player 2 locked in. Select 'Ready' to begin the game."); }
	else { draw_text(4, 96, "Waiting for Player 2 lock..."); }
}

draw_set_halign(fa_center);