import 'package:get/get.dart';
import 'package:renti_user/view/screens/auth/forgot_password/forgot_password_screen.dart';
import 'package:renti_user/view/screens/auth/kyc/kyc_screen.dart';
import 'package:renti_user/view/screens/auth/new_password/new_password_screen.dart';
import 'package:renti_user/view/screens/auth/select_photo/select_photo_screen.dart';
import 'package:renti_user/view/screens/auth/signin/sign_in_screen.dart';
import 'package:renti_user/view/screens/auth/signup/sign_up_screen.dart';
import 'package:renti_user/view/screens/auth/signup_continue/sign_up_continue_screen.dart';
import 'package:renti_user/view/screens/payment_method/add_card/add_card_screen.dart';
import 'package:renti_user/view/screens/payment_method/payment_edit_card/payment_edit_card_screen.dart';
import 'package:renti_user/view/screens/payment_method/payment_method/payment_method_screen.dart';
import 'package:renti_user/view/screens/profile/profile_details/profile_details_screen.dart';
import 'package:renti_user/view/screens/profile/profile_settings/profile_settings_screen.dart';
import 'package:renti_user/view/screens/rent_history/rent_history_screen.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/about_us/about_us_screen.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/how_renti_works/renti_works_screen.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/private_policy/private_policy_screen.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/support/support_screen.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/terms&conditions/terms_conditions_screen.dart';
import 'package:renti_user/view/screens/select_language/select_language_screen.dart';
import 'package:renti_user/view/screens/settings/change_language/change_language_screen.dart';
import 'package:renti_user/view/screens/settings/change_password/change_password_screen.dart';
import 'package:renti_user/view/screens/settings/settings/settings_screen.dart';

import '../../view/screens/auth/otp/otp_screen.dart';
import '../../view/screens/splash/splash_screen.dart';

class AppRoute {

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
  static const String profilesettingsScreen = "/profile_settings_screen";
  static const String rentiWorks = "/renti_works_screen";
  static const String support = "/support_screen";
  static const String aboutUs = "/renti_works_screen";
  static const String terms_conditions = "/terms_condiotions_screen";
  static const String privacyPolicy = "/privacy_policy_screen";
  static const String settings = "/settings_screen";
  static const String changeLanguage = "/change_language_screen";
  static const String changePassword = "/change_password_screen";
  static const String paymentMethod = "/payment_method_screen";
  static const String addCard = "/add_card_screen";
  static const String paymentEditCard = "/payment_edit_card";
  static const String rentiHistory = "/renti_history_screen";

  static List<GetPage> routes = [

    GetPage(name: splashScreen, page: ()=>const SplashScreen()),
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
    GetPage(name: profilesettingsScreen, page: ()=>const ProfileSettingsScreen()),
    GetPage(name: rentiWorks, page: ()=>const RentiWorksScreen()),
    GetPage(name: support, page: ()=>const SupportScreen()),
    GetPage(name: aboutUs, page: ()=>const AboutUsScreen()),
    GetPage(name: terms_conditions, page: ()=>const TermsConditionsScreen()),
    GetPage(name: privacyPolicy, page: ()=>const PrivatePolicyScreen()),
    GetPage(name: settings, page: ()=>const SettingsScreen()),
    GetPage(name: changeLanguage, page: ()=>const ChangeLanguageScreen()),
    GetPage(name: changePassword, page: ()=>const ChangePasswordScreen()),
    GetPage(name: paymentMethod, page: ()=>const PaymentMethodScreen()),
    GetPage(name: addCard, page: ()=>const AddCardScreen()),
    GetPage(name: paymentEditCard, page: ()=>const PaymentEditCardScreen()),
    GetPage(name: rentiHistory, page: ()=>const RentHistoryScreen()),

  ];
}