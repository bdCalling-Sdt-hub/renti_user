import 'dart:convert';
import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/about_us/about_us_model/about_us_model.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/about_us/about_us_repo/about_us_repo.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/terms&conditions/term_condition_model/term_condition_model.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/terms&conditions/term_condition_repo/term_condition_repo.dart';

class TermConditionController extends GetxController{

  TermConditionRepo termConditionRepo;

  TermConditionController( {required this.termConditionRepo});

  @override
  void onReady() {
    // TODO: implement onReady
    aboutUsGetResponse();
    super.onReady();
  }

  bool isLoading = false;
  late final TermConditionModel termConditionModel;

  Future<void> aboutUsGetResponse() async{
    isLoading = true;
    update();

    ApiResponseModel responseModel = await termConditionRepo.ternConditionResponse();

    print("status code: ${responseModel.statusCode}");

    if(responseModel.statusCode == 200){
      termConditionModel = TermConditionModel.fromJson(jsonDecode(responseModel.responseJson));
      print("data: ${termConditionModel.termsCondition.toString()}");
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