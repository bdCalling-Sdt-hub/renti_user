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

  void joinRoom(String uid) {
    socket.emit('join-room', {'uid': uid});

    socket.on('join-check', (data) {
      print(data);
    });
  }

  void addNewChat(Map chatInfo, String uid) {
    socket.emit('add-new-chat', {'chatInfo': chatInfo, "uid" : uid});

    socket.on('new-chat', (chat) {
      print('New chat created: $chat');
    });
  }

  joinChat(String uid) {
    socket.emit('join-chat', {'uid': uid});

    socket.on('all-messages', (messages) {
      print('All messages in the chat: $messages');
    });
  }

  addNewMessage(Map data) {
    socket.emit('add-new-message', data);

    socket.on('all-messages', (messages) {
      print('All messages in the chat: $messages');
    });
  }

  getAllChats(String uid) {
    socket.emit('get-all-chats', {'uid': uid});

    socket.on('all-chats', (chats) {
      print('All chats: $chats');
    });
  }

  void disconnect() {
    socket.disconnect();
  }
}