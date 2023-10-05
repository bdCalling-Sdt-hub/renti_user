import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/utils/app_utils.dart';
import 'package:renti_user/view/screens/auth/forgot_password/forget_password_repo/forget_password_repo.dart';
import 'package:renti_user/view/screens/auth/forgot_password/forget_pssword_model/forget_password_model.dart';

class ForgetPasswordController extends GetxController{

  ForgetPasswordRepo forgetPasswordRepo;
  ForgetPasswordController({required this.forgetPasswordRepo});

  bool isSubmit = false;
  ForgetPasswordModel forgetPasswordModel = ForgetPasswordModel();

  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  verifyEmail() async{
    isSubmit = true;
    update();

    ApiResponseModel responseModel = await forgetPasswordRepo.passEmail(email: emailController.text);
    if(responseModel.statusCode == 201){
      forgetPasswordModel = ForgetPasswordModel.fromJson(jsonDecode(responseModel.responseJson));
    }

    AppUtils.successToastMessage("Send verify code at your email");
    gotoNext();
    isSubmit = false;
    update();
  }

  void gotoNext() {
    Get.toNamed(AppRoute.otpScreen, arguments: [emailController.text.toString(), true]);
  }
}