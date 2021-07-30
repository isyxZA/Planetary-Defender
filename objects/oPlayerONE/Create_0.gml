isMoving = false;
speedCurrent = 0;
speedMax = 40;
isBoosting = false;
boostCurrent = 0;
boostMax = 40;

mxPrev = mouse_x;
myPrev = mouse_y;

shootPrimary = false;
firePrimary = true;
shootSecondary = false;
fireSecondary = true;

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

aImage = 0;
alarm[0] = room_speed * 0.1;