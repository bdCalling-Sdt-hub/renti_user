import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketService {
  late io.Socket socket;

  void connectToSocket() {
    socket = io.io(
        "http://192.168.10.14:9000",
        io.OptionBuilder().setTransports(['websocket']).enableAutoConnect().build()
    );
    socket.onConnect((data) => print("Connection Established"));
    socket.onConnectError((data) => print("Connection Error"));

    socket.connect();
  }

  void joinRoom(String chatId) {
    socketEmit('join-room', {'chatId': chatId});
  }

  void socketEmit(String event, dynamic data) {
    socket.emit(event, data);
  }

  void socketOn(String event, dynamic Function(dynamic) handler) {
    socket.on(event, handler);
  }

  void disconnect() {
    socket.disconnect();
  }
}