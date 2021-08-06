if room == rmMenu && drawActive
{
	switch oControl.uiOverlay
	{
		case buttonoverlay.main:
			break;
		case buttonoverlay.sololobby:
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_set_font(fnt24);
			draw_set_color(c_silver);
			draw_set_color(c_dkgray);
			draw_text((room_width * 0.5) - 2, 34, "--- TOP SECRET UFO FACILITY ---");
			draw_set_color(c_silver);
			draw_text(room_width * 0.5, 32, "--- TOP SECRET UFO FACILITY ---");
			draw_set_font(fnt12);
			if instance_exists(oPlayerONE) 
			{
				var px = room_width * 0.15;
				var py = 230;
				var pa = 20;
				draw_text(px, py-10, "UFO Control: " + string(oPlayerONE.playerInput));
				switch oPlayerONE.playerInput
				{
					case "GAMEPAD":
						//Display Button Inputs
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
						draw_text(px, py + (pa * 11), "Zoom Camera == Pad UP/Down");
						break;
					case "KEYBOARD":
						//Display Keyboard and Mouse Inputs
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
						draw_text(px, py + (pa * 11), "Zoom Camera == Mouse Wheel");
						break;
				}
			}
			draw_set_color(c_white);
			break;
		case buttonoverlay.cooplobby:
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_set_font(fnt24);
			draw_set_color(c_dkgray);
			draw_text((room_width * 0.5) - 2, 34, "--- TOP SECRET UFO FACILITY ---");
			draw_set_color(c_silver);
			draw_text(room_width * 0.5, 32, "--- TOP SECRET UFO FACILITY ---");
			draw_set_font(fnt12);
			if instance_exists(oPlayerONE) 
			{
				var px = room_width * 0.15;
				var py = 230;
				var pa = 20;
				draw_text(px, py-40, "PLAYER 1");
				draw_text(px, py-10, "UFO Control: " + string(oPlayerONE.playerInput));
				switch oPlayerONE.playerInput
				{
					case "GAMEPAD":
						//Display Button Inputs
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
						draw_text(px, py + (pa * 11), "Zoom Camera == Pad UP/Down");
						break;
					case "KEYBOARD":
						//Display Keyboard and Mouse Inputs
						if global.splitKeyboard
						{
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
							draw_text(px, py + (pa * 11), "Zoom Camera == + -");
						}
						else
						{
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
							draw_text(px, py + (pa * 11), "Zoom Camera == Mouse Wheel");
						}
						break;
				}
				//Draw the color picker here
				
				
			}
			if instance_exists(oPlayerTWO) 
			{
				var p2x = room_width * 0.85;
				var p2y = 230;
				var p2a = 20;
				draw_text(p2x, p2y-40, "PLAYER 2");
				draw_text(p2x, p2y-10, "UFO Control: " + string(oPlayerTWO.playerInput));
				switch oPlayerTWO.playerInput
				{
					case "GAMEPAD":
						//Display Button Inputs
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
						draw_text(p2x, p2y + (p2a * 11), "Zoom Camera == Pad UP/Down");
						break;
					case "KEYBOARD":
						//Display Keyboard and Mouse Inputs
						if global.splitKeyboard
						{
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
							draw_text(p2x, p2y + (p2a * 11), "Zoom Camera == + -");
						}
						else
						{
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
							draw_text(p2x, p2y + (p2a * 11), "Zoom Camera == Mouse Wheel");
						}
						break;
				}
				//Draw the color picker here
				
				
			}
			draw_set_color(c_white);
			break;
	}
}