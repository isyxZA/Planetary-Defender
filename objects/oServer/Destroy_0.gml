/// @description Destroys the server.
//Destroys the server connection.
network_destroy(global.server);
global.server = -1;
//Deletes the storage buffer.
buffer_delete(global.sbuffer);
buffer_delete(broadcast_buffer);
//Deletes the list of connections.
ds_list_destroy(global.clients);

global.serverIP   = undefined;
global.serverPort = undefined;
global.serverName = undefined;

if instance_exists(oServerCreate) { with oServerCreate { instance_destroy(); } }