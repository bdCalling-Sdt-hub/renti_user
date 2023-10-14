import 'package:get/get.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/service/socket_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> initDependency() async{

  final sharedPreference = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreference, fenix: true);
  Get.lazyPut(() => ApiService(sharedPreferences: Get.find()), fenix: true);
  Get.lazyPut(() => SocketService(), fenix: true);
}