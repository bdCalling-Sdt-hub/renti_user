import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/helper/shared_preference_helper.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/view/screens/profile/profile_settings/profile_settings_model/profile_settings_model.dart';
import 'package:renti_user/view/screens/profile/profile_settings/profile_settings_repo/profile_settings_repo.dart';

class ProfileSettingsController extends GetxController {
  ProfileSettingsRepo profileSettingsRepo;
  ProfileSettingsController({required this.profileSettingsRepo});

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  final FocusNode nameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode addressFocusNode = FocusNode();

  bool isSubmit = false;

  Future<void> profileSettingsResult() async {
    isSubmit = true;
    update();

    ApiResponseModel responseModel =
        await profileSettingsRepo.profileSettingsResponse(
      name: nameController.text.toString(),
      email: emailController.text.toString(),
      phone: phoneController.text.toString(),
      address: addressController.text.toString(),
    );

    print("status code : ${responseModel.statusCode}");

    if (responseModel.statusCode == 200) {
      ProfileSettingsModel profileSettingsModel =
      ProfileSettingsModel.fromJson(jsonDecode(responseModel.responseJson));
      print("data: ${profileSettingsModel.user.toString()}");

      await profileSettingsRepo.apiService.sharedPreferences.setString(SharedPreferenceHelper.userEmailKey, emailController.text.trim());
      await profileSettingsRepo.apiService.sharedPreferences.setString(SharedPreferenceHelper.userPhoneNumberKey, phoneController.text.trim());
      await profileSettingsRepo.apiService.sharedPreferences.setString(SharedPreferenceHelper.userNameKey, nameController.text.trim());
      await profileSettingsRepo.apiService.sharedPreferences.setString(SharedPreferenceHelper.address, addressController.text.trim());
      isSubmit = false;
      update();
      Get.offAllNamed(AppRoute.homeScreen);
    } else {
      isSubmit = false;
      update();
    }

    isSubmit = false;
    update();
  }
}
