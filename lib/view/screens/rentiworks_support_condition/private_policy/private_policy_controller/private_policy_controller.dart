import 'dart:convert';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/private_policy/private_policy_model/private_policy_model.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/private_policy/private_policy_repo/private_policy_repo.dart';

import '../../../../../core/global/api_response_model.dart';

class PrivatePolicyController extends GetxController{
  late bool isLoading = false;
  PrivatePolicyRepo privatePolicyRepo;
  PrivatePolicyController({required this.privatePolicyRepo});

  @override
  void onReady() {
    privatePolicyResponse();
    super.onReady();
  }
  late PrivatePolicyModel privatePolicyModel;

  Future<void> privatePolicyResponse() async{
    isLoading = true;
    update();

    ApiResponseModel responseModel = await privatePolicyRepo.privatePolicyResponse();

    print("status code: ${responseModel.statusCode}");

    if(responseModel.statusCode == 200){
      privatePolicyModel = PrivatePolicyModel.fromJson(jsonDecode(responseModel.responseJson));
      print("data: ${privatePolicyModel.privacyPolicy!.content.toString()}");
    }
    else{
      isLoading = false;
      update();
    }

    isLoading = false;
    update();
  }


}