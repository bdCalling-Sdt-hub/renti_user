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
    print("respone: $responseModel");

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