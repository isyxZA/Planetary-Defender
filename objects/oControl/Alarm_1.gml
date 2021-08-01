if audio_system_is_available()
{
	audio_play_sound(sndGameLoop, 10, false);
	alarm[1] = (room_speed * audio_sound_length(sndGameLoop)) + choose(100, 200, 300);
}
else
{
	alarm[1] = room_speed;
}