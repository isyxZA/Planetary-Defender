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
if !browser_not_a_browser 
{
	if window_get_width() != browser_width
    {
		window_set_size(browser_width, browser_width/viewRatio);
    }
}
*/