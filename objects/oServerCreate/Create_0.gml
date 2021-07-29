//Text input box setup
halfWidth = room_width * 0.6;
halfHeight = room_height * 0.5;
InitInputBox(halfWidth-150, halfHeight-12, halfWidth+150, halfHeight+12, 4, 4, 292, fnt12, false, fnt12, "*", "", false, 20);

canInput = true;

instance_create_layer(0, 0, "Buttons", oGetLAN);