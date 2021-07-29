/// @description  UDP server code - Detect servers "broadcast"
var eventid = ds_map_find_value(async_load, "id");

if eventid == broadcast_server {
	var ip = ds_map_find_value(async_load, "ip");
	global.serverIP = ip;
	network_destroy(broadcast_server);
	instance_destroy();
}