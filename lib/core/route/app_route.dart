import 'package:get/get.dart';
import 'package:renti_user/view/screens/home/home_screen.dart';
import 'package:renti_user/view/screens/search/search_screen.dart';

import '../../view/screens/splash/splash_screen.dart';

class AppRoute {

  static const String homeScreen = "/home_screen";
  static const String searchScreen = "/search_screen";

  static List<GetPage> routes = [

    GetPage(name: homeScreen, page: ()=>const HomeScreen()),
    GetPage(name: searchScreen , page: ()=> const SearchScreen()),


  ];
}