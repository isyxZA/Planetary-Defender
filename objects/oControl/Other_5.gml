//Stop Audio
audio_stop_all();
alarm[1] = -1;

//Destroy the camera
camera_destroy(myCamera);

if room == rmGame
{
	switch global.netStatus
	{
		case "DISCONNECTED":
			if surface_exists(uiSurf_1a) 
			{
	           surface_free(uiSurf_1a);
	        }
			if surface_exists(uiSurf_1b) 
			{
	           surface_free(uiSurf_1b);
	        }
			break;
		case "COOP":
			break;
		case "CLIENT":
			break;
		case "HOST":
			break;
	}
}