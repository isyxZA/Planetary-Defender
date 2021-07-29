buffer_seek(bbuffer, buffer_seek_start, 0);
buffer_write(bbuffer, buffer_u32   , global.serverPort);
buffer_write(bbuffer, buffer_string, global.serverName);
network_send_broadcast(tcp_temp, 50002, bbuffer, buffer_tell(bbuffer));
alarm[1] = 60;