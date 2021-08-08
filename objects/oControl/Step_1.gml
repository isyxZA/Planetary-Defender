if playMusic
{
	playMusic = false;
	if room == rmGame
	{
		if audio_system_is_available() && audio_sound_is_playable(sndGameLoop)
		{
			audio_play_sound(sndGameLoop, 10, true);
			audio_sound_gain(sndGameLoop, 0, 0);
			audio_sound_gain(sndGameLoop, 1, 5000);
			//alarm[1] = timeMusic;
		}
		else 
		{
			alarm[1] = room_speed;
		}
	}
	else if room == rmMenu
	{
		if audio_system_is_available() && audio_sound_is_playable(sndMenuLoop)
		{
			audio_play_sound(sndMenuLoop, 10, true);
			audio_sound_gain(sndMenuLoop, 0, 0);
			audio_sound_gain(sndMenuLoop, 1, 5000);
			//alarm[1] = timeMusic;
		}
		else 
		{
			alarm[1] = room_speed;
		}
	}
}

/*
//Set window size according to browser width
//Adjust UI variables to match new GUI
//BREAKS WHEN WINDOW IS MAXIMIZED\\
if !browser_not_a_browser 
{
	if window_get_width() != browser_width
    {
		window_set_size(browser_width, browser_width/viewRatio);
		uiWidth  = display_get_gui_width();
		uiHeight = display_get_gui_height();
		if global.gameMode == "SOLO"
		{
			//Player 1 UI
			uictrXP1 = (uiWidth * 0.5);//UI X Center
			uiX_1a = (uiWidth * 0.5) - (uiW_1a * 0.5);
			uiY_1a =  uiHeight - uiH_1a;
			//Side Panel
			uiX_1b = 0;
			uiY_1b = uiHeight * 0.05;
			uiH_1b = uiHeight - (uiY_1b * 2);
		}
		else if global.gameMode == "COOP"
		{
			//Player 1 UI
			uictrXP1 = (uiWidth * 0.25);//UI X Center
			uiX_1a = (uiWidth * 0.25) - ((uiW_1a * uiScale) * 0.5);//X Origin
			uiY_1a =  uiHeight - (uiH_1a * uiScale);//Y Origin
			//Side Panel
			uiX_1b = 0;//X Origin
			uiY_1b = uiHeight * 0.05;//Y Origin
			uiH_1b = uiHeight - (uiY_1b * 2);//Adjust display height
			//Player 2 UI
			uictrXP2 = (uiWidth * 0.75);
			uiX_2a = (uiWidth * 0.75) - ((uiW_2a * uiScale) * 0.5);//X Origin
			uiY_2a = uiHeight - (uiH_2a * uiScale);//Y Origin
			//Side Panel
			uiX_2b = uiWidth - (uiW_2b * uiScale);//X Origin
			uiY_2b = uiHeight * 0.05;//Y Origin
			uiH_2b = uiHeight - (uiY_2b * 2);//Adjust display height
		}
    }
}
*/