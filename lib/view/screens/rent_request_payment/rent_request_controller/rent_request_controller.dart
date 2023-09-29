import 'dart:convert';
import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:renti_user/view/screens/rent_request_payment/rent_request_model/rent_request_model.dart';
import 'package:renti_user/view/screens/rent_request_payment/rent_request_repo/rent_request_repo.dart';

class RentRequestController extends GetxController{
  RentRequestRepo rentRequestRepo;
  RentRequestController({required this.rentRequestRepo});

  @override
  void onReady() {
    rentRequest();
    super.onReady();
  }
  late RentRequestModel rentRequestModel;



  Future<RentRequestModel> rentRequest() async{
    ApiResponseModel responseModel = await rentRequestRepo.rentRequestRepo();
    print("status code: ${responseModel.statusCode}");

    if(responseModel.statusCode == 200){
      rentRequestModel = RentRequestModel.fromJson(jsonDecode(responseModel.responseJson));
      print("data: ${rentRequestModel.message.toString()}");
      print("$rentRequestModel");
    }
    else{
      return RentRequestModel();
    }
    return rentRequestModel;
  }
}
