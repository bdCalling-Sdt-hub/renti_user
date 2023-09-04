import 'package:get/get.dart';
import 'package:renti_user/view/screens/carlist/luxurycars/luxury_cars.dart';
import 'package:renti_user/view/screens/carlist/offercarscreen/car_list_screen.dart';

import '../../view/screens/rentreqpaymentendtripreview/endtrip/end_trip_screen.dart';
import '../../view/screens/rentreqpaymentendtripreview/rentrequest/rent_request_Screen.dart';
import '../../view/screens/rentreqpaymentendtripreview/starttrip/start_trip_screen.dart';



class AppRoute {

  static  String rentRequest = "/Rent_Request_Screen";
  static  String startTrip = "/startTripScreen";
  static  String endTrip = "/EndTripScreen";
  static  String offerCarScreen = "/offerCarScreen";
  static  String luxuryCars= "/Luxurycars";
  static List<GetPage> routes = [

    GetPage(name: rentRequest, page: ()=> RentRequestScreen()),
    GetPage(name: startTrip, page: ()=> StartTripScreen()),
    GetPage(name: endTrip, page: ()=> EndTripScreen()),
    GetPage(name: offerCarScreen, page: ()=> OfferCarScreen()),
    GetPage(name: luxuryCars, page: ()=> LuxuryCarsScreen()),


  ];
}