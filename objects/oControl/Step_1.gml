if playMusic
{
	playMusic = false;
	if audio_system_is_available() && audio_sound_is_playable(sndGameLoop)
	{
		audio_play_sound(sndGameLoop, 10, false);
		alarm[1] = timeMusic;
	}
	else 
	{
		alarm[1] = room_speed;
	}
}