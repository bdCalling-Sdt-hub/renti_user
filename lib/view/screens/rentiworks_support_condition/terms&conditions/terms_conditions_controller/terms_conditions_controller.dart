import 'dart:convert';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/terms&conditions/terms_conditions_model/terms_conditions_model.dart';

import '../../../../../core/global/api_response_model.dart';
import '../terms_conditions_repo/terms_conditions_repo.dart';

class TermsConditionsController extends GetxController{
  late bool isLoading = false;
  TermsConditionsRepo termsConditionsRepo;
  TermsConditionsController({required this.termsConditionsRepo});

  @override
  void onReady() {
    termsConditionsResponse();
    super.onReady();
  }
  late TermsConditionsModel termsConditionsModel;

  // Future<void> termsConditionsResponse() async{
  //   isLoading = true;
  //   update();
  //
  //   ApiResponseModel responseModel = await termsConditionsRepo.termsConditionsResponse();
  //
  //   print("status code: ${responseModel.statusCode}");
  //
  //   if(responseModel.statusCode == 200){
  //     termsConditionsModel = TermsConditionsModel.fromJson(jsonDecode(responseModel.responseJson));
  //     print("data: ${termsConditionsModel.termsCondition!.content.toString()}");
  //   }
  //   else{
  //     isLoading = false;
  //     update();
  //   }
  //
  //   isLoading = false;
  //   update();
  // }

 Future<void> termsConditionsResponse()async{
   isLoading=true;
   update();

   ApiResponseModel responseModel =await termsConditionsRepo.termsConditionsResponse();

   print("status code : ${responseModel.statusCode}");
   if(responseModel.statusCode==200){
     termsConditionsModel = TermsConditionsModel.fromJson(jsonDecode(responseModel.responseJson));
     print("data : ${termsConditionsModel.termsCondition!.content.toString()}");
   }
   else{
     isLoading=false;
     update();
   }
   isLoading=false;
   update();
 }


}