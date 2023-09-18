import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/helper/shared_preference_helper.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/view/screens/auth/sign_in/sign_in_model/sign_in_response_model.dart';
import 'package:renti_user/view/screens/auth/sign_in/sign_in_repo/sign_in_repo.dart';

class SignInController extends GetxController{

  SignInController({required this.signInRepo});

  SignInRepo signInRepo;

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool remember = false;
  bool isSubmit = false;

  Future<void> signInUser() async{

    isSubmit = true;
    update();

    ApiResponseModel responseModel = await signInRepo.signInUser(email: emailController.text.toString(), password: passwordController.text.toString());
    print("respone: ${responseModel.responseJson.toString()}");

    if(responseModel.statusCode == 200){
      SignInResponseModel signInResponseModel = SignInResponseModel.fromJson(jsonDecode(responseModel.responseJson));
      await gotoNextStep(signInResponseModel);
    }
    else{

    }

    isSubmit = false;
    update();
  }

  gotoNextStep(SignInResponseModel signInResponseModel) async{

    bool emailVerification = signInResponseModel.user?.emailVerified == false ? false : true;

    if(remember){
      await signInRepo.apiService.sharedPreferences.setBool(SharedPreferenceHelper.rememberMeKey, true);
    }
    else{
      await signInRepo.apiService.sharedPreferences.setBool(SharedPreferenceHelper.rememberMeKey, false);
    }

    await signInRepo.apiService.sharedPreferences.setString(SharedPreferenceHelper.userIdKey, signInResponseModel.user?.id.toString() ?? "");
    await signInRepo.apiService.sharedPreferences.setString(SharedPreferenceHelper.accessTokenKey, signInResponseModel.accessToken ?? "");
    await signInRepo.apiService.sharedPreferences.setString(SharedPreferenceHelper.accessTokenType, "Bearer");
    await signInRepo.apiService.sharedPreferences.setString(SharedPreferenceHelper.userEmailKey, signInResponseModel.user?.email.toString() ?? "");
    await signInRepo.apiService.sharedPreferences.setString(SharedPreferenceHelper.userPhoneNumberKey, signInResponseModel.user?.phoneNumber.toString() ?? "");
    await signInRepo.apiService.sharedPreferences.setString(SharedPreferenceHelper.userNameKey, signInResponseModel.user?.fullName.toString() ?? "");

    if(emailVerification == false){
      Get.offAndToNamed(AppRoute.signInScreen);
    }
    else{
      Get.offAndToNamed(AppRoute.homeScreen);
    }

    if(remember){
      changeRememberMe();
    }
  }

  changeRememberMe() {
    remember = !remember;
    update();
  }

  clearData() {

    remember = false;
    isSubmit = false;
    emailController.text = "";
    passwordController.text = "";
  }
}

/*class LogInController extends GetxController{

  // LoginRepository loginRepository;

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  //LogInController({required this.loginRepository});
  Future<void> loginUser() async {
    loading = true.obs;
    try {
      loading = true.obs;
      // API endpoint URL
      final apiUrl = Uri.parse('http://103.161.9.106:3001/api/user/sign-in');

      // User credentials
      final credentials = {
        "email": emailController.value.text,
        "password": passwordController.value.text,
      };

      // Make a POST request to the login API
      final response = await http.post(apiUrl, body: credentials);

      loading = false.obs;
      // Check if the response is successful
      if (response.statusCode == 200) {
        loading = false.obs;
        if (kDebugMode) {
          print(response.statusCode);
        }
        final responseData = jsonDecode(response.body);
        final accessToken = responseData['accessToken'];

        // Save the access token using shared_preferences
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('accessToken', accessToken);
        if (kDebugMode) {
          print(response.body);
        }
        if (kDebugMode) {
          print(prefs.getString("accessToken"));
        }
        // Navigate to the next screen (Home Page)
        //Get.toNamed(AppRoute.navigation);
        //Utils.toastMessage("Successfully Signed In");
        if (kDebugMode) {
          print("Successfully Signed In");
        }
      } else {
        // Handle login failure (e.g., show an error message)
        if (kDebugMode) {
          print('Login failed: ${response.body}');
        }
        // You can show an error message here if needed
        //Utils.toastMessage("Authentication failed");
      }
    } catch (error) {
      // Handle any network or other errors
      if (kDebugMode) {
        print('Error occurred: $error');
      }
      // You can show an error message here if needed
      //Utils.snackBar("ERROR", "$error");
    }
  }
}*/
