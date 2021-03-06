if room == rmGame
{
	switch global.gameMode
	{
		case "SOLO":
			if surface_exists(uiSurf_1a) 
			{
				//MAIN PANEL\\
	            surface_set_target(uiSurf_1a);
				//var cw = gpu_get_colorwriteenable();
				//cw[3] = false;
				//gpu_set_colorwriteenable(cw);
	            draw_clear_alpha(c_black, 0);
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				draw_set_font(fnt12);
				//Turret && Missile Bar
				draw_sprite_ext(sButton, 0, 0, 75, 0.25, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sButton, 0, 0, 113, 0.25, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sUI, 0, 0, 75, 0.5, 1.5, 0, uiColor, 1);
				//Lazer && Mines Bar
				draw_sprite_ext(sButton, 0, 450, 75, 0.25, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sButton, 0, 450, 113, 0.25, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sUI, 0, 450, 75, 0.5, 1.5, 0, uiColor, 1);
				//Boost Bar
				draw_sprite_ext(sButton, 0, 50, 50, 0.25, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sUI, 0, 50, 50, 0.5, 1.5, 0, uiColor, 1);
				//AOE Burst
				draw_sprite_ext(sButton, 0, 400, 50, 0.25, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sUI, 0, 400, 50, 0.5, 1.5, 0, uiColor, 1);
				//Hull Health
				draw_sprite_ext(sButton, 0, 100, 25, 0.25, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sUI, 0, 100, 25, 0.5, 1.5, 0, uiColor, 1);
				//Shield Level
				draw_sprite_ext(sButton, 0, 350, 25, 0.25, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sUI, 0, 350, 25, 0.5, 1.5, 0, uiColor, 1);
				//Commmunications Panel
				if global.gameOver
				{
					draw_sprite_ext(sUI, 0, 150, 0, 2, 1.5, 0, uiColor, 1);
					draw_sprite_ext(sUI, 0, 150, 0, 2, 1.5, 0, c_red, 0.7);
					draw_text(250 - 1, 75 + 1, "SYSTEMS OFFLINE");
					draw_set_color(c_fuelyellow);
					draw_text(250, 75, "SYSTEMS OFFLINE");
					//draw_set_color(c_white);
				}
				else if enemyWaveAlert 
				{
					draw_sprite_ext(sUI, 0, 150, 0, 2, 1.5, 0, uiColor, 1);
					draw_sprite_ext(sUI, 0, 150, 0, 2, 1.5, 0, aColor, 0.7);
					var lsep = 3;
					for (var i = 0; i < 49; ++i)
					{
						var lw;
						if Chance(0.02) { draw_set_alpha(1); draw_set_color(c_red); lw = 2; }
						else { draw_set_alpha(0.7); draw_set_color(c_dkgray); lw = 1; }
						draw_line_width(155, 3 + (i * lsep), 344, 3 + (i * lsep), lw);
					}
					draw_set_alpha(1);
					draw_text(250 - 1, 75 + 1, enemyWaveText);
					draw_set_color(c_fuelyellow);
					draw_text(250, 75, enemyWaveText);
					//draw_set_color(c_white);
				}
				else
				{
					draw_sprite_ext(sUI, 0, 150, 0, 2, 1.5, 0, uiColor, 1);
					var lsep = 3;
					for (var i = 0; i < 49; ++i)
					{
						var lw;
						if Chance(0.01) { draw_set_alpha(1); draw_set_color(c_steelblue); lw = 2; }
						else { draw_set_alpha(0.7); draw_set_color(c_dkgray); lw = 1; }
						draw_line_width(155, 3 + (i * lsep), 344, 3 + (i * lsep), lw);
					}
					draw_set_alpha(1);
					draw_set_color(c_fuelyellow);
					draw_text(250, 38, "Planet Status");
					draw_text(250, 77, "Enemy Level");
					draw_text(250, 116, "UFO Control");
					draw_set_color(c_ashgray);
					draw_text(250, 16, "-- CONSOLE --");
					draw_text(250, 56, string(oPlanet.pHealth));
					draw_text(250, 95, string(levelLevel));
					draw_text(250, 134, string(inputP1));
					//draw_set_color(c_white);
				}
				draw_set_color(c_ashgray);
				draw_text(125, 38, "Hull");
				draw_text(375, 38, "Shield");
				draw_text(425, 62, "Burst");
				draw_text(75, 62, "Boost");
				draw_text(475, 87, "Lazer");
				draw_text(475, 125, "Mines");
				draw_text(25, 87, "Turret");
				draw_text(25, 125, "Missile");
				
				draw_set_color(c_white);
				draw_set_alpha(0.7);
				draw_healthbar(452, 112, 497, 99 , lBarP1 , c_black, c_black, c_ashgray, 0, false, false);
				draw_healthbar(452, 149, 497, 137, mmBarP1, c_black, c_black, c_ashgray, 0, false, false);
				draw_healthbar(2  , 112, 47 , 99 , tBarP1 , c_black, c_black, c_ashgray, 1, false, false);
				draw_healthbar(2  , 149, 47 , 137, mBarP1 , c_black, c_black, c_ashgray, 1, false, false);
				draw_healthbar(402, 149, 447, 74 , bbBarP1, c_black, c_black, c_ashgray, 2, false, false);
				draw_healthbar(52 , 149, 97 , 74 , bBarP1 , c_black, c_black, c_ashgray, 2, false, false);
				draw_healthbar(102, 149, 147, 49 , hBarP1 , c_black, c_black, c_steelblue, 2, false, false);
				draw_healthbar(352, 149, 397, 49 , sBarP1 , c_black, c_black, c_steelblue, 2, false, false);
				draw_set_alpha(1);
				
				surface_reset_target();
				//cw[3] = true;
				//gpu_set_colorwriteenable(cw);
			}
			else
			{
				uiSurf_1a = surface_create(uiW_1a, uiH_1a);
	            surface_set_target(uiSurf_1a);
	            draw_clear(c_black);
	            surface_reset_target();
			}
			if surface_exists(uiSurf_1b) 
			{
				//SIDE PANEL\\
				surface_set_target(uiSurf_1b);
	            draw_clear_alpha(c_black, 0);
				draw_sprite_ext(sUI, 0, 0, 0, 1, 6, 0, uiColor, 1);
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				draw_set_font(fnt12);
				//Boost Bar
				var vsep1 = 60;
				var vsep1a = 12;
				var vsep1b = 13;

				draw_sprite_ext(sButton, 0, 0, 0, 0.5, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sButton, 0, 0, vsep1, 0.5, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sButton, 0, 0, vsep1 * 2, 0.5, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sButton, 0, 0, vsep1 * 3, 0.5, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sButton, 0, 0, vsep1 * 4, 0.5, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sButton, 0, 0, vsep1 * 5, 0.5, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sButton, 0, 0, vsep1 * 6, 0.5, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sButton, 0, 0, vsep1 * 7, 0.5, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sButton, 0, 0, vsep1 * 8, 0.5, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sButton, 0, 0, vsep1 * 9, 0.5, 0.35, 0, uiColor, 1);
				
				/*
				draw_set_color(c_white);
				draw_text(50 - 1, vsep1b, "Primary");
				draw_text(50 - 1, vsep1 + vsep1b, "Secondary");
				draw_text(50 - 1, (vsep1 * 2) + vsep1b, "Speed");
				draw_text(50 - 1, (vsep1 * 3) + vsep1b, "Boost");
				draw_text(50 - 1, (vsep1 * 4) + vsep1b, "Shield");
				draw_text(50 - 1, (vsep1 * 5) + vsep1b, "Burst");
				draw_text(50 - 1, (vsep1 * 6) + vsep1b, "Missiles");
				draw_text(50 - 1, (vsep1 * 7) + vsep1b, "Lazer");
				draw_text(50 - 1, (vsep1 * 8) + vsep1b, "Turret");
				draw_text(50 - 1, (vsep1 * 9) + vsep1b, "Mines");
				*/
				
				draw_set_color(c_aqua);
				draw_text(50, vsep1a, "Primary");
				draw_set_color(c_blue);
				draw_text(50, vsep1 + vsep1a, "Secondary");
				draw_set_color(c_fuchsia);
				draw_text(50, (vsep1 * 2) + vsep1a, "Speed");
				draw_set_color(c_green);
				draw_text(50, (vsep1 * 3) + vsep1a, "Boost");
				draw_set_color(c_maroon);
				draw_text(50, (vsep1 * 4) + vsep1a, "Shield");
				draw_set_color(c_orange);
				draw_text(50, (vsep1 * 5) + vsep1a, "Burst");
				draw_set_color(c_purple);
				draw_text(50, (vsep1 * 6) + vsep1a, "Missiles");
				draw_set_color(c_silver);
				draw_text(50, (vsep1 * 7) + vsep1a, "Lazer");
				draw_set_color(c_teal);
				draw_text(50, (vsep1 * 8) + vsep1a, "Turret");
				draw_set_color(c_yellow);
				draw_text(50, (vsep1 * 9) + vsep1a, "Mines");
				
				draw_set_color(c_ashgray);
				draw_set_halign(fa_left);
				draw_set_font(fnt10);
				draw_text(8, vsep1a * 3, "Fire Rate: " + string(pRateP1));
				draw_text(8, vsep1a * 4, "Damage: " + string(pDamageP1));
				draw_text(8, vsep1 + (vsep1a * 3), "Fire Rate: " + string(sRateP1));
				draw_text(8, vsep1 + (vsep1a * 4), "Damage: " + string(sDamageP1));
				draw_text(8, (vsep1 * 2) + (vsep1a * 3), "Speed: " + string(sMaxP1));
				draw_text(8, (vsep1 * 2) + (vsep1a * 4), "Accel: " + string(sAccelP1));
				draw_text(8, (vsep1 * 3) + (vsep1a * 3), "Time: " + string(bTimeP1));
				draw_text(8, (vsep1 * 3) + (vsep1a * 4), "Cooldown: " + string(bRateP1));
				draw_text(8, (vsep1 * 4) + (vsep1a * 3), "Strength: " + string(sStrengthP1));
				draw_text(8, (vsep1 * 4) + (vsep1a * 4), "Recharge: " + string(sRateP1));
				draw_text(8, (vsep1 * 5) + (vsep1a * 3), "Radius: " + string(bRadiusP1));
				draw_text(8, (vsep1 * 5) + (vsep1a * 4), "Cooldown: " + string(bCooldownP1));
				draw_text(8, (vsep1 * 6) + (vsep1a * 3), "Volley Size: " + string(mVolleyP1));
				draw_text(8, (vsep1 * 6) + (vsep1a * 4), "Damage: " + string(mDamageP1));
				draw_text(8, (vsep1 * 7) + (vsep1a * 3), "Duration: " + string(lTimeP1));
				draw_text(8, (vsep1 * 7) + (vsep1a * 4), "Recharge: " + string(lCooldownP1));
				draw_text(8, (vsep1 * 8) + (vsep1a * 3), "Volley Size: " + string(tRateP1));
				draw_text(8, (vsep1 * 8) + (vsep1a * 4), "Damage: " + string(tDamageP1));
				draw_text(8, (vsep1 * 9) + (vsep1a * 3), "Max Active: " + string(mMaxP1));
				draw_text(8, (vsep1 * 9) + (vsep1a * 4), "Radius: " + string(mRadiusP1));
				draw_set_color(c_white);
				surface_reset_target();
			}
			else
			{
				uiSurf_1b = surface_create(uiW_1b, uiH_1b);
	            surface_set_target(uiSurf_1b);
	            draw_clear(c_black);
	            surface_reset_target();
			}
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_set_font(fnt12);
			draw_set_color(c_dkgray);
			draw_text(uictrXP1 - 2, 16 + 2, "HIGH SCORE");
			draw_text(uictrXP1 - 2, 32 + 2, string(global.highScoreP1));
			draw_text(uictrXP1 - 2, 52 + 2, "SCORE");
			draw_text(uictrXP1 - 2, 68 + 2, string(scoreP1));
			draw_set_color(c_fuelyellow);
			draw_text(uictrXP1, 16, "HIGH SCORE");
			draw_text(uictrXP1, 32, string(global.highScoreP1));
			draw_text(uictrXP1, 52, "SCORE");
			draw_text(uictrXP1, 68, string(scoreP1));
			if global.gameOver
			{
				draw_set_font(fnt24);
				draw_set_color(c_dkgray);
				draw_text(uictrXP1 - 2, (display_get_gui_height() * 0.375) + 2, "GAME OVER");
				draw_set_color(c_fuelyellow);
				draw_text(uictrXP1, display_get_gui_height() * 0.375, "GAME OVER");
			}
			draw_set_color(c_white);
			break;
		case "COOP":
			if surface_exists(uiSurf_1a) 
			{
				//MAIN PANEL\\
	            surface_set_target(uiSurf_1a);
	            draw_clear_alpha(c_black, 0);
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				draw_set_font(fnt12);
				//Turret && Missile Bar
				draw_sprite_ext(sButton, 0, 0, 75, 0.25, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sButton, 0, 0, 113, 0.25, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sUI, 0, 0, 75, 0.5, 1.5, 0, uiColor, 1);
				//Lazer && Mines Bar
				draw_sprite_ext(sButton, 0, 450, 75, 0.25, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sButton, 0, 450, 113, 0.25, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sUI, 0, 450, 75, 0.5, 1.5, 0, uiColor, 1);
				//Boost Bar
				draw_sprite_ext(sButton, 0, 50, 50, 0.25, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sUI, 0, 50, 50, 0.5, 1.5, 0, uiColor, 1);
				//AOE Burst
				draw_sprite_ext(sButton, 0, 400, 50, 0.25, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sUI, 0, 400, 50, 0.5, 1.5, 0, uiColor, 1);
				//Hull Health
				draw_sprite_ext(sButton, 0, 100, 25, 0.25, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sUI, 0, 100, 25, 0.5, 1.5, 0, uiColor, 1);
				//Shield Level
				draw_sprite_ext(sButton, 0, 350, 25, 0.25, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sUI, 0, 350, 25, 0.5, 1.5, 0, uiColor, 1);
				//Commmunications Panel
				if global.gameOver
				{
					draw_sprite_ext(sUI, 0, 150, 0, 2, 1.5, 0, uiColor, 1);
					draw_sprite_ext(sUI, 0, 150, 0, 2, 1.5, 0, c_red, 0.7);
					draw_text(250 - 1, 75 + 1, "SYSTEMS OFFLINE");
					draw_set_color(c_fuelyellow);
					draw_text(250, 75, "SYSTEMS OFFLINE");
				}
				else if enemyWaveAlert 
				{
					draw_sprite_ext(sUI, 0, 150, 0, 2, 1.5, 0, uiColor, 1);
					draw_sprite_ext(sUI, 0, 150, 0, 2, 1.5, 0, aColor, 0.7);
					var lsep = 3;
					for (var i = 0; i < 49; ++i)
					{
						var lw;
						if Chance(0.02) { draw_set_alpha(1); draw_set_color(c_red); lw = 2; }
						else { draw_set_alpha(0.7); draw_set_color(c_dkgray); lw = 1; }
						draw_line_width(155, 3 + (i * lsep), 344, 3 + (i * lsep), lw);
					}
					draw_set_alpha(1);
					draw_text(250 - 1, 75 + 1, enemyWaveText);
					draw_set_color(c_fuelyellow);
					draw_text(250, 75, enemyWaveText);
				}
				else
				{
					draw_sprite_ext(sUI, 0, 150, 0, 2, 1.5, 0, uiColor, 1);
					var lsep = 3;
					for (var i = 0; i < 49; ++i)
					{
						var lw;
						if Chance(0.01) { draw_set_alpha(1); draw_set_color(c_steelblue); lw = 2; }
						else { draw_set_alpha(0.7); draw_set_color(c_dkgray); lw = 1; }
						draw_line_width(155, 3 + (i * lsep), 344, 3 + (i * lsep), lw);
					}
					draw_set_alpha(1);
					draw_set_color(c_fuelyellow);
					draw_text(250, 38, "Planet Status");
					draw_text(250, 77, "Enemy Level");
					draw_text(250, 116, "UFO Control");
					draw_set_color(c_ashgray);
					draw_text(250, 16, "-- CONSOLE --");
					draw_text(250, 56, string(oPlanet.pHealth));
					draw_text(250, 95, string(levelLevel));
					draw_text(250, 134, string(inputP1));
				}
				
				draw_set_color(c_ashgray);
				draw_text(375, 38, "Shield");
				draw_text(125, 38, "Hull");
				draw_text(425, 62, "Burst");
				draw_text(75, 62, "Boost");
				draw_text(475, 87, "Lazer");
				draw_text(475, 125, "Mines");
				draw_text(25, 87, "Turret");
				draw_text(25, 125, "Missile");
				
				draw_set_color(c_white);
				draw_set_alpha(0.7);
				draw_healthbar(452, 112, 497, 99 , lBarP1 , c_black, c_black, c_ashgray, 0, false, false);
				draw_healthbar(452, 149, 497, 137, mmBarP1, c_black, c_black, c_ashgray, 0, false, false);
				draw_healthbar(2  , 112, 47 , 99 , tBarP1 , c_black, c_black, c_ashgray, 1, false, false);
				draw_healthbar(2  , 149, 47 , 137, mBarP1 , c_black, c_black, c_ashgray, 1, false, false);
				draw_healthbar(402, 149, 447, 74 , bbBarP1, c_black, c_black, c_ashgray, 2, false, false);
				draw_healthbar(52 , 149, 97 , 74 , bBarP1 , c_black, c_black, c_ashgray, 2, false, false);
				draw_healthbar(102, 149, 147, 49 , hBarP1 , c_black, c_black, c_steelblue, 2, false, false);
				draw_healthbar(352, 149, 397, 49 , sBarP1 , c_black, c_black, c_steelblue, 2, false, false);
				draw_set_alpha(1);
				
				surface_reset_target();
			}
			else
			{
				uiSurf_1a = surface_create(uiW_1a, uiH_1a);
	            surface_set_target(uiSurf_1a);
	            draw_clear(c_black);
	            surface_reset_target();
			}
			if surface_exists(uiSurf_1b) 
			{
				//SIDE PANEL\\
				surface_set_target(uiSurf_1b);
	            draw_clear_alpha(c_black, 0);
				draw_sprite_ext(sUI, 0, 0, 0, 1, 6, 0, uiColor, 1);
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				draw_set_font(fnt12);
				//Boost Bar
				var vsep1 = 60;
				var vsep1a = 12;
				var vsep1b = 13;

				draw_sprite_ext(sButton, 0, 0, 0, 0.5, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sButton, 0, 0, vsep1, 0.5, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sButton, 0, 0, vsep1 * 2, 0.5, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sButton, 0, 0, vsep1 * 3, 0.5, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sButton, 0, 0, vsep1 * 4, 0.5, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sButton, 0, 0, vsep1 * 5, 0.5, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sButton, 0, 0, vsep1 * 6, 0.5, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sButton, 0, 0, vsep1 * 7, 0.5, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sButton, 0, 0, vsep1 * 8, 0.5, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sButton, 0, 0, vsep1 * 9, 0.5, 0.35, 0, uiColor, 1);
				
				/*
				draw_set_color(c_white);
				draw_text(50 - 1, vsep1b, "Primary");
				draw_text(50 - 1, vsep1 + vsep1b, "Secondary");
				draw_text(50 - 1, (vsep1 * 2) + vsep1b, "Speed");
				draw_text(50 - 1, (vsep1 * 3) + vsep1b, "Boost");
				draw_text(50 - 1, (vsep1 * 4) + vsep1b, "Shield");
				draw_text(50 - 1, (vsep1 * 5) + vsep1b, "Burst");
				draw_text(50 - 1, (vsep1 * 6) + vsep1b, "Missiles");
				draw_text(50 - 1, (vsep1 * 7) + vsep1b, "Lazer");
				draw_text(50 - 1, (vsep1 * 8) + vsep1b, "Turret");
				draw_text(50 - 1, (vsep1 * 9) + vsep1b, "Mines");
				*/
				
				draw_set_color(c_aqua);
				draw_text(50, vsep1a, "Primary");
				draw_set_color(c_blue);
				draw_text(50, vsep1 + vsep1a, "Secondary");
				draw_set_color(c_fuchsia);
				draw_text(50, (vsep1 * 2) + vsep1a, "Speed");
				draw_set_color(c_green);
				draw_text(50, (vsep1 * 3) + vsep1a, "Boost");
				draw_set_color(c_maroon);
				draw_text(50, (vsep1 * 4) + vsep1a, "Shield");
				draw_set_color(c_orange);
				draw_text(50, (vsep1 * 5) + vsep1a, "Burst");
				draw_set_color(c_purple);
				draw_text(50, (vsep1 * 6) + vsep1a, "Missiles");
				draw_set_color(c_silver);
				draw_text(50, (vsep1 * 7) + vsep1a, "Lazer");
				draw_set_color(c_teal);
				draw_text(50, (vsep1 * 8) + vsep1a, "Turret");
				draw_set_color(c_yellow);
				draw_text(50, (vsep1 * 9) + vsep1a, "Mines");
				
				draw_set_halign(fa_left);
				draw_set_font(fnt10);
				draw_set_color(c_ashgray);
				draw_text(8, vsep1a * 3, "Fire Rate: " + string(pRateP1));
				draw_text(8, vsep1a * 4, "Damage: " + string(pDamageP1));
				draw_text(8, vsep1 + (vsep1a * 3), "Fire Rate: " + string(sRateP1));
				draw_text(8, vsep1 + (vsep1a * 4), "Damage: " + string(sDamageP1));
				draw_text(8, (vsep1 * 2) + (vsep1a * 3), "Speed: " + string(sMaxP1));
				draw_text(8, (vsep1 * 2) + (vsep1a * 4), "Accel: " + string(sAccelP1));
				draw_text(8, (vsep1 * 3) + (vsep1a * 3), "Time: " + string(bTimeP1));
				draw_text(8, (vsep1 * 3) + (vsep1a * 4), "Cooldown: " + string(bRateP1));
				draw_text(8, (vsep1 * 4) + (vsep1a * 3), "Strength: " + string(sStrengthP1));
				draw_text(8, (vsep1 * 4) + (vsep1a * 4), "Recharge: " + string(sRateP1));
				draw_text(8, (vsep1 * 5) + (vsep1a * 3), "Radius: " + string(bRadiusP1));
				draw_text(8, (vsep1 * 5) + (vsep1a * 4), "Cooldown: " + string(bCooldownP1));
				draw_text(8, (vsep1 * 6) + (vsep1a * 3), "Volley Size: " + string(mVolleyP1));
				draw_text(8, (vsep1 * 6) + (vsep1a * 4), "Damage: " + string(mDamageP1));
				draw_text(8, (vsep1 * 7) + (vsep1a * 3), "Duration: " + string(lTimeP1));
				draw_text(8, (vsep1 * 7) + (vsep1a * 4), "Recharge: " + string(lCooldownP1));
				draw_text(8, (vsep1 * 8) + (vsep1a * 3), "Volley Size: " + string(tRateP1));
				draw_text(8, (vsep1 * 8) + (vsep1a * 4), "Damage: " + string(tDamageP1));
				draw_text(8, (vsep1 * 9) + (vsep1a * 3), "Max Active: " + string(mMaxP1));
				draw_text(8, (vsep1 * 9) + (vsep1a * 4), "Radius: " + string(mRadiusP1));
				
				draw_set_color(c_white);
				surface_reset_target();
			}
			else
			{
				uiSurf_1b = surface_create(uiW_1b, uiH_1b);
	            surface_set_target(uiSurf_1b);
	            draw_clear(c_black);
	            surface_reset_target();
			}
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_set_font(fnt12);
			draw_set_color(c_dkgrey);
			draw_text(uictrXP1 - 2, 16 + 2, "HIGH SCORE");
			draw_text(uictrXP1 - 2, 32 + 2, string(global.highScoreP1));
			draw_text(uictrXP1 - 2, 52 + 2, "SCORE");
			draw_text(uictrXP1 - 2, 68 + 2, string(scoreP1));
			draw_set_color(c_fuelyellow);
			draw_text(uictrXP1, 16, "HIGH SCORE");
			draw_text(uictrXP1, 32, string(global.highScoreP1));
			draw_text(uictrXP1, 52, "SCORE");
			draw_text(uictrXP1, 68, string(scoreP1));
			draw_set_color(c_white);
			
			//PLAYER TWO\\
			if surface_exists(uiSurf_2a) 
			{
				//MAIN PANEL\\
	            surface_set_target(uiSurf_2a);
	            draw_clear_alpha(c_black, 0);
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				draw_set_font(fnt12);
				//Turret && Missile Bar
				draw_sprite_ext(sButton, 0, 0, 75, 0.25, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sButton, 0, 0, 113, 0.25, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sUI, 0, 0, 75, 0.5, 1.5, 0, uiColor, 1);
				//Lazer && Mines Bar
				draw_sprite_ext(sButton, 0, 450, 75, 0.25, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sButton, 0, 450, 113, 0.25, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sUI, 0, 450, 75, 0.5, 1.5, 0, uiColor, 1);
				//Boost Bar
				draw_sprite_ext(sButton, 0, 50, 50, 0.25, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sUI, 0, 50, 50, 0.5, 1.5, 0, uiColor, 1);
				//AOE Burst
				draw_sprite_ext(sButton, 0, 400, 50, 0.25, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sUI, 0, 400, 50, 0.5, 1.5, 0, uiColor, 1);
				//Hull Health
				draw_sprite_ext(sButton, 0, 100, 25, 0.25, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sUI, 0, 100, 25, 0.5, 1.5, 0, uiColor, 1);
				//Shield Level
				draw_sprite_ext(sButton, 0, 350, 25, 0.25, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sUI, 0, 350, 25, 0.5, 1.5, 0, uiColor, 1);
				//Commmunications Panel
				if global.gameOver
				{
					draw_sprite_ext(sUI, 0, 150, 0, 2, 1.5, 0, uiColor, 1);
					draw_sprite_ext(sUI, 0, 150, 0, 2, 1.5, 0, c_red, 0.7);
					draw_text(250 - 1, 75 + 1, "SYSTEMS OFFLINE");
					draw_set_color(c_fuelyellow);
					draw_text(250, 75, "SYSTEMS OFFLINE");
				}
				else if enemyWaveAlert 
				{
					draw_sprite_ext(sUI, 0, 150, 0, 2, 1.5, 0, uiColor, 1);
					draw_sprite_ext(sUI, 0, 150, 0, 2, 1.5, 0, aColor, 0.7);
					var lsep = 3;
					for (var i = 0; i < 49; ++i)
					{
						var lw;
						if Chance(0.02) { draw_set_alpha(1); draw_set_color(c_red); lw = 2; }
						else { draw_set_alpha(0.7); draw_set_color(c_dkgray); lw = 1; }
						draw_line_width(155, 3 + (i * lsep), 344, 3 + (i * lsep), lw);
					}
					draw_set_alpha(1);
					draw_text(250 - 1, 75 + 1, enemyWaveText);
					draw_set_color(c_fuelyellow);
					draw_text(250, 75, enemyWaveText);
				}
				else
				{
					draw_sprite_ext(sUI, 0, 150, 0, 2, 1.5, 0, uiColor, 1);
					var lsep = 3;
					for (var i = 0; i < 49; ++i)
					{
						var lw;
						if Chance(0.01) { draw_set_alpha(1); draw_set_color(c_steelblue); lw = 2; }
						else { draw_set_alpha(0.7); draw_set_color(c_dkgray); lw = 1; }
						draw_line_width(155, 3 + (i * lsep), 344, 3 + (i * lsep), lw);
					}
					draw_set_alpha(1);
					draw_set_color(c_fuelyellow);
					draw_text(250, 38, "Planet Status");
					draw_text(250, 77, "Enemy Level");
					draw_text(250, 116, "UFO Control");
					draw_set_color(c_ashgray);
					draw_text(250, 16, "--CONSOLE--");
					draw_text(250, 56, string(oPlanet.pHealth));
					draw_text(250, 95, string(levelLevel));
					draw_text(250, 134, string(inputP2));
				}
				
				draw_set_color(c_ashgray);
				draw_text(125, 38, "Hull");
				draw_text(375, 38, "Shield");
				draw_text(425, 62, "Burst");
				draw_text(75, 62, "Boost");
				draw_text(475, 87, "Lazer");
				draw_text(475, 125, "Mines");
				draw_text(25, 87, "Turret");
				draw_text(25, 125, "Missile");
				
				draw_set_color(c_white);
				draw_set_alpha(0.7);
				draw_healthbar(452, 112, 497, 99 , lBarP2 , c_black, c_black, c_ashgray, 0, false, false);
				draw_healthbar(452, 149, 497, 137, mmBarP2, c_black, c_black, c_ashgray, 0, false, false);
				draw_healthbar(2  , 112, 47 , 99 , tBarP2 , c_black, c_black, c_ashgray, 1, false, false);
				draw_healthbar(2  , 149, 47 , 137, mBarP2 , c_black, c_black, c_ashgray, 1, false, false);
				draw_healthbar(402, 149, 447, 74 , bbBarP2, c_black, c_black, c_ashgray, 2, false, false);
				draw_healthbar(52 , 149, 97 , 74 , bBarP2 , c_black, c_black, c_ashgray, 2, false, false);
				draw_healthbar(102, 149, 147, 49 , hBarP2 , c_black, c_black, c_steelblue, 2, false, false);
				draw_healthbar(352, 149, 397, 49 , sBarP2 , c_black, c_black, c_steelblue, 2, false, false);
				draw_set_alpha(1);
				
				surface_reset_target();
			}
			else
			{
				uiSurf_2a = surface_create(uiW_2a, uiH_2a);
	            surface_set_target(uiSurf_2a);
	            draw_clear(c_black);
	            surface_reset_target();
			}
			if surface_exists(uiSurf_2b) 
			{
				//SIDE PANEL\\
				surface_set_target(uiSurf_2b);
	            draw_clear_alpha(c_black, 0);
				draw_sprite_ext(sUI, 0, 0, 0, 1, 6, 0, uiColor, 1);
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				draw_set_font(fnt12);
				//Boost Bar
				var vsep1 = 60;
				var vsep1a = 12;
				var vsep1b = 13;

				draw_sprite_ext(sButton, 0, 0, 0, 0.5, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sButton, 0, 0, vsep1, 0.5, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sButton, 0, 0, vsep1 * 2, 0.5, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sButton, 0, 0, vsep1 * 3, 0.5, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sButton, 0, 0, vsep1 * 4, 0.5, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sButton, 0, 0, vsep1 * 5, 0.5, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sButton, 0, 0, vsep1 * 6, 0.5, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sButton, 0, 0, vsep1 * 7, 0.5, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sButton, 0, 0, vsep1 * 8, 0.5, 0.35, 0, uiColor, 1);
				draw_sprite_ext(sButton, 0, 0, vsep1 * 9, 0.5, 0.35, 0, uiColor, 1);
				
				/*
				draw_set_color(c_black);
				draw_text(50 - 1, vsep1b, "Primary");
				draw_text(50 - 1, vsep1 + vsep1b, "Secondary");
				draw_text(50 - 1, (vsep1 * 2) + vsep1b + 1, "Speed");
				draw_text(50 - 1, (vsep1 * 3) + vsep1b + 1, "Boost");
				draw_text(50 - 1, (vsep1 * 4) + vsep1b + 1, "Shield");
				draw_text(50 - 1, (vsep1 * 5) + vsep1b + 1, "Burst");
				draw_text(50 - 1, (vsep1 * 6) + vsep1b + 1, "Missiles");
				draw_text(50 - 1, (vsep1 * 7) + vsep1b + 1, "Lazer");
				draw_text(50 - 1, (vsep1 * 8) + vsep1b + 1, "Turret");
				draw_text(50 - 1, (vsep1 * 9) + vsep1b + 1, "Mines");
				*/
				
				draw_set_color(c_aqua);
				draw_text(50, vsep1a, "Primary");
				draw_set_color(c_blue);
				draw_text(50, vsep1 + vsep1a, "Secondary");
				draw_set_color(c_fuchsia);
				draw_text(50, (vsep1 * 2) + vsep1a, "Speed");
				draw_set_color(c_green);
				draw_text(50, (vsep1 * 3) + vsep1a, "Boost");
				draw_set_color(c_maroon);
				draw_text(50, (vsep1 * 4) + vsep1a, "Shield");
				draw_set_color(c_orange);
				draw_text(50, (vsep1 * 5) + vsep1a, "Burst");
				draw_set_color(c_purple);
				draw_text(50, (vsep1 * 6) + vsep1a, "Missiles");
				draw_set_color(c_silver);
				draw_text(50, (vsep1 * 7) + vsep1a, "Lazer");
				draw_set_color(c_teal);
				draw_text(50, (vsep1 * 8) + vsep1a, "Turret");
				draw_set_color(c_yellow);
				draw_text(50, (vsep1 * 9) + vsep1a, "Mines");
				draw_set_color(c_white);
				
				draw_set_halign(fa_left);
				draw_set_font(fnt10);
				draw_set_color(c_ashgray);
				draw_text(8, vsep1a * 3, "Fire Rate: " + string(pRateP2));
				draw_text(8, vsep1a * 4, "Damage: " + string(pDamageP2));
				draw_text(8, vsep1 + (vsep1a * 3), "Fire Rate: " + string(sRateP2));
				draw_text(8, vsep1 + (vsep1a * 4), "Damage: " + string(sDamageP2));
				draw_text(8, (vsep1 * 2) + (vsep1a * 3), "Speed: " + string(sMaxP2));
				draw_text(8, (vsep1 * 2) + (vsep1a * 4), "Accel: " + string(sAccelP2));
				draw_text(8, (vsep1 * 3) + (vsep1a * 3), "Time: " + string(bTimeP2));
				draw_text(8, (vsep1 * 3) + (vsep1a * 4), "Cooldown: " + string(bRateP2));
				draw_text(8, (vsep1 * 4) + (vsep1a * 3), "Strength: " + string(sStrengthP2));
				draw_text(8, (vsep1 * 4) + (vsep1a * 4), "Recharge: " + string(sRateP2));
				draw_text(8, (vsep1 * 5) + (vsep1a * 3), "Radius: " + string(bRadiusP2));
				draw_text(8, (vsep1 * 5) + (vsep1a * 4), "Cooldown: " + string(bCooldownP2));
				draw_text(8, (vsep1 * 6) + (vsep1a * 3), "Volley Size: " + string(mVolleyP2));
				draw_text(8, (vsep1 * 6) + (vsep1a * 4), "Damage: " + string(mDamageP2));
				draw_text(8, (vsep1 * 7) + (vsep1a * 3), "Duration: " + string(lTimeP2));
				draw_text(8, (vsep1 * 7) + (vsep1a * 4), "Recharge: " + string(lCooldownP2));
				draw_text(8, (vsep1 * 8) + (vsep1a * 3), "Volley Size: " + string(tRateP2));
				draw_text(8, (vsep1 * 8) + (vsep1a * 4), "Damage: " + string(tDamageP2));
				draw_text(8, (vsep1 * 9) + (vsep1a * 3), "Max Active: " + string(mMaxP2));
				draw_text(8, (vsep1 * 9) + (vsep1a * 4), "Radius: " + string(mRadiusP2));
				draw_set_color(c_white);

				surface_reset_target();
			}
			else
			{
				uiSurf_2b = surface_create(uiW_2b, uiH_2b);
	            surface_set_target(uiSurf_2b);
	            draw_clear(c_black);
	            surface_reset_target();
			}
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_set_font(fnt12);
			draw_set_color(c_dkgrey);
			draw_text(uictrXP2 - 2, 16 + 2, "HIGH SCORE");
			draw_text(uictrXP2 - 2, 32 + 2, string(global.highScoreP2));
			draw_text(uictrXP2 - 2, 52 + 2, "SCORE");
			draw_text(uictrXP2 - 2, 68 + 2, string(scoreP2));
			draw_set_color(c_fuelyellow);
			draw_text(uictrXP2, 16, "HIGH SCORE");
			draw_text(uictrXP2, 32, string(global.highScoreP2));
			draw_text(uictrXP2, 52, "SCORE");
			draw_text(uictrXP2, 68, string(scoreP2));
			draw_set_color(c_white);
			if global.gameOver
			{
				draw_set_font(fnt24);
				draw_set_color(c_dkgrey);
				draw_text((display_get_gui_width() * 0.5) - 2, (display_get_gui_height() * 0.375) + 2, "GAME OVER");
				draw_set_color(c_fuelyellow);
				draw_text((display_get_gui_width() * 0.5), display_get_gui_height() * 0.375, "GAME OVER");
				draw_set_color(c_white);
			}
			break;
	}
}