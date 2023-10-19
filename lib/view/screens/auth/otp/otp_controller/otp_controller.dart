import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/view/screens/auth/otp/otp_model/otp_model.dart';
import 'package:renti_user/view/screens/auth/otp/otp_repo/otp_repo.dart';

class OtpController extends GetxController {

  OTPRepo otpRepo;
  OtpController({required this.otpRepo});

  bool isSubmit = false;
  bool signUp = true;

  OtpModel otpModel = OtpModel();

  TextEditingController otpController = TextEditingController();

  Future<void> verifyOtpResponse(String email, bool fromForgetScreen) async {
    isSubmit = true;
    update();

    ApiResponseModel responseModel = await otpRepo.verifyEmail(email: email, otpCode: otpController.text.trim());

    if (responseModel.statusCode == 200) {
      otpModel = OtpModel.fromJson(jsonDecode(responseModel.responseJson));

      fromForgetScreen ? Get.offAndToNamed(AppRoute.newPassword) : Get.offAndToNamed(AppRoute.signInScreen);
    } else {}

    isSubmit = false;
    update();
  }
}
