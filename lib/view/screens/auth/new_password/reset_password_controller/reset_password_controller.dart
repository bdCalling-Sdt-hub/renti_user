import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/utils/app_utils.dart';
import 'package:renti_user/view/screens/auth/new_password/reset_password_model/reset_password_model.dart';
import 'package:renti_user/view/screens/auth/new_password/reset_password_repo/reset_password_repo.dart';

class ResetPasswordController extends GetxController{

  ResetPasswordRepo repo;
  ResetPasswordController({required this.repo});

  bool isSubmit = false;

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  ResetPasswordModel model = ResetPasswordModel();

  final formKey = GlobalKey<FormState>();

  resetPassword() async{

    isSubmit = true;
    update();

    ApiResponseModel responseModel = await repo.resetPassword(password: passwordController.text);
    if(responseModel.statusCode == 200){
      model = ResetPasswordModel.fromJson(jsonDecode(responseModel.responseJson));
    }

    AppUtils.successToastMessage(model.message ?? "Password reset successfully");
    Get.offAllNamed(AppRoute.signInScreen);

    isSubmit = false;
    update();
  }
}