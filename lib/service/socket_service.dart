import 'package:socket_io_client/socket_io_client.dart';

class SocketService{

  static SocketService? instance;
  late Socket socket;

  factory SocketService() {
    instance ??= SocketService.internal();
    return instance!;
  }

  SocketService.internal() {

    socket = io('http://192.168.10.14:9000',
        OptionBuilder().setTransports(['websocket']).build()
    );
    socket.connect();
  }

  void emit(String event, dynamic data) {
    socket.emit(event, data);
  }

  void disconnect() {
    socket.disconnect();
  }
}