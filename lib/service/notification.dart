import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationClass {
  //Bindings which needs to call from main.dart file

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void notificationBindings() async {
    WidgetsFlutterBinding.ensureInitialized();

     AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("@mipmap/ic_launcher");

     InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: null,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  //Show the Notification

  Future<void> showNotification(String message) async {
     AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'Resid-Host', //String channelId,

      'Host Notification', // String channelName,
      importance: Importance.max,
      priority: Priority.max,
    );

     NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0, // notification id
      'New Notification',
      message,
      platformChannelSpecifics,
    );
  }
}

// Channel ID: This is a unique string identifier for the notification channel.
//It's used to specify and differentiate the channel when creating and displaying notifications.
// Each channel ID should be unique to your app.
//You can choose a meaningful and descriptive name for the channel ID,
//typically related to the purpose or type of notifications it represents.

// Channel Name: This is a human-readable name for the notification channel.
// It's typically a user-friendly and descriptive name that is displayed in the system's
//notification settings, allowing users to understand the purpose of the channel.
//The channel name helps users decide how to prioritize and manage notifications.
