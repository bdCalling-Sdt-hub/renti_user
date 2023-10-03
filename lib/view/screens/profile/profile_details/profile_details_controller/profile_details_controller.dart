import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/helper/shared_preference_helper.dart';
import 'package:renti_user/view/screens/profile/profile_details/profile_details_model/profile_details_model.dart';
import 'package:renti_user/view/screens/profile/profile_details/profile_details_repo/profile_details_repo.dart';
import 'package:renti_user/view/screens/profile/user_post_model/user_post_model.dart';
class ProfileDetailsController extends GetxController{

  ProfileDetailsRepo profileDetailsRepo;
  ProfileDetailsController({required this.profileDetailsRepo});

  bool isLoading = false;
  ProfileDetailsModel profileDetailsModel = ProfileDetailsModel();

  String username = "";
  String email = "";
  String dob = "";
  String phoneNumber = "";
  String address = "";
  
  String profileImage = "";

  void initialState() async{

    isLoading = true;
    update();

    await loadProfileData();

    isLoading = false;
    update();
  }

  Future<void> loadProfileData() async{

    ApiResponseModel responseModel = await profileDetailsRepo.fetchProfileData();

    if(responseModel.statusCode == 200){
      ProfileDetailsModel profileDetailsModel = ProfileDetailsModel.fromJson(jsonDecode(responseModel.responseJson));

      username = profileDetailsModel.user?.fullName ?? "";
      email = profileDetailsModel.user?.email ?? "";
      dob = profileDetailsModel.user?.dateOfBirth ?? "";
      phoneNumber = profileDetailsModel.user?.phoneNumber ?? "";
      address = profileDetailsModel.user?.address ?? "";
      profileImage = profileDetailsModel.user?.image ?? "";
    }
  }


  bool isSubmit = false;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  File? imageFile;

  updateProfile() async{
    isSubmit = true;
    update();

    UserPostModel model = UserPostModel(
        fullName: fullNameController.text,
        email: emailController.text,
        phoneNumber: phoneNumberController.text,
        gender: profileDetailsRepo.apiService.sharedPreferences.getString(SharedPreferenceHelper.gender).toString(),
        dob: profileDetailsRepo.apiService.sharedPreferences.getString(SharedPreferenceHelper.dob).toString(),
        image: imageFile,
        address: addressController.text
    );

    await profileDetailsRepo.apiService.sharedPreferences.setString(SharedPreferenceHelper.address, addressController.text);
    await profileDetailsRepo.updateUser(model);

    isSubmit = false;
    update();
  }

  loadData() async{
    isLoading = true;
    update();

    fullNameController.text = profileDetailsRepo.apiService.sharedPreferences.getString(SharedPreferenceHelper.userNameKey) ?? "";
    emailController.text = profileDetailsRepo.apiService.sharedPreferences.getString(SharedPreferenceHelper.userEmailKey) ?? "";
    phoneNumberController.text = profileDetailsRepo.apiService.sharedPreferences.getString(SharedPreferenceHelper.userPhoneNumberKey) ?? "";
    addressController.text = profileDetailsRepo.apiService.sharedPreferences.getString(SharedPreferenceHelper.address) ?? "";

    isLoading = false;
    update();
  }
}