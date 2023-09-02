import 'package:get/get.dart';
import 'package:renti_user/view/screens/auth/forgot_password/forgot_password_screen.dart';
import 'package:renti_user/view/screens/auth/kyc/kyc_screen.dart';
import 'package:renti_user/view/screens/auth/select_photo/select_photo_screen.dart';
import 'package:renti_user/view/screens/auth/signin/sign_in_screen.dart';
import 'package:renti_user/view/screens/auth/signup/sign_up_screen.dart';
import 'package:renti_user/view/screens/auth/signup_continue/sign_up_continue_screen.dart';
import 'package:renti_user/view/screens/select_language/select_language_screen.dart';

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

  ];
}