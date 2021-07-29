isMoving = false;
speedCurrent = 0;
speedMax = 30;
isBoosting = false;
boostCurrent = 0;
boostMax = 30;

mxPrev = mouse_x;
myPrev = mouse_y;

canBounce = false;

if !ds_list_empty(global.controllers)
{
	gamePad = global.controllers[| 0];
}
else
{
	gamePad = -1;
}

hSpeed = 0;
vSpeed = 0;
hAxis = 0;
vAxis = 0;
dir = "E";

mTimer = 0;