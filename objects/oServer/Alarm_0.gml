/// @description  Broadcast our location occasionally. Clients pick this up and can then display servers to the user. 
//Only broadcast when no client is connected and when in setup
var cc = ds_list_size(global.clients);
if cc == 0 {
	buffer_seek(broadcast_buffer, buffer_seek_start, 0);
	buffer_write(broadcast_buffer, buffer_u32, global.serverPort);
	buffer_write(broadcast_buffer, buffer_string, global.serverName);
	network_send_broadcast(global.server, 50001, broadcast_buffer, buffer_tell(broadcast_buffer));
}
if room == rmLobby {
	// Broadcast once a second...
	alarm[0] = 60;
}