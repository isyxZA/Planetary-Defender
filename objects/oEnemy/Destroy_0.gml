if !global.gameOver
{
	if room == rmGame
	{
		if audio_system_is_available() && audio_sound_is_playable(sndExplosion)
		{
			audio_play_sound(sndExplosion, 0, false);
		}
	}
	else
	{
		oControl.alarm[6] = room_speed * 4;
	}
}
SpawnFlare(x, y, sFlare02, 1, 1, c_white);
--oControl.enemyCount;