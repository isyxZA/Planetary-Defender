if canMove
{
	var pa = point_direction(phy_position_x, phy_position_y, tX, tY);
	//phy_rotation += 0.125;
	targetX = lengthdir_x(size*mass, pa);
	targetY = lengthdir_y(size*mass, pa);
	physics_apply_force(phy_position_x, phy_position_y, targetX, targetY);
}

var pd = point_distance(phy_position_x, phy_position_y, tX, tY)*0.004;
var scaleAdj = min(1, 0.1+pd);
scale = lerp(scale, scaleAdj, 0.15);

switch shape
{
	case "Circle":

		if rCurrent >= r*1.5 { rTarget = r*-2; }
		if rCurrent <= r*-1.5 { rTarget = r*2; }
		rCurrent = lerp(rCurrent, rTarget, 0.015);
		break;
	case "Box":
		physics_apply_torque(size*0.25);
		break;
	case "Triangle":
		break;
}