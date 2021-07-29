broadcast_server = network_create_server(network_socket_udp, 50002, 2);
tcp_temp = network_create_server(network_socket_tcp, global.serverPort, 2);
bbuffer = buffer_create(64, buffer_fixed, 1);

alarm[0] = 600;
alarm[1] = 60;