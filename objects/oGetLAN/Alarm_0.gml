if global.serverIP == "" 
{
	show_message_async( "Unable to retrieve settings! Please check your LAN connection.");
	alarm[0] = 600;
}