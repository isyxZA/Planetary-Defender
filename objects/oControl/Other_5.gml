camera_destroy(myCamera);

if room == rmGame
{
	switch global.netStatus
	{
		case "DISCONNECTED":
			if surface_exists(uiMainSurf) 
			{
	           surface_free(uiMainSurf);
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