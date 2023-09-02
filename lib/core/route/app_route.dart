import 'package:get/get.dart';

import '../../view/screens/rentrequest/rent_request_Screen.dart';


class AppRoute {

  static const String rentRequest = "/Rent_Request_Screen";

  static List<GetPage> routes = [

    GetPage(name: rentRequest, page: ()=>const RentRequestScreen()),

  ];
}