if room == rmMenu && drawActive
{
	switch oControl.uiOverlay
	{
		case buttonoverlay.main:
			break;
		case buttonoverlay.sololobby:
			var fw = room_width - 60;
			var fh = room_height - 60;
			var cw = fw / 20;
			var ch = fh / 15;
			var fc = c_black;
			var fa = 1;
			//From left to right
			for (var i = 0; i < (fw/cw); ++i)
			{
				var fx = (i * cw) + 30;
				//Top to bottom
				for (var ii = 0; ii < (fh/ch); ++ii) 
				{
					var fy = (ii * ch) + 30;
					if fc == c_black
					{
						fc = c_dkgray;
						fa = 1;
					}
					else
					{
						fc = c_black;
						fa = 0.1;
					}
					draw_set_color(fc);
					draw_set_alpha(fa);
					draw_rectangle(fx, fy, fx + cw, fy + ch, false);
					draw_set_color(c_steelblue);
					draw_set_alpha(1);
					draw_rectangle(fx, fy, fx + cw, fy + ch, true);
				}
			}
			draw_set_color(c_black);
			draw_set_alpha(0.5);
			draw_rectangle(30, 30, room_width - 30, room_height - 30, false);
			draw_set_color(c_steelblue);
			draw_set_alpha(1);
			draw_line(0, 0, 30, 30);
			draw_line(0, room_height, 30, room_height - 30);
			draw_line(room_width, 0, room_width - 30, 30);
			draw_line(room_width, room_height, room_width - 30, room_height - 30);
			draw_rectangle(30, 30, room_width - 30, room_height - 30, true);
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_set_color(c_black);
			draw_set_font(fnt24);
			draw_text((room_width * 0.5) - 2, 66, "--- TOP SECRET UFO FACILITY ---");
			draw_set_color(c_fuelyellow);
			draw_text(room_width * 0.5, 64, "--- TOP SECRET UFO FACILITY ---");
			draw_set_font(fnt12);
			if instance_exists(oPlayerONE) 
			{
				var px = room_width * 0.15;
				var py = 230;
				var pa = 20;
				switch oPlayerONE.playerInput
				{
					case "GAMEPAD":
						//Display Button Inputs
						draw_set_color(c_black);
						draw_text(px - 2, py - 38, "PLAYER 1");
						draw_text(px - 2, py - 8, "UFO Control: " + string(oPlayerONE.playerInput));
						draw_text(px - 2, (py + pa) + 2, "Movement == Left Stick");
						draw_text(px - 2, py + (pa * 2) + 2, "Rotation == Right Stick");
						draw_text(px - 2, py + (pa * 3) + 2, "Primary Attack == Right Trigger");
						draw_text(px - 2, py + (pa * 4) + 2, "Secondary Attack == Left Trigger");
						draw_text(px - 2, py + (pa * 5) + 2, "Speed Boost == Left Shoulder");
						draw_text(px - 2, py + (pa * 6) + 2, "AOE Burst == Right Shoulder");
						draw_text(px - 2, py + (pa * 7) + 2, "Auto-Turret == X Button");
						draw_text(px - 2, py + (pa * 8) + 2, "Homing Missiles == A Button");
						draw_text(px - 2, py + (pa * 9) + 2, "Activate Lazer == Y Button");
						draw_text(px - 2, py + (pa * 10) + 2, "Drop Mines == B Button");
						
						draw_set_color(c_fuelyellow);
						draw_text(px, py - 40, "PLAYER 1");
						draw_text(px, py - 10, "UFO Control: " + string(oPlayerONE.playerInput));
						draw_text(px, py + pa, "Movement == Left Stick");
						draw_text(px, py + (pa * 2), "Rotation == Right Stick");
						draw_text(px, py + (pa * 3), "Primary Attack == Right Trigger");
						draw_text(px, py + (pa * 4), "Secondary Attack == Left Trigger");
						draw_text(px, py + (pa * 5), "Speed Boost == Left Shoulder");
						draw_text(px, py + (pa * 6), "AOE Burst == Right Shoulder");
						draw_text(px, py + (pa * 7), "Auto-Turret == X Button");
						draw_text(px, py + (pa * 8), "Homing Missiles == A Button");
						draw_text(px, py + (pa * 9), "Activate Lazer == Y Button");
						draw_text(px, py + (pa * 10), "Drop Mines == B Button");
						break;
					case "KEYBOARD":
						//Display Keyboard and Mouse Inputs
						draw_set_color(c_black);
						draw_text(px - 2, py - 38, "PLAYER 1");
						draw_text(px - 2, py - 8, "UFO Control: " + string(oPlayerONE.playerInput));
						draw_text(px - 2, (py + pa) + 2, "Movement == W A S D");
						draw_text(px - 2, py + (pa * 2) + 2, "Rotation == Mouse");
						draw_text(px - 2, py + (pa * 3) + 2, "Primary Attack == Left Mouse");
						draw_text(px - 2, py + (pa * 4) + 2, "Secondary Attack == Right Mouse");
						draw_text(px - 2, py + (pa * 5) + 2, "Speed Boost == Spacebar");
						draw_text(px - 2, py + (pa * 6) + 2, "AOE Burst == C");
						draw_text(px - 2, py + (pa * 7) + 2, "Auto-Turret == Q");
						draw_text(px - 2, py + (pa * 8) + 2, "Homing Missiles == E");
						draw_text(px - 2, py + (pa * 9) + 2, "Activate Lazer == R");
						draw_text(px - 2, py + (pa * 10) + 2, "Drop Mines == F");
							
						draw_set_color(c_fuelyellow);
						draw_text(px, py - 40, "PLAYER 1");
						draw_text(px, py - 10, "UFO Control: " + string(oPlayerONE.playerInput));
						draw_text(px, py + pa, "Movement == W A S D");
						draw_text(px, py + (pa * 2), "Rotation == Mouse");
						draw_text(px, py + (pa * 3), "Primary Attack == Left Mouse");
						draw_text(px, py + (pa * 4), "Secondary Attack == Right Mouse");
						draw_text(px, py + (pa * 5), "Speed Boost == Spacebar");
						draw_text(px, py + (pa * 6), "AOE Burst == C");
						draw_text(px, py + (pa * 7), "Auto-Turret == Q");
						draw_text(px, py + (pa * 8), "Homing Missiles == E");
						draw_text(px, py + (pa * 9), "Activate Lazer == R");
						draw_text(px, py + (pa * 10), "Drop Mines == F");
						break;
				}
			}
			draw_text(room_width * 0.6, room_height * 0.55, "GEOMETROID \nDUMMY");
			draw_set_color(c_white);
			draw_sprite(sTarget, 0, room_width * 0.6, room_height * 0.45);
			break;
		case buttonoverlay.cooplobby:
			var fw = room_width - 60;
			var fh = room_height - 60;
			var cw = fw / 20;
			var ch = fh / 15;
			var fc = c_black;
			var fa = 1;
			//From left to right
			for (var i = 0; i < (fw/cw); ++i)
			{
				var fx = (i * cw) + 30;
				//Top to bottom
				for (var ii = 0; ii < (fh/ch); ++ii) 
				{
					var fy = (ii * ch) + 30;
					if fc == c_black
					{
						fc = c_dkgray;
						fa = 1;
					}
					else
					{
						fc = c_black;
						fa = 0.1;
					}
					draw_set_color(fc);
					draw_set_alpha(fa);
					draw_rectangle(fx, fy, fx + cw, fy + ch, false);
					draw_set_color(c_steelblue);
					draw_set_alpha(1);
					draw_rectangle(fx, fy, fx + cw, fy + ch, true);
				}
			}
			draw_set_color(c_black);
			draw_set_alpha(0.4);
			draw_rectangle(30, 30, room_width - 30, room_height - 30, false);
			draw_set_color(c_steelblue);
			draw_set_alpha(1);
			draw_line(0, 0, 30, 30);
			draw_line(0, room_height, 30, room_height - 30);
			draw_line(room_width, 0, room_width - 30, 30);
			draw_line(room_width, room_height, room_width - 30, room_height - 30);
			draw_rectangle(30, 30, room_width - 30, room_height - 30, true);
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_set_font(fnt24);
			draw_set_color(c_black);
			draw_text((room_width * 0.5) - 2, 66, "--- TOP SECRET UFO FACILITY ---");
			draw_set_color(c_fuelyellow);
			draw_text(room_width * 0.5, 64, "--- TOP SECRET UFO FACILITY ---");
			draw_set_font(fnt12);
			if instance_exists(oPlayerONE) 
			{
				var px = room_width * 0.15;
				var py = 230;
				var pa = 20;
				switch oPlayerONE.playerInput
				{
					case "GAMEPAD":
						//Display Button Inputs
						draw_set_color(c_black);
						draw_text(px - 2, py - 38, "PLAYER 1");
						draw_text(px - 2, py - 8, "UFO Control: " + string(oPlayerONE.playerInput));
						draw_text(px - 2, (py + pa) + 2, "Movement == Left Stick");
						draw_text(px - 2, py + (pa * 2) + 2, "Rotation == Right Stick");
						draw_text(px - 2, py + (pa * 3) + 2, "Primary Attack == Right Trigger");
						draw_text(px - 2, py + (pa * 4) + 2, "Secondary Attack == Left Trigger");
						draw_text(px - 2, py + (pa * 5) + 2, "Speed Boost == Left Shoulder");
						draw_text(px - 2, py + (pa * 6) + 2, "AOE Burst == Right Shoulder");
						draw_text(px - 2, py + (pa * 7) + 2, "Auto-Turret == X Button");
						draw_text(px - 2, py + (pa * 8) + 2, "Homing Missiles == A Button");
						draw_text(px - 2, py + (pa * 9) + 2, "Activate Lazer == Y Button");
						draw_text(px - 2, py + (pa * 10) + 2, "Drop Mines == B Button");
						
						draw_set_color(c_fuelyellow);
						draw_text(px, py - 40, "PLAYER 1");
						draw_text(px, py - 10, "UFO Control: " + string(oPlayerONE.playerInput));
						draw_text(px, py + pa, "Movement == Left Stick");
						draw_text(px, py + (pa * 2), "Rotation == Right Stick");
						draw_text(px, py + (pa * 3), "Primary Attack == Right Trigger");
						draw_text(px, py + (pa * 4), "Secondary Attack == Left Trigger");
						draw_text(px, py + (pa * 5), "Speed Boost == Left Shoulder");
						draw_text(px, py + (pa * 6), "AOE Burst == Right Shoulder");
						draw_text(px, py + (pa * 7), "Auto-Turret == X Button");
						draw_text(px, py + (pa * 8), "Homing Missiles == A Button");
						draw_text(px, py + (pa * 9), "Activate Lazer == Y Button");
						draw_text(px, py + (pa * 10), "Drop Mines == B Button");
						break;
					case "KEYBOARD":
						//Display Keyboard and Mouse Inputs
						if global.splitKeyboard
						{
							draw_set_color(c_black);
							draw_text(px - 2, py - 38, "PLAYER 1");
							draw_text(px - 2, py - 8, "UFO Control: " + string(oPlayerONE.playerInput));
							draw_text(px - 2, (py + pa) + 2, "Movement == W A S D");
							draw_text(px - 2, py + (pa * 2) + 2, "Rotation == W A S D");
							draw_text(px - 2, py + (pa * 3) + 2, "Primary Attack == Left Shift");
							draw_text(px - 2, py + (pa * 4) + 2, "Secondary Attack == Left Control");
							draw_text(px - 2, py + (pa * 5) + 2, "Speed Boost == Spacebar");
							draw_text(px - 2, py + (pa * 6) + 2, "AOE Burst == C");
							draw_text(px - 2, py + (pa * 7) + 2, "Auto-Turret == Q");
							draw_text(px - 2, py + (pa * 8) + 2, "Homing Missiles == E");
							draw_text(px - 2, py + (pa * 9) + 2, "Activate Lazer == R");
							draw_text(px - 2, py + (pa * 10) + 2, "Drop Mines == F");
							
							draw_set_color(c_fuelyellow);
							draw_text(px, py - 40, "PLAYER 1");
							draw_text(px, py - 10, "UFO Control: " + string(oPlayerONE.playerInput));
							draw_text(px, py + pa, "Movement == W A S D");
							draw_text(px, py + (pa * 2), "Rotation == W A S D");
							draw_text(px, py + (pa * 3), "Primary Attack == Left Shift");
							draw_text(px, py + (pa * 4), "Secondary Attack == Left Control");
							draw_text(px, py + (pa * 5), "Speed Boost == Spacebar");
							draw_text(px, py + (pa * 6), "AOE Burst == C");
							draw_text(px, py + (pa * 7), "Auto-Turret == Q");
							draw_text(px, py + (pa * 8), "Homing Missiles == E");
							draw_text(px, py + (pa * 9), "Activate Lazer == R");
							draw_text(px, py + (pa * 10), "Drop Mines == F");
						}
						else
						{
							draw_set_color(c_black);
							draw_text(px - 2, py - 38, "PLAYER 1");
							draw_text(px - 2, py - 8, "UFO Control: " + string(oPlayerONE.playerInput));
							draw_text(px - 2, (py + pa) + 2, "Movement == W A S D");
							draw_text(px - 2, py + (pa * 2) + 2, "Rotation == Mouse");
							draw_text(px - 2, py + (pa * 3) + 2, "Primary Attack == Left Mouse");
							draw_text(px - 2, py + (pa * 4) + 2, "Secondary Attack == Right Mouse");
							draw_text(px - 2, py + (pa * 5) + 2, "Speed Boost == Spacebar");
							draw_text(px - 2, py + (pa * 6) + 2, "AOE Burst == C");
							draw_text(px - 2, py + (pa * 7) + 2, "Auto-Turret == Q");
							draw_text(px - 2, py + (pa * 8) + 2, "Homing Missiles == E");
							draw_text(px - 2, py + (pa * 9) + 2, "Activate Lazer == R");
							draw_text(px - 2, py + (pa * 10) + 2, "Drop Mines == F");
							
							draw_set_color(c_fuelyellow);
							draw_text(px, py - 40, "PLAYER 1");
							draw_text(px, py - 10, "UFO Control: " + string(oPlayerONE.playerInput));
							draw_text(px, py + pa, "Movement == W A S D");
							draw_text(px, py + (pa * 2), "Rotation == Mouse");
							draw_text(px, py + (pa * 3), "Primary Attack == Left Mouse");
							draw_text(px, py + (pa * 4), "Secondary Attack == Right Mouse");
							draw_text(px, py + (pa * 5), "Speed Boost == Spacebar");
							draw_text(px, py + (pa * 6), "AOE Burst == C");
							draw_text(px, py + (pa * 7), "Auto-Turret == Q");
							draw_text(px, py + (pa * 8), "Homing Missiles == E");
							draw_text(px, py + (pa * 9), "Activate Lazer == R");
							draw_text(px, py + (pa * 10), "Drop Mines == F");
						}
						break;
				}
				//draw_set_color(c_white);
				//Draw the color picker here
				
				
			}
			if instance_exists(oPlayerTWO) 
			{
				var p2x = room_width * 0.85;
				var p2y = 230;
				var p2a = 20;
				switch oPlayerTWO.playerInput
				{
					case "GAMEPAD":
						//Display Button Inputs
						draw_set_color(c_black);
						draw_text(p2x - 2, p2y - 38, "PLAYER 2");
						draw_text(p2x - 2, p2y - 8, "UFO Control: " + string(oPlayerTWO.playerInput));
						draw_text(p2x - 2, (p2y + p2a) + 2, "Movement == Left Stick");
						draw_text(p2x - 2, p2y + (p2a * 2) + 2, "Rotation == Right Stick");
						draw_text(p2x - 2, p2y + (p2a * 3) + 2, "Primary Attack == Right Trigger");
						draw_text(p2x - 2, p2y + (p2a * 4) + 2, "Secondary Attack == Left Trigger");
						draw_text(p2x - 2, p2y + (p2a * 5) + 2, "Speed Boost == Left Shoulder");
						draw_text(p2x - 2, p2y + (p2a * 6) + 2, "AOE Burst == Right Shoulder");
						draw_text(p2x - 2, p2y + (p2a * 7) + 2, "Auto-Turret == X Button");
						draw_text(p2x - 2, p2y + (p2a * 8) + 2, "Homing Missiles == A Button");
						draw_text(p2x - 2, p2y + (p2a * 9) + 2, "Activate Lazer == Y Button");
						draw_text(p2x - 2, p2y + (p2a * 10) + 2, "Drop Mines == B Button");
						
						draw_set_color(c_fuelyellow);
						draw_text(p2x, p2y - 40, "PLAYER 2");
						draw_text(p2x, p2y - 10, "UFO Control: " + string(oPlayerTWO.playerInput));
						draw_text(p2x, p2y + p2a, "Movement == Left Stick");
						draw_text(p2x, p2y + (p2a * 2), "Rotation == Right Stick");
						draw_text(p2x, p2y + (p2a * 3), "Primary Attack == Right Trigger");
						draw_text(p2x, p2y + (p2a * 4), "Secondary Attack == Left Trigger");
						draw_text(p2x, p2y + (p2a * 5), "Speed Boost == Left Shoulder");
						draw_text(p2x, p2y + (p2a * 6), "AOE Burst == Right Shoulder");
						draw_text(p2x, p2y + (p2a * 7), "Auto-Turret == X Button");
						draw_text(p2x, p2y + (p2a * 8), "Homing Missiles == A Button");
						draw_text(p2x, p2y + (p2a * 9), "Activate Lazer == Y Button");
						draw_text(p2x, p2y + (p2a * 10), "Drop Mines == B Button");
						break;
					case "KEYBOARD":
						//Display Keyboard and Mouse Inputs
						if global.splitKeyboard
						{
							draw_set_color(c_black);
							draw_text(p2x - 2, p2y - 38, "PLAYER 2");
							draw_text(p2x - 2, p2y - 8, "UFO Control: " + string(oPlayerTWO.playerInput));
							draw_text(p2x - 2, (p2y + p2a) + 2, "Movement == Arrow Keys");
							draw_text(p2x - 2, p2y + (p2a * 2) + 2, "Rotation == Arrow Keys");
							draw_text(p2x - 2, p2y + (p2a * 3) + 2, "Primary Attack == Numpad 1");
							draw_text(p2x - 2, p2y + (p2a * 4) + 2, "Secondary Attack == Numpad 2");
							draw_text(p2x - 2, p2y + (p2a * 5) + 2, "Speed Boost == Numpad 0");
							draw_text(p2x - 2, p2y + (p2a * 6) + 2, "AOE Burst == Delete");
							draw_text(p2x - 2, p2y + (p2a * 7) + 2, "Auto-Turret == Numpad 3");
							draw_text(p2x - 2, p2y + (p2a * 8) + 2, "Homing Missiles == Numpad 4");
							draw_text(p2x - 2, p2y + (p2a * 9) + 2, "Activate Lazer == Numpad 5");
							draw_text(p2x - 2, p2y + (p2a * 10) + 2, "Drop Mines == Numpad 6");
							
							draw_set_color(c_fuelyellow);
							draw_text(p2x, p2y - 40, "PLAYER 2");
							draw_text(p2x, p2y - 10, "UFO Control: " + string(oPlayerTWO.playerInput));
							draw_text(p2x, p2y + p2a, "Movement == Arrow Keys");
							draw_text(p2x, p2y + (p2a * 2), "Rotation == Arrow Keys");
							draw_text(p2x, p2y + (p2a * 3), "Primary Attack == Numpad 1");
							draw_text(p2x, p2y + (p2a * 4), "Secondary Attack == Numpad 2");
							draw_text(p2x, p2y + (p2a * 5), "Speed Boost == Numpad 0");
							draw_text(p2x, p2y + (p2a * 6), "AOE Burst == Delete");
							draw_text(p2x, p2y + (p2a * 7), "Auto-Turret == Numpad 3");
							draw_text(p2x, p2y + (p2a * 8), "Homing Missiles == Numpad 4");
							draw_text(p2x, p2y + (p2a * 9), "Activate Lazer == Numpad 5");
							draw_text(p2x, p2y + (p2a * 10), "Drop Mines == Numpad 6");
						}
						else
						{
							draw_set_color(c_black);
							draw_text(p2x - 2, p2y - 38, "PLAYER 2");
							draw_text(p2x - 2, p2y - 8, "UFO Control: " + string(oPlayerTWO.playerInput));
							draw_text(p2x - 2, (p2y + p2a) + 2, "Movement == W A S D");
							draw_text(p2x - 2, p2y + (p2a * 2) + 2, "Rotation == Mouse");
							draw_text(p2x - 2, p2y + (p2a * 3) + 2, "Primary Attack == Left Mouse");
							draw_text(p2x - 2, p2y + (p2a * 4) + 2, "Secondary Attack == Right Mouse");
							draw_text(p2x - 2, p2y + (p2a * 5) + 2, "Speed Boost == Spacebar");
							draw_text(p2x - 2, p2y + (p2a * 6) + 2, "AOE Burst == C");
							draw_text(p2x - 2, p2y + (p2a * 7) + 2, "Auto-Turret == Q");
							draw_text(p2x - 2, p2y + (p2a * 8) + 2, "Homing Missiles == E");
							draw_text(p2x - 2, p2y + (p2a * 9) + 2, "Activate Lazer == R");
							draw_text(p2x - 2, p2y + (p2a * 10) + 2, "Drop Mines == F");
							
							draw_set_color(c_fuelyellow);
							draw_text(p2x, p2y - 40, "PLAYER 2");
							draw_text(p2x, p2y - 10, "UFO Control: " + string(oPlayerTWO.playerInput));
							draw_text(p2x, p2y + p2a, "Movement == W A S D");
							draw_text(p2x, p2y + (p2a * 2), "Rotation == Mouse");
							draw_text(p2x, p2y + (p2a * 3), "Primary Attack == Left Mouse");
							draw_text(p2x, p2y + (p2a * 4), "Secondary Attack == Right Mouse");
							draw_text(p2x, p2y + (p2a * 5), "Speed Boost == Spacebar");
							draw_text(p2x, p2y + (p2a * 6), "AOE Burst == C");
							draw_text(p2x, p2y + (p2a * 7), "Auto-Turret == Q");
							draw_text(p2x, p2y + (p2a * 8), "Homing Missiles == E");
							draw_text(p2x, p2y + (p2a * 9), "Activate Lazer == R");
							draw_text(p2x, p2y + (p2a * 10), "Drop Mines == F");
						}
						break;
				}
				//draw_set_color(c_white);
				//Draw the color picker here
				
				
			}
			draw_text(room_width * 0.5, room_height * 0.55, "GEOMETROID \nDUMMY");
			draw_set_color(c_white);
			draw_sprite(sTarget, 0, room_width * 0.5, room_height * 0.45);
			break;
	}
}