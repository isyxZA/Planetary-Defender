/// @description GetDirection()
function GetDirection()
{
	if direction > 2 && direction <= 87         { dir = "NE"; }
	else if direction > 87  && direction <= 92  { dir = "N";  }
	else if direction > 92  && direction <= 177 { dir = "NW"; }
	else if direction > 177 && direction <= 182 { dir = "W";  }
	else if direction > 182 && direction <= 267 { dir = "SW"; }
	else if direction > 267 && direction <= 272 { dir = "S";  }
	else if direction > 272 && direction <= 357 { dir = "SE"; }
	else { dir = "E"; }
}

/// @description SetUI(overlay)
/// @param overlay
function SetUI(overlay)
{
	switch overlay
	{
		case buttonoverlay.main:
			SpawnButton(192, 192, "Singleplayer", "MAIN");
			SpawnButton(192, 320, "Multiplayer", "MAIN");
			SpawnButton(192, 448, "Exit", "MAIN");
			break;
		case buttonoverlay.multiplayer:
			SpawnButton(192, 192, "Host Game", "MULTIPLAYER");
			SpawnButton(192, 320, "Find Game", "MULTIPLAYER");
			SpawnButton(192, 448, "Back", "MULTIPLAYER");
			break;
		case buttonoverlay.hostgame:
			SpawnButton(192, 192, "Create Game", "HOST");
			SpawnButton(192, 448, "Back", "HOST");
			break;
		case buttonoverlay.findgame:
			SpawnButton(192, 192, "Join Game", "CLIENT");
			SpawnButton(192, 320, "Refresh", "CLIENT");
			SpawnButton(192, 448, "Back", "CLIENT");
			break;
		case buttonoverlay.lobby:
			SpawnButton(192, 192, "Ready", "LOBBY");
			SpawnButton(192, 448, "Back", "LOBBY");
			break;
		case buttonoverlay.gamesolo:
			//Create the UI surfaces
			uimidX = (display_get_gui_width() * 0.5);
			//Bottom Center Main Panel
			uiW_1a = 500;
			uiH_1a = 150;
			uiSurf_1a = surface_create(uiW_1a, uiH_1a);
            surface_set_target(uiSurf_1a);
            draw_clear(c_black);
            surface_reset_target();
			uiX_1a = (display_get_gui_width() * 0.5) - (uiW_1a * 0.5);
			uiY_1a =  display_get_gui_height() - uiH_1a;
			//Side Panel
			uiW_1b = 100;
			uiH_1b = 600;
			uiSurf_1b = surface_create(uiW_1b, uiH_1b);
            surface_set_target(uiSurf_1b);
            draw_clear(c_black);
            surface_reset_target();
			uiX_1b = 0;
			uiY_1b =  display_get_gui_height() * 0.05;
			uiH_1b = display_get_gui_height() - (uiY_1b * 2);
			break;
		case buttonoverlay.options:
			break;
	}
}

/// @description SpawnButton(xpos, ypos, text, hsize, vsize)
/// @param xpos
/// @param ypos
/// @param text
function SpawnButton(xpos, ypos, text, overlay)
{
	var btn = instance_create_layer(xpos, ypos, "Buttons", oButton);
	btn.txt = text;
	btn.activeOverlay = overlay;
}

/// @description SpawnBullet(type, xpos, ypos, color, angle, hforce, vforce, scale, damage, spawner)
/// @param xpos
/// @param ypos
/// @param color
/// @param angle
/// @param hforce
/// @param vforce
/// @param scale
/// @param damage
/// @param spawner
function SpawnBullet(xpos, ypos, color, angle, hforce, vforce, scale, damage, spawner)
{
	var blt = instance_create_layer(xpos, ypos, "Players", oBullet);
	blt.bColor = color;
	blt.rot    = angle;
	blt.xForce = hforce;
	blt.yForce = vforce;
	blt.xScale = scale;
	blt.yScale = scale;
	blt.damage = damage;
	blt.owner  = spawner;
	blt.phy_fixed_rotation = true;
}

/// @description SpawnLazer(xpos, ypos, color, spawner)
/// @param xpos
/// @param ypos
/// @param color
/// @param spawner
function SpawnLazer(xpos, ypos, color, spawner)
{
	var lzr = instance_create_layer(xpos, ypos, "Players", oLazer);
	lzr.bColor = color;
	lzr.owner  = spawner;
}

/// @description SpawnBomb(xpos, ypos, color, radius, spawner)
/// @param xpos
/// @param ypos
/// @param color
/// @param radius
/// @param spawner
function SpawnBomb(xpos, ypos, color, radius, spawner)
{
	var bmb = instance_create_layer(xpos, ypos, "Players", oBomb);
	bmb.bColor = color;
	bmb.bRadius = radius;
	bmb.owner  = spawner;
}

/// @description SpawnMissile(xpos, ypos, color, target, spawner)
/// @param xpos
/// @param ypos
/// @param color
/// @param target
/// @param spawner
function SpawnMissile(xpos, ypos, color, target, spawner)
{
	var msl = instance_create_layer(xpos, ypos, "Players", oMissile);
	msl.bColor = color;
	msl.target = target;
	msl.owner  = spawner;
}

/// @description Chance(percent) Returns true or false depending on RNG
/// @param percent
function Chance(percent)
{
	return percent > random(1);
}

//CAMERA\\
/// @description InitCamera()
function InitCamera(xpos, ypos, view_width, view_height)
{
	switch room
	{
		case rmMenu:
		case rmLobby:
			//For camera follow
			view_camera[view_current] = camera_create_view(xpos, ypos, view_width, view_height);
			break;
		case rmGame:
			//For camera follow
			view_camera[view_current] = camera_create_view(xpos - (view_width * 0.5), ypos - (view_height * 0.5), 
															view_width, view_height, 0, oPlayerONE, 5, 5, 1024, 1024);
			break;
	}
	

	//Assign the camera to the active view
	myCamera = view_camera[view_current];
	//Default for 16:9
	viewRatio = 1.777777777777778;
	//Start zoom level
	zoomLevel = 2;
	//Adjust zoom speed here
	zoomSpeed = 2;
	//Speed adjustment ratio
	zSpeedAdj = 0.025;
	//Set camera initial position and size
	targetWidth  = camera_get_view_width(myCamera);
	var start_view_x  = camera_get_view_x(myCamera);
	var start_view_y  = camera_get_view_y(myCamera);
	cam_x = start_view_x;
	cam_y = start_view_y;
	cam_w = targetWidth;
	cam_h = targetWidth/viewRatio;
}

//NETWORKING\\
#region
/// @description ServerConnections()
function ServerConnections() {
	//Gets the type of data that has been sent to the server.
	var dataType = ds_map_find_value(async_load,"type");

	//Checks the data if it complies with the cases.
	switch (dataType){
	
		case network_type_connect: //A new socket has connected to the server.
		#region Socket Connection
			//Gets the socket of the player.
			var socket = ds_map_find_value(async_load,"socket");
			//Adds the socket to the list of connected sockets.
			ds_list_add(global.clients,socket);
			//Data sent to client on connect
			WriteClient()(socket, buffer_u8,NET_CONNECT);
		#endregion
		break;
	
		case network_type_disconnect: //A socket has disconnected from the server.
		#region Socket Disconnect
			//Gets the socket of the player.
			var socket = ds_map_find_value(async_load,"socket");
			//Finds the position of the socket in the list.
			var socketPos = ds_list_find_index(global.clients,socket);
			//Deletes the socket for the connected list.
			ds_list_delete(global.clients,socketPos);
			//Action to take when client has disconnected
			
		#endregion
		break;
	
		case network_type_data: //Data has been sent to the server.
		#region Recieve Data
			//Reads the data that has been sent to the server.
			var data = ds_map_find_value(async_load,"buffer");
			//Gets the socket of the player that is sending the data.
			var socket = ds_map_find_value(async_load,"id");
			//Find the start of the data.
			buffer_seek(global.sbuffer,buffer_seek_start,0);
			//Passes information into a script to process the data.
			ServerEvents(data,socket);
		#endregion
		break;
	}
}

/// @description ClientConnections()
function ClientConnections() {

	//Gets the type of data that has been sent to the client
	var dataType = ds_map_find_value(async_load,"type");

	//Checks the data if it complies with the cases.
	switch (dataType){
	
		case network_type_data: //Data has been sent to the client from the server.
		#region Recieve Data
			//Reads the data that has been sent to the client.
			var data = ds_map_find_value(async_load,"buffer");
			//Find the start of the data.
			buffer_seek(global.cbuffer,buffer_seek_start,0);
			//Passes information into a script to process the data.
			ClientEvents(data);
		#endregion
		break;
	}
}

/// @description ServerEvents() 
function ServerEvents() 
{

	//Gets the data passed in by the connection data. (net_server_connections)
	var data   = argument[0];
	var socket = argument[1];

	//Reads which event id was sent by the client. (The first data sent from the client)
	var event = buffer_read(data,buffer_u8);

	//Checks which type of event has been requested.
	switch(event){
		case NET_CONNECT://Data recieved back from client on connect request
			break;
		case NET_PING: //Ping Request.
			//Reads the time sent from the client.
			var clientTime = buffer_read(data,buffer_u32);
			//Sends the time back to the player.
			WriteClient(socket,
				buffer_u8,NET_PING,
				buffer_u32,clientTime
			);
			break;
		case NET_GREENLIGHT: 
			var gl = buffer_read(data, buffer_bool);
			global.greenLight = gl;
			break;
		case NET_SHOOT:
			break;
		case NET_MOVE:
			//temp_xfinal = buffer_read(data,buffer_u16);
			//temp_yfinal = buffer_read(data,buffer_u16);
			break;

	}
}

/// @description ClientEvents()
function ClientEvents() 
{

	//Gets the data passed in by the connection data. (net_client_connections)
	var data = argument[0];

	//Reads which event id was sent by the server. (The first data sent from the server)
	var event = buffer_read(data,buffer_u8);

	//Checks which type of event has been requested.
	switch(event){
		case NET_CONNECT: //Get connect data from host
			break;
		case NET_PING: //Ping from host
			//Reads the time sent back from the host.
			var stime = buffer_read(data,buffer_u32);
			ping = current_time-stime;
			break;
		case NET_STARTGAME: 
			break;
		case NET_SHOOT:
			break;
		case NET_MOVE:
			//Transfer navigation waypoint
			//temp_xfinal = buffer_read(data,buffer_u16);
			//temp_yfinal = buffer_read(data,buffer_u16);
			break;
	}
}

/// @ description WriteClient()
/// @param socket the player socket to send the data
/// @param datatype the type of data being sent. (ex. buffer_u8)
/// @param data the data being sent that works with the data type.
/// @param ... ...
function WriteClient() 
{

	//Finds the start of the buffer.
	buffer_seek(global.sbuffer,buffer_seek_start,0);

	//Writes the given data to the buffer.
	var ac = argument_count;
	var a;
	for (a=1;a<ac;a+=2)
	{
		var ab = a+1;
		buffer_write(global.sbuffer,argument[a],argument[ab]);
	}

	//Sends the data to the client.
	network_send_packet(argument[0],global.sbuffer,buffer_tell(global.sbuffer));
}

/// @description WriteServer()
/// @param datatype the type of data being sent. (ex. buffer_u8)
/// @param data the data being sent that works with the data type.
/// @param ... ...
function WriteServer() 
{
	//Finds the start of the buffer.
	buffer_seek(global.cbuffer,buffer_seek_start,0);

	//Writes the given data to the buffer.
	var ac = argument_count;
	var a;
	for (a=0;a<ac;a+=2)
	{
		var ab = a+1;
		buffer_write(global.cbuffer,argument[a],argument[ab]);
	}

	//Sends the data to the server.
	network_send_packet(global.clientSocket,global.cbuffer,buffer_tell(global.cbuffer));
}

#endregion


//TEXT INPUT BOXES\\
#region

///@function InitInputBox(left,top,right,bottom,xOffset,yOffset,maxWidth,font,hidden,hiddenFont,hiddenSymbol,defaultText,startSelected,vBarInterval);
///@description Initialize the input box variables
///@param {real} left The x coordinate to start drawing the input box
///@param {real} top The y coordinate to start drawing the input box
///@param {real} right The x coordinate to finish drawing the input box
///@param {real} bottom The y coordinate to finish drawing the input box
///@param {real} xOffset The amount of pixels from left to start drawing the input text
///@param {real} yOffset The amount of pixels from top to start drawing the input text
///@param {real} maxWidth The max width in pixels the input text can be
///@param {id} font The font of the input text
///@param {bool} hidden Whether the input text is converted to the hiddensymbol
///@param {id} hiddenFont The font to use for the hidden text
///@param {string} hiddenSymbol The symbol to use for the hidden text (e.g. *)
///@param {string} defaultText The default text shown in the input box
///@param {bool} startSelected Whether the input box will take input as soon as its created or must be clicked first
///@param {real} vBarInterval The amount of steps/frames for the vbar to be shown/hidden (-1 to not show a vbar)
///Place in Create event
function InitInputBox(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11, argument12, argument13) 
{

	left = argument0;
	top = argument1;
	right = argument2;
	bottom = argument3;
	xOffset = argument4;
	yOffset = argument5;
	maxWidth = argument6;
	font = argument7;
	hidden = argument8;
	hiddenFont = argument9;
	hiddenSymbol = argument10;
	text = argument11;
	selected = argument12;
	vBarInterval = argument13;

	displayText = text;
	selectAll = false;
	
	if (vBarInterval > -1)
	{
		vBar = "|";
	}
	else
	{
		vBar = "";
	}

	//start selected
	if (selected == true)
	{
		keyboard_string = text;
		if (vBarInterval > -1)
		{alarm[0] = vBarInterval;}	
	}
}

///@function InputBoxRestrict(restrictedCharacter1,...,restrictedCharacterN);
///@description Stop the given characters from being entered in the input box
///@param restrictedCharacter1 The character (as a string) to stop from being entered in the input box
///@param [...,restrictedCharacterN] The character (as a string) to stop from being entered in the input box
///PLACE BEFORE scr_input_box_input in Step event
function InputBoxRestrict() 
{
	if selected
	{
		if (argument_count >= 1)
		{
			for (var _i=0; _i<argument_count; _i++)
			{
				keyboard_string = string_replace_all(keyboard_string,argument[_i],"");
			}
		}
	}
}

///@function InputBoxInput(allowedInput,allowCutCopy,allowPaste);
///@description Take input
///@param {real} allowedInput From 0 - 3 (0 = any characters, 1 = only letters, 2 = only digits, 3 = only letters and digits)
///@param {bool} allowCutCopy Allow Cut and Copy commands (Ctrl+X and Ctrl+C)
///@param {bool} allowPaste Allow Paste command (Ctrl+V)
///Place in Step event
function InputBoxInput(argument0, argument1, argument2) 
{
	if selected
	{
		//write over select all
		if selectAll
		{
			if keyboard_check_pressed(vk_backspace) || keyboard_check_pressed(vk_delete)
			{
				keyboard_string = "";
				selectAll = false;
			}
			else
			{
				//Ctrl+X - Cut (Windows only)
				if keyboard_check(vk_control) && keyboard_check_pressed(ord("X")) && os_type == os_windows && argument1 == true
				{
					clipboard_set_text(keyboard_string);
					keyboard_string = "";
					selectAll = false;
				}
				//Ctrl+C - Copy (Windows only)
				if keyboard_check(vk_control) && keyboard_check_pressed(ord("C")) && os_type == os_windows && argument1 == true
				{
					clipboard_set_text(keyboard_string);
				}
				//Write over select all
				if keyboard_check_pressed(vk_anykey)
				{
					switch argument0
					{
						case 0:
							var _valid = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890`~!@#$%^&*()-_=+[{]}\\|;:,<.>/?' \"";
							break;
						case 1:
							var _valid = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
							break;
						case 2:
							var _valid = "1234567890";
							break;
						case 3:
							var _valid = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
							break;
					}
					if string_pos(keyboard_lastchar,_valid) != 0
					{
						keyboard_string = keyboard_lastchar;
						selectAll = false;
					}
				}
			}
		}
	
		//select all
		if keyboard_check(vk_control) && keyboard_check_pressed(ord("A")) && string_length(keyboard_string) >= 1
		{
			selectAll = true;
		}
	
		//Ctrl+V - Paste (Windows only)
		if keyboard_check(vk_control) && keyboard_check_pressed(ord("V")) && os_type == os_windows && argument2 == true
		{
			if clipboard_has_text()
			{
				if selectAll
				{
					var _paste = clipboard_get_text();
					//limit paste
					if hidden
					{
						draw_set_font(hiddenFont);
						while string_width(string_repeat(hiddenSymbol,string_length(_paste))) > maxWidth
						{
							_paste = string_copy(_paste,1,string_length(_paste)-1);
						}
					}
					else
					{
						draw_set_font(font);
						while string_width(_paste) > maxWidth
						{
							_paste = string_copy(_paste,1,string_length(_paste)-1);
						}
					}
					//paste
					keyboard_string = _paste;
					selectAll = false;
				}
				else
				{
					var _paste = keyboard_string+clipboard_get_text();
					//limit paste
					if hidden
					{
						draw_set_font(hiddenFont);
						while string_width(string_repeat(hiddenSymbol,string_length(_paste))) > maxWidth
						{
							_paste = string_copy(_paste,1,string_length(_paste)-1);
						}
					}
					else
					{
						draw_set_font(font);
						while string_width(_paste) > maxWidth
						{
							_paste = string_copy(_paste,1,string_length(_paste)-1);
						}
					}
					//paste
					keyboard_string = _paste;
				}
				//remove carriage returns
				keyboard_string = string_replace_all(keyboard_string,chr($000D)+chr($000A),"");
			}
		}

		//limit input
		if hidden
		{
			draw_set_font(hiddenFont);
			if string_width(string_repeat(hiddenSymbol,string_length(keyboard_string))) > maxWidth
			{
				keyboard_string = string_copy(keyboard_string,1,string_length(keyboard_string)-1);
			}
		}
		else
		{
			draw_set_font(font);
			if string_width(keyboard_string) > maxWidth
			{
				keyboard_string = string_copy(keyboard_string,1,string_length(keyboard_string)-1);
			}
		}

		//take input
		switch argument0
		{
			case 0:
				text = keyboard_string;
				break;
			case 1:
				text = string_letters(keyboard_string);
				break;
			case 2:
				text = string_digits(keyboard_string);
				break;
			case 3:
				text = string_lettersdigits(keyboard_string);
				break;
		}
		keyboard_string = text;
	
		//hide text
		if hidden
		{
			displayText = string_repeat(hiddenSymbol,string_length(text));
		}
		else
		{
			displayText = text;
		}
	}
}

///@function InputBoxAlarm0();
///@description Show/hide vBar
function InputBoxAlarm0() 
{
	if (vBar == "|")
	{
		vBar = "";
	}
	else
	{
		vBar = "|";
	}
	alarm[0] = vBarInterval;
}

///@function InputBoxGLP();
///@description Set the input box to take or stop taking input with mouse click
function InputBoxGLP() 
{
	if (mouse_x >= left && mouse_y >= top && mouse_x <= right && mouse_y <= bottom)
	{
		if !selected
		{
			keyboard_string = text;
			selected = true;
			if vBarInterval > -1
			{
				vBar = "|";
				alarm[0] = vBarInterval;
			}
		}
		else if selectAll
		{
			selectAll = false;
		}
	}
	else if selected
	{
		InputBoxUnselect();
	}
}

///@function InputBoxUnselect();
///@description Set the input box to stop taking input
function InputBoxUnselect() 
{
	if selected
	{
		selected = false;
		selectAll = false;
		vBar = "";
		alarm[0] = -1;
	}
}

///@function InputBoxDraw(drawBox,drawBoxFill,boxSelectedColour,boxSelectedFillColour,boxUnselectedColour,boxUnselectedFillColour,textSelectedColour,textUnselectedColour,highlightColour,highlightHeight,hAlign);
///@description Draw the input box
///@param {bool} drawBox Whether to draw the input box border
///@param {bool} drawBoxFill Whether to draw the input box fill
///@param {real} boxSelectedColour The selected colour of the input box border
///@param {real} boxSelectedFillColour The selected colour to fill the input box
///@param {real} boxUnselectedColour The unselected colour of the input box border
///@param {real} boxUnselectedFillColour The unselected colour to fill the input box
///@param {real} textSelectedColour The selected colour of the input text
///@param {real} textUnselectedColour The unselected colour of the input text
///@param {real} highlightColour The colour of highlighting text
///@param {real} highlightHeight The height of the highlighting
///@param {real} hAlign The horizontal alignment of the text (0 = left, 1 = center, 2 = right)
function InputBoxDraw(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10) 
{
	var _drawBox = argument0;
	var _drawBoxFill = argument1;
	var _boxSelectedColour = argument2;
	var _boxSelectedFillColour = argument3;
	var _boxUnselectedColour = argument4;
	var _boxUnselectedFillColour = argument5;
	var _textSelectedColour = argument6;
	var _textUnselectedColour = argument7;
	var _highlightColour = argument8;
	var _highlightHeight = argument9;
	var _hAlign = argument10;

	if hidden
	{
		draw_set_font(hiddenFont);
	}
	else
	{
		draw_set_font(font);
	}

	if selected
	{
		if _drawBoxFill
		{
			draw_rectangle_colour(left,top,right,bottom,_boxSelectedFillColour,_boxSelectedFillColour,
									_boxSelectedFillColour,_boxSelectedFillColour,0);
		}

		if _drawBox
		{
			draw_rectangle_colour(left,top,right,bottom,_boxSelectedColour,_boxSelectedColour,
									_boxSelectedColour,_boxSelectedColour,1);
		}
	
		draw_set_colour(_textSelectedColour);
		switch (_hAlign)
		{
			case 0:
				if selectAll
				{
					draw_rectangle_colour(left+xOffset,top+yOffset,left+xOffset+string_width(displayText),top+yOffset+_highlightHeight,
											_highlightColour,_highlightColour,_highlightColour,_highlightColour,0);
				}
				draw_text(left+xOffset,top+yOffset,displayText+vBar);
				break;
			case 1:
				if selectAll
				{
					draw_rectangle_colour(((left+right)/2)-(string_width(displayText)/2),top+yOffset,((left+right)/2)+(string_width(displayText)/2),top+yOffset+_highlightHeight,
											_highlightColour,_highlightColour,_highlightColour,_highlightColour,0);
				}
				draw_set_halign(fa_center);
				draw_text((left+right)/2,top+yOffset,displayText);
				draw_text(((left+right)/2)+(string_width(displayText)/2)+2,top+yOffset,vBar);
				draw_set_halign(fa_left);
				break;
			case 2:
				if selectAll
				{
					draw_rectangle_colour(right-xOffset-string_width(displayText),top+yOffset,right-xOffset,top+yOffset+_highlightHeight,
											_highlightColour,_highlightColour,_highlightColour,_highlightColour,0);
				}
				draw_set_halign(fa_right);
				draw_text(right-xOffset,top+yOffset,displayText);
				draw_text(right,top+yOffset,vBar);
				draw_set_halign(fa_left);
			break;
		}
	}
	else
	{
		if _drawBoxFill
		{
			draw_rectangle_colour(left,top,right,bottom,_boxUnselectedFillColour,_boxUnselectedFillColour,
								_boxUnselectedFillColour,_boxUnselectedFillColour,0);
		}

		if _drawBox
		{
			draw_rectangle_colour(left,top,right,bottom,_boxUnselectedColour,_boxUnselectedColour,
									_boxUnselectedColour,_boxUnselectedColour,1);
		}
	
		draw_set_colour(_textUnselectedColour);
		switch _hAlign
		{
			case 0:
				draw_text(left+xOffset,top+yOffset,displayText);
				break;
			case 1:
				draw_set_halign(fa_center);
				draw_text((left+right)/2,top+yOffset,displayText);
				draw_set_halign(fa_left);
				break;
			case 2:
				draw_set_halign(fa_right);
				draw_text(right-xOffset,top+yOffset,displayText);
				draw_set_halign(fa_left);
				break;
		}
	}
}

#endregion