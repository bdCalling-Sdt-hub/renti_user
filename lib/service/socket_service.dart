import 'dart:convert';

import 'package:socket_io_client/socket_io_client.dart' as io;

import '../view/screens/message/inbox/inbox_model/Inbox_model.dart';
import '../view/screens/message/inbox/inbox_screen.dart';

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




// Define your Sender and Message classes here

   joinChat(String uid) {
    socket.emit('join-chat', {'uid': uid});

    socket.on('all-messages', (messages) {
      final jsonData = messages;

      final List<InboxMessage> parsedMessages = jsonData.map((messageData) => InboxMessage.fromJson(messageData)).toList();

      // Now you have a List of parsed Message objects
      for (InboxMessage message in parsedMessages) {
        print('Message ID: ${message}');
        print('Message Content: ${message.message}');
        // Access other message properties as needed
      }
    });
  }


  addNewMessage(String message, String sender, String chat) {
    socket.emit('add-new-message', {
      "message": message, "sender" : sender, "chat" : chat
    });

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