if global.canClick 
{
    if position_meeting(mouse_x, mouse_y, self) 
	{
		if playTouch
		{ 
			playTouch = false; 
			//audio_play_sound(snd_Checkbox, 1, false);
		}
		
		c1 = c_white;
		highlight = true;
		
        if mouse_check_button_pressed(mb_left) 
		{
			//audio_play_sound(snd_Accept, 1, false);
            switch txt 
			{
                case "Singleplayer":
					global.gameMode = "SOLO";
					with oButton { instance_destroy(); }
					global.canClick = false;
					oControl.alarm[2] = room_speed * 2;
					SetUI(buttonoverlay.sololobby);
                    break;
				case "Multiplayer":
					global.gameMode = "COOP";
					with oButton { instance_destroy(); }
					global.canClick = false;
					oControl.alarm[2] = room_speed * 2;
					SetUI(buttonoverlay.cooplobby);
                    break;
                case "Main Menu":
					with oButton { instance_destroy(); }
					room_goto(rmMenu);
                    break;
                case "Resume":
					with oButton { instance_destroy(); }
                    break;
                case "Back":
					with oButton { instance_destroy(); }
					global.canClick = false;
					oControl.alarm[2] = room_speed * 2;
					switch activeOverlay
					{
						case "LOBBY":
							with oButton    { instance_destroy(); }
							with oPlayerONE { instance_destroy(); }
							SetUI(buttonoverlay.main);
							break;
						case "LOBBYCOOP":
							with oButton    { instance_destroy(); }
							with oPlayerONE { instance_destroy(); }
							with oPlayerTWO { instance_destroy(); }
							SetUI(buttonoverlay.main);
							break;
					}
                    break;
				case "Options":
					with oButton { instance_destroy(); }
					SetUI(buttonoverlay.options);
					break;
				case "Ready":
					switch activeOverlay
					{
						case "LOBBY":
							if oControl.inputP1 == ""
							{
								show_debug_message("No Player Input Selected!");
							}
							else
							{
								with oButton    { instance_destroy(); }
								with oPlayerONE { instance_destroy(); }
								room_goto(rmGame);
							}
							break;
						case "LOBBYCOOP":
							if oControl.inputP1 == "" || oControl.inputP2 == ""
							{
								show_debug_message("No Player Input Selected!");
							}
							else
							{
								with oButton    { instance_destroy(); }
								with oPlayerONE { instance_destroy(); }
								with oPlayerTWO { instance_destroy(); }
								room_goto(rmGame);
							}
							break;
					}
					break;
				case "Restart":
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