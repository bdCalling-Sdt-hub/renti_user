import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:renti_user/core/route/app_route.dart%20';
import 'package:renti_user/service/socket_service.dart';
import 'core/di_service/dependency_injection.dart' as di;


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.initDependency();

  final socketService = SocketService();
  socketService.connectToSocket();

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
       debugShowCheckedModeBanner: false,
       defaultTransition: Transition.noTransition,
       initialRoute: AppRoute.introScreen,
       navigatorKey: Get.key,
       transitionDuration: const Duration(milliseconds: 200),
       getPages: AppRoute.routes,
    );
  }
}

