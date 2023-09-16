import 'package:get/get.dart';
import 'package:renti_user/view/screens/auth/forgot_password/forgot_password_screen.dart';
import 'package:renti_user/view/screens/auth/kyc/kyc_screen.dart';
import 'package:renti_user/view/screens/auth/new_password/new_password_screen.dart';
import 'package:renti_user/view/screens/auth/otp/otp_screen.dart';
import 'package:renti_user/view/screens/auth/select_photo/select_photo_screen.dart';
import 'package:renti_user/view/screens/auth/sign_in/sign_in_screen.dart';
import 'package:renti_user/view/screens/auth/sign_up/sign_up_screen.dart';
import 'package:renti_user/view/screens/auth/signup_continue/sign_up_continue_screen.dart';
import 'package:renti_user/view/screens/car_list/luxury_cars/luxury_cars_screen.dart';
import 'package:renti_user/view/screens/car_select/select_car/car_details_screen.dart';
import 'package:renti_user/view/screens/home/home_screen.dart';
import 'package:renti_user/view/screens/intro/intro_screen.dart';
import 'package:renti_user/view/screens/message/inbox/inbox_screen.dart';
import 'package:renti_user/view/screens/message/messages/messages_screen.dart';
import 'package:renti_user/view/screens/payment_method/add_card/add_card_screen.dart';
import 'package:renti_user/view/screens/payment_method/payment_edit_card/payment_edit_card_screen.dart';
import 'package:renti_user/view/screens/payment_method/payment_method/payment_method_screen.dart';
import 'package:renti_user/view/screens/profile/profile_details/profile_details_screen.dart';
import 'package:renti_user/view/screens/profile/profile_settings/profile_settings_screen.dart';
import 'package:renti_user/view/screens/rent_history/rent_history_screen.dart';
import 'package:renti_user/view/screens/rent_request_payment/rent_request_Screen.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/about_us/about_us_screen.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/how_renti_works/renti_works_screen.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/private_policy/private_policy_screen.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/support/support_screen.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/terms&conditions/terms_conditions_screen.dart';
import 'package:renti_user/view/screens/search/search_screen.dart';
import 'package:renti_user/view/screens/select_language/select_language_screen.dart';
import 'package:renti_user/view/screens/settings/change_language/change_language_screen.dart';
import 'package:renti_user/view/screens/settings/change_password/change_password_screen.dart';
import 'package:renti_user/view/screens/settings/settings/settings_screen.dart';
import 'package:renti_user/view/screens/trip/end_trip/end_trip_screen.dart';
import 'package:renti_user/view/screens/trip/star_trip/start_trip_screen.dart';
import '../../view/screens/car_list/offer_car/offer-car_screen.dart';

class AppRoute {

  static  String rentRequest = "/rent_request_screen";
  static  String homeScreen = "/home_screen";
  static  String searchScreen = "/search_screen";
  static  String startTrip = "/start_trip_screen";
  static  String endTrip = "/end_trip_screen";
  static  String offerCarScreen = "/offer_car_screen";
  static  String luxuryCars= "/luxury_cars";
  static  String inboxScreen= "/inbox_screen";
  static const String messageScreen = "/message_screen";
  static const String cancelShowDialog = "/cancel_show_dialog";
  static const String splashScreen = "/splash_screen";
  static const String selectLanguageScreen = "/select_language_screen";
  static const String signInScreen = "/signin_screen";
  static const String signUpScreen = "/sign_up_screen";
  static const String signUpContinueScreen = "/sign_up_continue_screen";
  static const String kycScreen = "/kyc_screen";
  static const String selectPhoto = "/select_photo_screen";
  static const String forgotPasswordScreen = "/forgot_password_screen";
  static const String otpScreen = "/otp_screen";
  static const String newPassword = "/new_password";
  static const String profileDetails = "/profile_details";
  static const String profileSettingsScreen = "/profile_settings_screen";
  static const String rentiWorks = "/renti_works_screen";
  static const String support = "/support_screen";
  static const String aboutUs = "/about_us_screen";
  static const String termsConditions = "/terms_condiotions_screen";
  static const String privacyPolicy = "/privacy_policy_screen";
  static const String settings = "/settings_screen";
  static const String changeLanguage = "/change_language_screen";
  static const String changePassword = "/change_password_screen";
  static const String paymentMethod = "/payment_method_screen";
  static const String addCard = "/add_card_screen";
  static const String paymentEditCard = "/payment_edit_card";
  static const String rentiHistory = "/renti_history_screen";
  static const String carDetails = "/car_details_screen";
  static List<GetPage> routes = [
    GetPage(name: rentRequest, page: ()=> const RentRequestScreen()),
    GetPage(name: startTrip, page: ()=> const StartTripScreen()),
    GetPage(name: endTrip, page: ()=> const EndTripScreen()),
    GetPage(name: offerCarScreen, page: ()=> const OfferCarScreen()),
    GetPage(name: inboxScreen, page: ()=> const InboxScreen()),
    GetPage(name: messageScreen, page: ()=> const MessageScreen()),
    GetPage(name:luxuryCars , page: ()=>const LuxuryCarsScreen()),
    GetPage(name: splashScreen, page: ()=> const IntroScreen()),
    GetPage(name: selectLanguageScreen, page: ()=>const SelectLanguageScreen()),
    GetPage(name: signInScreen, page: ()=>const SignInScreen()),
    GetPage(name: signUpScreen, page: ()=>const SignUpScreen()),
    GetPage(name: signUpContinueScreen, page: ()=>const SignUpContinueScreen()),
    GetPage(name: kycScreen, page: ()=>const KYCScreen()),
    GetPage(name: selectPhoto, page: ()=>const SelectPhotoScreen()),
    GetPage(name: forgotPasswordScreen, page: ()=>const ForgotPasswordScreen()),
    GetPage(name: otpScreen, page: ()=>const ForgotPassOTP()),
    GetPage(name: newPassword, page: ()=>const NewPasswordScreen()),
    GetPage(name: profileDetails, page: ()=>const ProfileDetailsScreen()),
    GetPage(name: profileSettingsScreen, page: ()=>const ProfileSettingsScreen()),
    GetPage(name: rentiWorks, page: ()=>const RentiWorksScreen()),
    GetPage(name: support, page: ()=>const SupportScreen()),
    GetPage(name: aboutUs, page: ()=>const AboutUsScreen()),
    GetPage(name: termsConditions, page: ()=>const TermsConditionsScreen()),
    GetPage(name: privacyPolicy, page: ()=>const PrivatePolicyScreen()),
    GetPage(name: settings, page: ()=>const SettingsScreen()),
    GetPage(name: changeLanguage, page: ()=>const ChangeLanguageScreen()),
    GetPage(name: changePassword, page: ()=>const ChangePasswordScreen()),
    GetPage(name: paymentMethod, page: ()=>const PaymentMethodScreen()),
    GetPage(name: addCard, page: ()=>const AddCardScreen()),
    GetPage(name: paymentEditCard, page: ()=>const PaymentEditCardScreen()),
    GetPage(name: carDetails, page: ()=>const CarDetailsScreen()),
    GetPage(name: rentiHistory, page: ()=>const RentHistoryScreen()),
    GetPage(name: homeScreen, page: ()=>const HomeScreen()),
    GetPage(name: searchScreen, page: ()=>const SearchScreen()),
  ];
}