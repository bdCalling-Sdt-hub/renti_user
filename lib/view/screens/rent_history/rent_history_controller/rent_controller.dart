import 'dart:convert';
import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/view/screens/rent_history/rent_history_model/rent_model.dart';
import 'package:renti_user/view/screens/rent_history/rent_history_repo/rent_repo.dart';

class RentHistoryController extends GetxController{
  RentHistoryController({required this.rentHistoryRepo});
  RentHistoryRepo rentHistoryRepo;
  RentHistoryModel rentHistoryModel = RentHistoryModel();
  bool isLoading = false;
  List<UserWiseRent> carList = [];

  @override
  void onInit() {
    rentHistoryResult();
    super.onInit();
  }

  Future<void> rentHistoryResult() async{
    isLoading = true;
    update();

    ApiResponseModel responseModel = await rentHistoryRepo.rentHistoryRepoResponse();

    if(responseModel.statusCode == 200){

      rentHistoryModel = RentHistoryModel.fromJson(jsonDecode(responseModel.responseJson));
      List<UserWiseRent>? tempCarList = rentHistoryModel.userWiseRent;
      if(tempCarList != null && tempCarList.isNotEmpty){
        carList.addAll(tempCarList);
      }
    }
    else{

    }
    isLoading = false;
    update();
  }
}