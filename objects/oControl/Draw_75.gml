if room == rmGame
{
	switch global.netStatus
	{
		case "DISCONNECTED":
			if surface_exists(uiMainSurf) 
			{
	            draw_surface_stretched_ext(uiMainSurf, uiX, uiY, uiW, uiH, c_white, 1);
	        }
	        else 
			{
	            uiMainSurf = surface_create(uiW, uiH);
	            surface_set_target(uiMainSurf);
	            draw_clear(c_black);
	            surface_reset_target();
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