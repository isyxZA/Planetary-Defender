if global.canClick == true {
    if position_meeting(mouse_x, mouse_y, self) 
	{
		if playTouch == true 
		{ 
			playTouch = false; 
			//audio_play_sound(snd_Checkbox, 1, false);
		}
		
		c1 = make_colour_rgb(240,248,255);
		//c1 = make_colour_rgb(240,248,255);
		
		highlight = true;
		
        if mouse_check_button_pressed(mb_left) 
		{
			//audio_play_sound(snd_Accept, 1, false);
            switch txt {
                case "Singleplayer":
					global.netStatus = "DISCONNECTED";
                    //global.canClick = false;
					room_goto(rmGame);
                    break;
				case "Multiplayer":
					with oButton { instance_destroy(); }
					SetUI(buttonoverlay.multiplayer);
                    //global.canClick = false;
                    break;
				case "Host Game":
					with oButton { instance_destroy(); }
					global.serverIP   = undefined;
					global.serverPort = 50000;
					global.serverName = "";
					instance_create_layer(0, 0, "UIControl", oServer);
					SetUI(buttonoverlay.hostgame);
                    break;
				case "Create Game":
					//Create server
					if (global.serverIP != undefined) && (global.serverName != "") && (global.server < 0) 
					{
						global.server = network_create_server(network_socket_tcp, global.serverPort, 2);
					}
					if global.server >= 0 {
						global.netStatus = "HOST";
	                    //global.canClick = false;
						room_goto(rmLobby);
					}
					else
					{
						show_debug_message("Couldn't create server!");
					}
					break;
				case "Find Game":
					with oButton { instance_destroy(); }
					global.serverIP   = undefined;
					global.serverPort = undefined;
					global.serverName = undefined;
					instance_create_layer(0, 0, "Buttons", oServerJoin);
					SetUI(buttonoverlay.findgame);
					break;
				case "Join Game":
					if (global.serverIP != undefined) && (global.serverPort != undefined) && (global.serverName != undefined)
					{
						//Sets the types of connection socket.
						global.clientSocket = network_create_socket(network_socket_tcp);
						//Checks whether the client is currently connected.
						global.clientConnected = network_connect(global.clientSocket, global.serverIP, global.serverPort);
					}
					if global.clientConnected >= 0 
					{
						if instance_exists(oServerJoin) { with oServerJoin { instance_destroy(); } }
						network_destroy(global.broadcast_server);
						global.broadcast_server = -1;
						global.netStatus = "CLIENT";
						global.canClick = false;
						instance_create_layer(0, 0, "UIControl", oClient);
						room_goto(rmLobby);
					}
					else
					{
						show_debug_message("Couldn't join a game!");
					}
                    break;
				case "Refresh":
					if instance_exists(oServerJoin) 
					{
						with oServerJoin 
						{
							ds_list_clear(server_list);
							ds_list_clear(server_ports);
							ds_list_clear(server_names);
						}
						global.serverIP   = undefined;
						global.serverPort = undefined;
						global.serverName = undefined;
					}
                    break;
                case "Main Menu":
                    global.canClick = false;
                    break;
                case "Resume":
                    global.canClick = false;
                    break;
                case "Ready":
					if global.netStatus == "HOST" 
					{
						if global.greenLight
						{
							global.canClick = false;
							//Send game start signal to client
							var cc = ds_list_size(global.clients);
							if cc > 0 
							{ 
								var i;
								for (i=0;i<cc;i++) 
								{
									//Tell clients to start the game
									var csocket = ds_list_find_value(global.clients, i);
									WriteClient(csocket, 
										buffer_u8, NET_STARTGAME
									);
								}
							}
						}
						else
						{
							show_debug_message("Waiting for players!");
						}
					}
					else if global.netStatus == "CLIENT" 
					{
						global.greenLight = true;
						//Send green light signal to host
						WriteServer(
							buffer_u8, NET_GREENLIGHT,
							buffer_bool, global.greenLight
						);
						global.canClick = false;
					}
                    break;
                case "Back":
					with oButton { instance_destroy(); }
					switch activeOverlay
					{
						case "MULTIPLAYER":
							SetUI(buttonoverlay.main);
							break;
						case "HOST":
							if instance_exists(oServer) { with oServer { instance_destroy(); } }
							SetUI(buttonoverlay.multiplayer);
							break;
						case "CLIENT":
							if instance_exists(oServerJoin) { with oServerJoin { instance_destroy(); } }
							SetUI(buttonoverlay.multiplayer);
							break;
						case "LOBBY":
							global.greenLight = false;
							if global.netStatus == "HOST"
							{
								if instance_exists(oServer) { with oServer { instance_destroy(); } }
							}
							if global.netStatus == "CLIENT"
							{
								if instance_exists(oClient) { with oClient { instance_destroy(); } }
							}
							SetUI(buttonoverlay.main);
							break;
					}
                    break;
                case "Exit":
                    global.canClick = false;
                    audio_stop_all();
                    game_end();
                    break;
            }
        }
    }
    else 
	{ 
		highlight = false;
		playTouch = true;
		c1 = c_silver;
    }
}
else 
{
	//Switch text colour when button is selected
}