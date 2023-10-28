import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketService extends GetxController{

   late  io.Socket socket;

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
    socket.on('all-messages', (messages) {});
  }

  addNewMessage(String message, String sender, String chat) {
    if(message.isNotEmpty){
      socket.emit('add-new-message', {"message": message, "sender" : sender, "chat" : chat});
    }
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