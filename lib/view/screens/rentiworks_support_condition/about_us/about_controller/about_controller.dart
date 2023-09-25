import 'dart:convert';
import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/view/screens/rentiworks_support_condition/about_us/about_repo/about_repo.dart';
import '../about_model/AboutModel.dart';

class AboutController extends GetxController{
  late bool isLoading = false;
   AboutRepo aboutRepo;
   AboutController({required this.aboutRepo});

   @override
  void onReady() {
     aboutGetResponse();
    super.onReady();
  }
   late AboutModel aboutModel;

   Future<void> aboutGetResponse() async{
     isLoading = true;
     update();

     ApiResponseModel responseModel = await aboutRepo.aboutResponse();

     print("status code: ${responseModel.statusCode}");

     if(responseModel.statusCode == 200){
       aboutModel = AboutModel.fromJson(jsonDecode(responseModel.responseJson));
       print("data: ${aboutModel.about!.content.toString()}");
     }
     else{
       isLoading = false;
       update();
     }

     isLoading = false;
     update();
   }


}