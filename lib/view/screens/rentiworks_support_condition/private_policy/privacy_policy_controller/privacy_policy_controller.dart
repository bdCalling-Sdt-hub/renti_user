import 'dart:convert';
import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/private_policy/privacy_policy_model/privacy_policy_model.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/private_policy/privacy_policy_repo/privacy_policy_repo.dart';

class PrivacyPolicyController extends GetxController{

  PrivacyPolicyRepo privacyPolicyRepo;
  PrivacyPolicyController({required this.privacyPolicyRepo});

 @override
  void onReady() {
    // TODO: implement onReady
   privacyPolicyGetResponse();
    super.onReady();
  }

  late bool isLoading = false;
 late PrivacyPolicyModel privacyPolicyModel;

  Future<void> privacyPolicyGetResponse() async{
    isLoading = true;
    update();

    ApiResponseModel responseModel = await privacyPolicyRepo.privacyPolicyResponse();

    print("status code: ${responseModel.statusCode}");

    if(responseModel.statusCode == 200){
      privacyPolicyModel = PrivacyPolicyModel.fromJson(jsonDecode(responseModel.responseJson));
      print("data: ${privacyPolicyModel.privacyPolicy.toString()}");
      // await gotoNextStep(privacyPolicyModel);
    }
    else{
      isLoading = false;
      update();
    }

    isLoading = false;
    update();
  }

  /*gotoNextStep(SignInResponseModel signInResponseModel) async{

    if(signInResponseModel.user == null){
      Get.toNamed(AppRoute.signInScreen);
    }
    else if(signInResponseModel.user?.emailVerified == false){
      Get.toNamed(AppRoute.otpScreen);
    }
    else{
      Get.offAndToNamed(AppRoute.homeScreen);
    }*/



}