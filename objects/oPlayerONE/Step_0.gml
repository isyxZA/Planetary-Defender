/// @description Player Inputs
if gamePad != -1
{
	//Game Pad Inputs\\
	//Determine movement direction
	var hxa = gamepad_axis_value(gamePad, gp_axislh);
	var hya = gamepad_axis_value(gamePad, gp_axislv);
	
	var tRatio;
	if isBoosting { tRatio = 0.05; }
	else { tRatio = 0.1; }
	
	if hAxis != hxa { hAxis = lerp(hAxis, hxa, tRatio); }
	if vAxis != hya { vAxis = lerp(vAxis, hya, tRatio); }

	if hAxis != 0 || vAxis != 0
	{

		//phy_rotation = point_direction(0, 0, hAxis, vAxis);
		isMoving = true;
	}
	else
	{
		isMoving = false;
	}
	
	//Determine look angle
	var hPoint = gamepad_axis_value(gamePad, gp_axisrh);
	var vPoint = gamepad_axis_value(gamePad, gp_axisrv);

	if hPoint != 0 || vPoint != 0
	{
		mTimer = 0;
		var pdir = point_direction(0, 0, hPoint, -vPoint);
		phy_rotation += angle_difference(pdir, phy_rotation) * 0.1;
	}
	else
	{
		if mTimer < room_speed { ++mTimer; }
		if mTimer >= room_speed
		{
			var pdir = point_direction(0, 0, hAxis, -vAxis);
			phy_rotation += angle_difference(pdir, phy_rotation) * 0.1;
		}
	}
	
	//Activate speed boost
	if gamepad_button_check_pressed(gamePad, gp_shoulderl)
	{
		isBoosting = true;
	}
	if gamepad_button_check_released(gamePad, gp_shoulderl)
	{
		isBoosting = false;
	}
	
	//Shoot weapons
	//Fire main guns
	if gamepad_button_check_pressed(gamePad, gp_shoulderrb)
	{
		shootPrimary = true;
	}
	if gamepad_button_check_released(gamePad, gp_shoulderrb)
	{
		shootPrimary = false;
	}
	
	//Fire secondary guns
	if gamepad_button_check_pressed(gamePad, gp_shoulderlb)
	{
		shootSecondary = true;
	}
	if gamepad_button_check_released(gamePad, gp_shoulderlb)
	{
		shootSecondary = false;
	}
	
	//Set camera zoom level
	if gamepad_button_check_pressed(gamePad, gp_padu)
	{ 
	    if oControl.zoomLevel != 1
		{
	        oControl.zoomLevel -= 1;
	        if oControl.zoomLevel < 1 { oControl.zoomLevel = 1; }
			//Set target width according to zoom level
			switch oControl.zoomLevel 
			{
			    case 1:
			        oControl.targetWidth  = 960;
			        break;
			    case 2:
			        oControl.targetWidth  = 1366;
			        break;
			    case 3:
			        oControl.targetWidth  = 1600;
			        break;
			}
	    }
	} 
	else if gamepad_button_check_pressed(gamePad, gp_padd)
	{ 
	    if oControl.zoomLevel != 3
		{
	        oControl.zoomLevel += 1;
	        if oControl.zoomLevel > 3 { oControl.zoomLevel = 3; }
			//Set target width according to zoom level
			switch oControl.zoomLevel 
			{
			    case 1:
			        oControl.targetWidth  = 960;
			        break;
			    case 2:
			        oControl.targetWidth  = 1366;
			        break;
			    case 3:
			        oControl.targetWidth  = 1600;
			        break;
			}
	    }
	}
}
else
{
	//Keyboard and Mouse Inputs\\
	//Determine movement direction
	var up    = 0;
	var down  = 0;
	var left  = 0;
	var right = 0;
	
	if keyboard_check(ord("W")) { up    = -1; } 
	if keyboard_check(ord("S")) { down  =  1; }
	if keyboard_check(ord("A")) { left  = -1; }
	if keyboard_check(ord("D")) { right =  1; } 
	
	hAxis = left + right;
	vAxis = up + down;
	
	if hAxis != 0 || vAxis != 0
	{
		if global.netStatus == "COOP"
		{
			phy_rotation = point_direction(0, 0, hAxis, vAxis);
		}
		isMoving = true;
	}
	else 
	{
		isMoving = false;
	}
	
	if global.netStatus != "COOP"
	{
		if device_mouse_raw_x(0) == mxPrev && device_mouse_raw_y(0)	== myPrev
		{
			if mTimer <= room_speed 
			{ 
				++mTimer; 
			}
		}
		else
		{
			mTimer = 0;
		}

		//Determine look angle
		if mTimer < room_speed
		{
			var pdir = -point_direction(phy_position_x, phy_position_y, mouse_x, mouse_y);
			phy_rotation += angle_difference(pdir, phy_rotation) * 0.1;
		}
		else
		{
			var pdir = point_direction(0, 0, hAxis, -vAxis);
			phy_rotation += angle_difference(pdir, phy_rotation) * 0.1;
		}
	
		mxPrev = device_mouse_raw_x(0);
		myPrev = device_mouse_raw_y(0);
	}
	
	//Activate speed boost
	if keyboard_check_pressed(vk_space)
	{
		isBoosting = true;
	}
	if keyboard_check_released(vk_space)
	{
		isBoosting = false;
	}
	
	//Set camera zoom level
	if mouse_wheel_up() || keyboard_check_pressed(vk_add) 
	{ 
	    if oControl.zoomLevel != 1
		{
	        oControl.zoomLevel -= 1;
	        if oControl.zoomLevel < 1 { oControl.zoomLevel = 1; }
			//Set target width according to zoom level
			switch oControl.zoomLevel 
			{
			    case 1:
			        oControl.targetWidth  = 960;
			        break;
			    case 2:
			        oControl.targetWidth  = 1366;
			        break;
			    case 3:
			        oControl.targetWidth  = 1600;
			        break;
			}
	    }
	} 
	else if mouse_wheel_down() || keyboard_check_pressed(vk_subtract) 
	{ 
	    if oControl.zoomLevel != 3
		{
	        oControl.zoomLevel += 1;
	        if oControl.zoomLevel > 3 { oControl.zoomLevel = 3; }
			//Set target width according to zoom level
			switch oControl.zoomLevel 
			{
			    case 1:
			        oControl.targetWidth  = 960;
			        break;
			    case 2:
			        oControl.targetWidth  = 1366;
			        break;
			    case 3:
			        oControl.targetWidth  = 1600;
			        break;
			}
	    }
	}
}

if isMoving
{
	//Speed control
	//Accelerate
	if speedCurrent != speedMax 
	{
		speedCurrent = lerp(speedCurrent, speedMax, speedAccel);
	}
	//Boost control
	if isBoosting
	{
		if boostCurrent != boostMax
		{
			boostCurrent = lerp(boostCurrent, boostMax, speedAccel)
		}
	}
	else
	{
		if boostCurrent != 0
		{
			boostCurrent = lerp(boostCurrent, 0, speedAccel)
		}
	}
	
	//Movement and Collision Detection\\
	//Speed to apply to the horizontal and vertical axis
	var spd = (speedCurrent + boostCurrent);
	//hSpeed = (hAxis * (spd*abs(hAxis)));
	//vSpeed = (vAxis * (spd*abs(vAxis)));
	hSpeed = (hAxis * spd);
	vSpeed = (vAxis * spd);
	//Move
	physics_apply_force(phy_position_x, phy_position_y, hSpeed, vSpeed);
}

if shootPrimary
{
	if firePrimary
	{
		firePrimary = false;
		alarm[1] = room_speed * ratePrimary;
		//Spawn a bullet
		var ptx = lengthdir_x(10000, image_angle);
        var pty = lengthdir_y(10000, image_angle);
		var psx = phy_position_x+(ptx*0.002);
		var psy = phy_position_y+(pty*0.002);
		var pbc = choose(c_red, c_blue, c_green);
		SpawnBullet(psx, psy, pbc, -phy_rotation, ptx, pty, 0.6, damagePrimary, id);
	}
}

if shootSecondary
{
	if fireSecondary
	{
		//Spawn a bullet
		fireSecondary = false;
		alarm[2] = room_speed * rateSecondary;
		//Spawn a bullet
		var stx = lengthdir_x(10000, image_angle);
        var sty = lengthdir_y(10000, image_angle);
		var ssx = phy_position_x+(stx*0.002);
		var ssy = phy_position_y+(sty*0.002);
		var sbc = choose(c_purple, c_yellow, c_fuchsia);
		SpawnBullet(ssx, ssy, sbc, -phy_rotation, stx, sty, 1.2, damageSecondary, id);
	}
}