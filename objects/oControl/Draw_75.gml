if room == rmGame
{
	switch global.gameMode
	{
		case "SOLO":
			if surface_exists(uiSurf_1a) 
			{
	            draw_surface_stretched_ext(uiSurf_1a, uiX_1a, uiY_1a, uiW_1a, uiH_1a, c_white, 1);
	        }
			if surface_exists(uiSurf_1b) 
			{
	            draw_surface_stretched_ext(uiSurf_1b, uiX_1b, uiY_1b, uiW_1b, uiH_1b, c_white, 1);
	        }
			break;
		case "COOP":
			if surface_exists(uiSurf_1a) 
			{
	            draw_surface_stretched_ext(uiSurf_1a, uiX_1a, uiY_1a, uiW_1a * uiScale, uiH_1a * uiScale, c_white, 1);
	        }
			if surface_exists(uiSurf_1b) 
			{
	            draw_surface_stretched_ext(uiSurf_1b, uiX_1b, uiY_1b, uiW_1b * uiScale, uiH_1b * uiScale, c_white, 1);
	        }
			if surface_exists(uiSurf_2a) 
			{
	            draw_surface_stretched_ext(uiSurf_2a, uiX_2a, uiY_2a, uiW_2a * uiScale, uiH_2a * uiScale, c_white, 1);
	        }
			if surface_exists(uiSurf_2b) 
			{
	            draw_surface_stretched_ext(uiSurf_2b, uiX_2b, uiY_2b, uiW_2b * uiScale, uiH_2b * uiScale, c_white, 1);
	        }
			break;
	}
}

if doTransition
{
	draw_set_color(c_black);
	draw_rectangle(0, 0, room_width, room_height, false);
	draw_set_alpha(0.7);
	draw_set_color(c_orange);
	draw_rectangle(room_width-tCurX1, 145, room_width-tCurX2, 287, false);
	draw_rectangle(room_width-tCurX1, 433, room_width-tCurX2, 575, false);
	draw_set_color(c_white);
	draw_rectangle(tCurX1, 0, tCurX2, 144, false);
	draw_rectangle(tCurX1, 288, tCurX2, 432, false);
	draw_rectangle(tCurX1, 576, tCurX2, 720, false);
	draw_set_alpha(1);
}