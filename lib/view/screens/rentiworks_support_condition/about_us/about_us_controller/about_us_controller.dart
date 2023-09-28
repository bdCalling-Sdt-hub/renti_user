import 'dart:convert';

import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/about_us/about_us_model/about_us_model.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/about_us/about_us_repo/about_us_repo.dart';

class AboutUstController extends GetxController{

  AboutUsRepo aboutUstRepo;

  AboutUstController( {required this.aboutUstRepo});

  @override
  void onReady() {
    // TODO: implement onReady
    aboutUsGetResponse();
    super.onReady();
  }

  bool isLoading = false;
   AboutUsModel aboutUsModel= AboutUsModel();

  Future<void> aboutUsGetResponse() async{

    update();

    ApiResponseModel responseModel = await aboutUstRepo.aboutUsResponse();

    print("status code: ${responseModel.statusCode}");

    if(responseModel.statusCode == 200){
      aboutUsModel = AboutUsModel.fromJson(jsonDecode(responseModel.responseJson));
      isLoading = false;
      update();
      print("data: ${aboutUsModel.about.toString()}");
      // await gotoNextStep(privacyPolicyModel);
    }
    else{

    }


  }



}