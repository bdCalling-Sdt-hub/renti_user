import 'package:get/get.dart';
import 'package:renti_user/view/screens/car_list/luxury_cars/luxury_cars_screen.dart';
import 'package:renti_user/view/screens/message/inbox/inbox_screen.dart';
import 'package:renti_user/view/screens/message/messages/messages_screen.dart';
import 'package:renti_user/view/screens/rent_request_payment/rent_request_Screen.dart';
import 'package:renti_user/view/screens/trip/end_trip/end_trip_screen.dart';
import 'package:renti_user/view/screens/trip/star_trip/start_trip_screen.dart';


import '../../view/screens/car_list/offer_car/offer-car_screen.dart';
class AppRoute {

  static  String rentRequest = "/Rent_Request_Screen";
  static  String startTrip = "/startTripScreen";
  static  String endTrip = "/EndTripScreen";
  static  String offerCarScreen = "/offerCarScreen";
  static  String luxuryCars= "/Luxurycars";
  static  String inboxScreen= "/InboxScreen";
  static const String messageScreen = "/message_screen";
  static const String cancelShowDialog = "/CancelShowDialog";

  static List<GetPage> routes = [
    GetPage(name: rentRequest, page: ()=> const RentRequestScreen()),
    GetPage(name: startTrip, page: ()=> const StartTripScreen()),
    GetPage(name: endTrip, page: ()=> const EndTripScreen()),
    GetPage(name: offerCarScreen, page: ()=> const OfferCarScreen()),
    GetPage(name: inboxScreen, page: ()=> const InboxScreen()),
    GetPage(name: messageScreen, page: ()=> const MessageScreen()),
    GetPage(name:luxuryCars , page: ()=>const LuxuryCarsScreen()),


  ];
}