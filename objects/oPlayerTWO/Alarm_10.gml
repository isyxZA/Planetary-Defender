//Assign Controller
if !ds_list_empty(global.controllers) && ds_list_size(global.controllers > 1)
{
	gamePad = global.controllers[| 1];
	playerInput = "GAMEPAD";
}
else
{
	gamePad = -1;
	playerInput = "KEYBOARD";
}