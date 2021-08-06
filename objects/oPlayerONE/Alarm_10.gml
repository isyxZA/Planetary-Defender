/// @description Assign Controller
if !ds_list_empty(global.controllers)
{
	gamePad = global.controllers[| 0];
	playerInput = "GAMEPAD";
}
else
{
	gamePad = -1;
	playerInput = "KEYBOARD";
}