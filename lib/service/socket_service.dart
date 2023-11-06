import 'package:get/get.dart';

import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketService extends GetxController{

  late io.Socket socket;

  List<dynamic> messageList = [];
  String chatId = "";
  List<dynamic> chatList = [];

  bool isLoading = false;

  void connectToSocket() {
    socket = io.io(
        "http://192.168.10.14:9000",
        io.OptionBuilder().setTransports(['websocket']).enableAutoConnect().build()
    );

    socket.onConnect((data) => print("Connection Established"));
    socket.onConnectError((data) => print("Connection Error"));

    socket.connect();

    socket.on('join-check', (data) {
      print("this is: $data");
    });

    socket.on('new-chat', (chat) {
      chatId = chat["_id"];
      joinChat(chatId);
      update();
    });

    socket.on('all-messages', (messages) {
      messageList.clear();
      isLoading = true;
      update();

      if(messages is List){
        for(var message in messages){
          if(message is Map<String, dynamic>){
            messageList.add(message);
          }
        }
      }

      isLoading = false;
      update();
    });

    socket.on('all-chats', (chats) {
      chatList.clear();
      isLoading = true;
      update();

      if(chats is List){
        for(var chat in chats){
          if(chat is Map<String, dynamic>){
            chatList.add(chat);
          }
        }
      }

      isLoading = false;
      update();
    });

    socket.on('host-notification', (data) {
      if (data == null) {
        print("No Data: $data");
      } else {
        // notificationClass.showNotification(data['allNotification'][0]['message']);
        print("This is  Data: $data");
        print("This is Data msg : ${data['allNotification'][0]['message']}");
      }
    });
  }

  void joinRoom(String uid) {
    socket.emit('join-room', {'uid': uid});
  }

  void addNewChat(Map chatInfo, String uid) {
    socket.emit('add-new-chat', {'chatInfo': chatInfo, "uid": uid});
  }

  joinChat(String uid) {
    socket.emit('join-chat', {'uid': uid});
  }

  addNewMessage(String message, String sender, String chat) {
    socket.emit('add-new-message', {"message": message, "sender": sender, "chat": chat});
  }

  getAllChats(String uid) {
    socket.emit('get-all-chats', {'uid': uid});
  }

  void getNotification(String uid) {
    socket.emit('join-room', {'uid': uid});
  }

  fetchAllChat({required Function(List<dynamic>) didFetchChats}){
    List<dynamic> preMessageList = messageList;
    didFetchChats(preMessageList);
  }

  void disconnect() {
    socket.disconnect();
  }
}
