/// @description Creates the server.
//global.serverIP   = "192.168.8.102";
//global.serverPort = 50000;
//global.serverName = "Ikes Test Server";
//Create server
//global.server = network_create_server(network_socket_tcp,global.server_port,2);

//Create list of connected clients
global.clients  = ds_list_create();
//Create server buffer
global.sbuffer  = buffer_create(1024,buffer_grow,1);

//When using LAN this will broadcast the game for others on the network to find and join
broadcast_buffer = buffer_create(64, buffer_fixed, 1);
//alarm[0] = 60;

locked = false;
greenLight = false;

instance_create_layer(0, 0, "Buttons", oServerCreate);