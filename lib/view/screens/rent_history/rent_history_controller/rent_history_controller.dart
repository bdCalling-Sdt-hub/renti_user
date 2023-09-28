import 'dart:convert';
import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/view/screens/car_select/select_car/select_car_model/select_car_model.dart';
import 'package:renti_user/view/screens/rent_history/rent_history_repo/rent_history_repo.dart';

class RentHistoryController extends GetxController{
  RentHistoryRepo rentHistoryRepo;
  RentHistoryController({required this.rentHistoryRepo});
  @override
  void onReady() {
    rentHistoryRequest();
    super.onReady();
  }
  late SelectCarModel selectCarModel;



  Future<SelectCarModel> rentHistoryRequest() async{
    ApiResponseModel responseModel = await rentHistoryRepo.rentHistoryRepo();
    print("status code: ${responseModel.statusCode}");

    if(responseModel.statusCode == 200){
      selectCarModel = SelectCarModel.fromJson(jsonDecode(responseModel.responseJson));
      print("data: ${selectCarModel.message.toString()}");
      print("$selectCarModel");
    }
    else{
      return SelectCarModel();
    }
    return selectCarModel;
  }
}
