import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

import 'package:renti_user/core/route/app_route.dart';

import 'package:renti_user/service/notification.dart';
import 'package:renti_user/service/socket_service.dart';
import 'package:renti_user/view/screens/settings/change_language/translator.dart';
import 'core/di_service/dependency_injection.dart' as di;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =  FlutterLocalNotificationsPlugin();

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  Stripe.publishableKey = "pk_test_51NrcLcSJXOqjAG5dxabD5XzUNXE0S3xjn4tFp8aJqZZR4SsQOCZ3SM9MNTbFgCYopG7R8d0XcgvvY9AM6SIxCQKX00mzWSTRUm";
  await di.initDependency();

  SocketService service = Get.put(SocketService());
  service.connectToSocket();
  service.listenNotification();

  await NotificationHelper.initLocalNotification();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale("en", "US"),
      //locale: Get.find<LanguageController>().language.val ? const Locale("es" , "US") : const Locale("fr", "MX"),
      fallbackLocale: const Locale("en", "US"),
      translations: Language(),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.noTransition,
      transitionDuration: const Duration(milliseconds: 200),
      initialRoute: AppRoute.introScreen,
      navigatorKey: Get.key,
      getPages: AppRoute.routes,
    );
  }
}
