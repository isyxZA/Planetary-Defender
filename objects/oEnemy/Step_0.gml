if canMove
{
	var pa = point_direction(phy_position_x, phy_position_y, tX, tY);
	targetX = lengthdir_x(size*mass, pa);
	targetY = lengthdir_y(size*mass, pa);
	physics_apply_force(phy_position_x, phy_position_y, targetX, targetY);
	
	var pd = point_distance(phy_position_x, phy_position_y, tX, tY)*0.004;
	var scaleAdj = min(1, 0.1+pd);
	scale = lerp(scale, scaleAdj, 0.15);
}

switch shape
{
	case "Circle":
		if !isSpecial
		{
			if easeIn
			{
				if timer < duration 
				{
				    timer ++;
				    rCurrent = EaseSine(timer, r*1.5, -r*1.3, duration);
				}
				else
				{
					easeIn = false;
					timer = 0;
				}
			}
			else
			{
				if timer < duration 
				{
				    timer ++;
				    rCurrent = EaseSine(timer, r*0.2, r*1.3, duration);
				}
				else
				{
					easeIn = true;
					timer = 0;
				}
			}
			//if rCurrent >= r*1.5 { rTarget = r*-2; }
			//if rCurrent <= r*-1.5 { rTarget = r*2; }
			//rCurrent = lerp(rCurrent, rTarget, 0.015);
		}
		break;
	case "Box":
		if !isSpecial { phy_rotation += 2; }
		break;
	case "Triangle":
		if !isSpecial { phy_rotation -= 1.5; }
		break;
	case "Star":
		if !isSpecial { phy_rotation += 1; }
		break;
}
