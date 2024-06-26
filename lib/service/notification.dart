
import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:renti_user/view/screens/notification/notification_screen.dart';

import '../core/route/app_route.dart';



class NotificationHelper {
 static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =  FlutterLocalNotificationsPlugin();

  static Future<void> initLocalNotification() async {
    var androidInitializationSettings =
    const AndroidInitializationSettings("@mipmap/ic_launcher");
    var iosInitializationSettings = const DarwinInitializationSettings();

    var initializationSettings = InitializationSettings(
        android: androidInitializationSettings, iOS: iosInitializationSettings);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (payload) {
          print("Route") ;
          Get.to(const NotificationScreen()) ;
        });
  }

  static Future<void> showNotification(dynamic message) async {

    AndroidNotificationChannel channel = AndroidNotificationChannel(
        Random.secure().nextInt(10000).toString(),
        "High Importance Notification",
        importance: Importance.max);

    AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(channel.id, channel.name,
        channelDescription: "your channel Description",
        importance: Importance.high,
        priority: Priority.high,
        ticker: "ticker");

    DarwinNotificationDetails darwinNotificationDetails =
    const DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true);

    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);

    Future.delayed(Duration.zero, () {
      flutterLocalNotificationsPlugin.show(
          0,
          message["type"],
          message["message"],
          notificationDetails);
    });
  }
}


/*class NotificationHelper {
  static Future<void> initLocalNotification(FlutterLocalNotificationsPlugin fln) async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings("@mipmap/ic_launcher");
    var initializationSettingsIOS = const DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    fln.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();

    await fln.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse? paylod) async {
        try {
          Map<String, dynamic> payloadData;
          if (paylod != null && paylod.payload!.isNotEmpty) {
            payloadData = jsonDecode(paylod.payload!);
            debugPrint(
                "======> Initialize Local Notification payload : $payloadData");

            handleNotificationRedirection(payloadData);
          }
        } catch (error) {}
        return;
      },
    );
  }

  static Future<void> showNotification(
      {required Map<String, dynamic> body,
      required FlutterLocalNotificationsPlugin fln}) async {
    if (body['image'] != null) {
      try {
        await showBigPictureNotificationHiddenLargeIcon(
            body['message'], "", {}, body['image'], fln);
      } catch (error) {
        await showTextNotification(body['message'], "", {}, fln);
      }
    } else {
      await showBigTextNotification(body['message'], "", {}, fln);
    }
  }

// <-------------------------- Show Text Notification  --------------------------->


  static Future<void> showTextNotification(
      String title,
      String body,
      Map<String, dynamic>? notificationBody,
      FlutterLocalNotificationsPlugin fln) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'notification', // meta-data android value
      'notification', // meta-data android value
      playSound: true,
      importance: Importance.max,
      priority: Priority.high,
    );

    var iOSPlatformChannelSpecifics = const DarwinNotificationDetails(
        presentAlert: true, presentBadge: true, presentSound: true);

    NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await fln.show(0, title, body, platformChannelSpecifics,
        payload:
            notificationBody != null ? jsonEncode(notificationBody) : null);
  }
// <-------------------------- Show Big Text Notification  --------------------------->

  static Future<void> showBigTextNotification(
      String title,
      String body,
      Map<String, dynamic>? notificationBody,
      FlutterLocalNotificationsPlugin fln) async {
    BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
      body,
      htmlFormatBigText: true,
      contentTitle: title,
      htmlFormatContentTitle: true,
    );
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'notification',
      'notification',
      importance: Importance.max,
      styleInformation: bigTextStyleInformation,
      priority: Priority.max,
      playSound: true,
    );
    NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await fln.show(0, title, body, platformChannelSpecifics,
        payload:
            notificationBody != null ? jsonEncode(notificationBody) : null);
  }

// <-------------------------- Show Big Picture Notification Hiden largeIcon --------------------------->

  static Future<void> showBigPictureNotificationHiddenLargeIcon(
      String title,
      String body,
      Map<String, dynamic>? notificationBody,
      String image,
      FlutterLocalNotificationsPlugin fln) async {
    final String largeIconPath = await _downloadAndSaveFile(image, 'largeIcon');
    final String bigPicturePath =
        await _downloadAndSaveFile(image, 'bigPicture');
    final BigPictureStyleInformation bigPictureStyleInformation =
        BigPictureStyleInformation(
      FilePathAndroidBitmap(bigPicturePath),
      hideExpandedLargeIcon: true,
      contentTitle: title,
      htmlFormatContentTitle: true,
      summaryText: body,
      htmlFormatSummaryText: true,
    );
    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'notification',
      'notification',
      largeIcon: FilePathAndroidBitmap(largeIconPath),
      priority: Priority.max,
      playSound: true,
      styleInformation: bigPictureStyleInformation,
      importance: Importance.max,
    );
    final NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await fln.show(0, title, body, platformChannelSpecifics,
        payload:
            notificationBody != null ? jsonEncode(notificationBody) : null);
  }

  static Future<String> _downloadAndSaveFile(
      String url, String fileName) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String filePath = '${directory.path}/$fileName';
    final http.Response response = await http.get(Uri.parse(url));
    final File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }

// <-------------------------- On Click Notification Screen Route --------------------------->

  static void handleNotificationRedirection(Map<String, dynamic> data) {
  }
}*/











