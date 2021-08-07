//Stop Audio
audio_stop_all();
alarm[1] = -1;
if os_browser != browser_not_a_browser { ds_list_clear(global.controllers); }

//Destroy the camera
camera_destroy(myCamera);
myCamera = -1;

if room == rmGame
{
	playerTracking = false;
	switch global.gameMode
	{
		case "SOLO":
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
			if surface_exists(uiSurf_1a) 
			{
	           surface_free(uiSurf_1a);
	        }
			if surface_exists(uiSurf_1b) 
			{
	           surface_free(uiSurf_1b);
	        }
			if surface_exists(uiSurf_2a) 
			{
	           surface_free(uiSurf_2a);
	        }
			if surface_exists(uiSurf_2b) 
			{
	           surface_free(uiSurf_2b);
	        }
			break;
	}
}