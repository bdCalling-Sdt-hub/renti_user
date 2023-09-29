import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/helper/shared_preference_helper.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/view/screens/auth/otp/otp_model/otp_model.dart';
import 'package:renti_user/view/screens/auth/otp/otp_repo/otp_repo.dart';

class OtpController extends GetxController {
  VerifyOtpRepo verifyOtpRepo;
  OtpController({required this.verifyOtpRepo});

  bool isSubmit = false;
  TextEditingController otpController = TextEditingController();

  Future<void> verifyOtpResponse() async {
    isSubmit = true;
    update();
    ApiResponseModel responseModel = await verifyOtpRepo.verifyOtp(email: verifyOtpRepo.apiService.sharedPreferences.getString(SharedPreferenceHelper.email)??"", otp: otpController.text.trim());

    if (responseModel.statusCode == 200) {
      isSubmit = false;
      update();
      OtpModel otpModel = OtpModel.fromJson(jsonDecode(responseModel.responseJson));
      gotoNextStep(otpModel);
    } else {
      isSubmit = false;
      update();
    }
    isSubmit = false;
    update();
  }

  void gotoNextStep(OtpModel otpModel) {
    Get.offAndToNamed(AppRoute.homeScreen);
  }
}
