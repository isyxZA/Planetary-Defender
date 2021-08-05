if blink 
{ 
	blink = false;
	activeColor = eColor; 
}
else 
{ 
	blink = true;
	activeColor = bColor; 
}

alarm[0] = room_speed * 0.6;