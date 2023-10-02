import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/helper/shared_preference_helper.dart';
import 'package:renti_user/view/screens/profile/profile_settings/profile_settings_repo/profile_settings_repo.dart';

class ProfileSettingsController extends GetxController{

  ProfileSettingsRepo profileSettingsRepo;
  ProfileSettingsController({required this.profileSettingsRepo});

  bool isLoading = false;
  bool isSubmit = false;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  File? imageFile;

  updateProfile() async{
    isSubmit = true;
    update();

    await profileSettingsRepo.updateUser(
        username: fullNameController.text,
        email: emailController.text,
        phoneNumber: "+52 ${phoneNumberController.text}",
        address: addressController.text,
        //imageFile: imageFile!
    );

    await profileSettingsRepo.apiService.sharedPreferences.setString(SharedPreferenceHelper.address, addressController.text);

    print("Profile update successfully");

    isSubmit = false;
    update();
  }

  loadData() async{
    isLoading = true;
    update();

    fullNameController.text = profileSettingsRepo.apiService.sharedPreferences.getString(SharedPreferenceHelper.userNameKey) ?? "";
    emailController.text = profileSettingsRepo.apiService.sharedPreferences.getString(SharedPreferenceHelper.userEmailKey) ?? "";
    phoneNumberController.text = profileSettingsRepo.apiService.sharedPreferences.getString(SharedPreferenceHelper.userPhoneNumberKey) ?? "";
    addressController.text = profileSettingsRepo.apiService.sharedPreferences.getString(SharedPreferenceHelper.address) ?? "";

    isLoading = false;
    update();
  }
}