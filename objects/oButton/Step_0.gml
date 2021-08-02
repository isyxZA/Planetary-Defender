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
					SetUI(buttonoverlay.sololobby);
                    //global.canClick = false;
					//room_goto(rmGame);
                    break;
				case "Multiplayer":
					global.gameMode = "COOP";
					with oButton { instance_destroy(); }
					SetUI(buttonoverlay.cooplobby);
                    //global.canClick = false;
                    break;
                case "Main Menu":
					with oButton { instance_destroy(); }
					room_goto(rmMenu);
                    //global.canClick = false;
                    break;
                case "Resume":
					with oButton { instance_destroy(); }
                    //global.canClick = false;
                    break;
                case "Back":
					with oButton { instance_destroy(); }
					switch activeOverlay
					{
						case "OPTIONS":
							SetUI(buttonoverlay.sololobby);
							break;
						case "OPTIONSCOOP":
							SetUI(buttonoverlay.cooplobby);
							break;
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
					with oButton { instance_destroy(); }
					room_goto(rmGame);
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