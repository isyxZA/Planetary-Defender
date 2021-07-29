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
		direction = point_direction(0, 0, hAxis, vAxis);
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
		var pdir = point_direction(0, 0, hPoint, vPoint);
		image_angle += angle_difference(pdir, image_angle) * 0.2;
	}
	else
	{
		if mTimer < room_speed { ++mTimer; }
		if mTimer >= room_speed
		{
			image_angle += angle_difference(direction, image_angle) * 0.2;
		}
	}
	
	//Activate speed boost
	if gamepad_button_check_pressed(gamePad, gp_shoulderl)
	{
		isBoosting = true;
		//canBounce = true;
		//alarm[1] = -1;
	}
	if gamepad_button_check_released(gamePad, gp_shoulderl)
	{
		isBoosting = false;
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
			        oControl.targetWidth  = 640;
			        break;
			    case 2:
			        oControl.targetWidth  = 960;
			        break;
			    case 3:
			        oControl.targetWidth  = 1280;
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
			        oControl.targetWidth  = 640;
			        break;
			    case 2:
			        oControl.targetWidth  = 960;
			        break;
			    case 3:
			        oControl.targetWidth  = 1280;
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
		direction = point_direction(0, 0, hAxis, vAxis);
		isMoving = true;
	}
	else 
	{
		isMoving = false;
	}
	
	if mouse_x == mxPrev && mouse_y	 == myPrev
	{
		if mTimer < room_speed 
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
		var pdir = point_direction(x, y, mouse_x, mouse_y);
		image_angle += angle_difference(pdir, image_angle) * 0.2;
	}
	else
	{
		image_angle += angle_difference(direction, image_angle) * 0.2;
	}
	
	mxPrev = mouse_x;
	myPrev = mouse_y;
	
	//Activate speed boost
	if keyboard_check_pressed(vk_space)
	{
		isBoosting = true;
		//canBounce = true;
		//alarm[1] = -1;
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
			        oControl.targetWidth  = 640;
			        break;
			    case 2:
			        oControl.targetWidth  = 960;
			        break;
			    case 3:
			        oControl.targetWidth  = 1280;
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
			        oControl.targetWidth  = 640;
			        break;
			    case 2:
			        oControl.targetWidth  = 960;
			        break;
			    case 3:
			        oControl.targetWidth  = 1280;
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
		speedCurrent = lerp(speedCurrent, speedMax, 0.05);
	}
	//Boost control
	if isBoosting
	{
		if boostCurrent != boostMax
		{
			boostCurrent = lerp(boostCurrent, boostMax, 0.05)
		}
	}
	else
	{
		if boostCurrent != 0
		{
			boostCurrent = lerp(boostCurrent, 0, 0.1)
		}
	}
	
	//Movement and Collision Detection\\
	//Speed to apply to the horizontal and vertical axis
	var spd = (speedCurrent + boostCurrent);
	hSpeed = (hAxis * (spd*abs(hAxis)));
	vSpeed = (vAxis * (spd*abs(vAxis)));
	
	var hcol = place_meeting(x + hSpeed, y, oCollider);
	var vcol = place_meeting(x, y + vSpeed, oCollider);
	
	//Horizontal movement is blocked
	if hcol 
	{ 
		//Determine cardinal direction
		GetDirection();
		//Slide along the collider
		switch dir
		{
			case "NW":
			case "NE":
				//Slide UP
				if !collision_line(x, y, x, y - 10, oCollider, false, true) { --y; }
				break;
			case "SW":
			case "SE":
				//Slide DOWN
				if !collision_line(x, y, x, y + 10, oCollider, false, true) { ++y; }
				break;
		}
		//Prevent horizontal movement
		hSpeed = 0; 
	}
	
	//Vertical movement is blocked
	if vcol 
	{ 
		//Determine cardinal direction
		GetDirection();
		//Slide along the collider
		switch dir
		{
			case "NW":
			case "SW":
				//Slide LEFT
				if !collision_line(x, y, x - 10, y, oCollider, false, true) { --x; }
				break;
			case "NE":
			case "SE":
				//Slide RIGHT
				if !collision_line(x, y, x + 10, y, oCollider, false, true) { ++x; }
				break;
		}
		//Prevent vertical movement
		vSpeed = 0; 
	}
	
	//Move
	x += hSpeed;
	y += vSpeed;
}
else
{
	if hSpeed != 0 || vSpeed != 0 
	{
		speedCurrent = 0;
		boostCurrent = 0;
		
		//Decelerate
		//Speed to apply to the horizontal and vertical axis
		if hSpeed != 0 { hSpeed = lerp(hSpeed, 0, 0.05); }
		if vSpeed != 0 { vSpeed = lerp(vSpeed, 0, 0.05); }
	
		var hcol = place_meeting(x + hSpeed, y, oCollider);
		var vcol = place_meeting(x, y + vSpeed, oCollider);
	
		//Horizontal movement is blocked
		if hcol 
		{ 
			//Determine cardinal direction
			GetDirection();
			//Slide along the collider
			switch dir
			{
				case "NW":
				case "NE":
					//Slide UP
					if !collision_line(x, y, x, y - 10, oCollider, false, true) { --y; }
					break;
				case "SW":
				case "SE":
					//Slide DOWN
					if !collision_line(x, y, x, y + 10, oCollider, false, true) { ++y; }
					break;
			}
			//Prevent horizontal movement
			hSpeed = 0; 
		}
	
		//Vertical movement is blocked
		if vcol 
		{ 
			//Determine cardinal direction
			GetDirection();
			//Slide along the collider
			switch dir
			{
				case "NW":
				case "SW":
					//Slide LEFT
					if !collision_line(x, y, x - 10, y, oCollider, false, true) { --x; }
					break;
				case "NE":
				case "SE":
					//Slide RIGHT
					if !collision_line(x, y, x + 10, y, oCollider, false, true) { ++x; }
					break;
			}
			//Prevent vertical movement
			vSpeed = 0; 
		}
	
		//Move
		x += hSpeed;
		y += vSpeed;
	}
}