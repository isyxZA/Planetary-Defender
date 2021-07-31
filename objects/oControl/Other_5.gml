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
			break;
		case "COOP":
			break;
		case "CLIENT":
			break;
		case "HOST":
			break;
	}
}