import 'dart:convert';

import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/view/screens/profile/profile_details/profile_details_model/profile_details_model.dart';
import 'package:renti_user/view/screens/profile/profile_details/profile_details_repo/profile_details_repo.dart';
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
}