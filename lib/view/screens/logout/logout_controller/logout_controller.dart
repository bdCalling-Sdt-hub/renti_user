import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/helper/shared_preference_helper.dart';
import 'package:renti_user/core/route/app_route.dart%20';
import 'package:renti_user/utils/app_utils.dart';
import 'package:renti_user/view/screens/auth/sign_in/sign_in_controller/sign_in_controller.dart';
import 'package:renti_user/view/screens/logout/logout_model/logout_model.dart';
import 'package:renti_user/view/screens/logout/logout_repo/logout_repo.dart';

class LogoutController extends GetxController{

  LogoutRepo repo;
  LogoutController({required this.repo});

  // TextEditingController currentPasswordController = TextEditingController();
  // TextEditingController newPasswordController = TextEditingController();
  // TextEditingController confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();


  bool isSubmit = false;

  Future<void> logout() async{
    isSubmit = true;
    update();

    ApiResponseModel responseModel = await repo.userLogout();

    if(responseModel.statusCode == 200){

      LogoutModel model = LogoutModel.fromJson(jsonDecode(responseModel.responseJson));
      AppUtils.successToastMessage(model.message ?? "Logout Successfully");

    }


    await clearSharedPrefData();
    Get.offAllNamed(AppRoute.signInScreen);

    isSubmit = false;
    update();
  }

  Future<void> clearSharedPrefData()async{
    await repo.apiService.sharedPreferences.setString(SharedPreferenceHelper.fullName, '');
    await repo.apiService.sharedPreferences.setString(SharedPreferenceHelper.email, '');
    await repo.apiService.sharedPreferences.setString(SharedPreferenceHelper.accessTokenType, '');
    await repo.apiService.sharedPreferences.setString(SharedPreferenceHelper.accessTokenKey, '');
    await repo.apiService.sharedPreferences.setBool(SharedPreferenceHelper.rememberMeKey, false);
    return Future.value();
  }

}
