import 'dart:convert';

import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/utils/app_utils.dart';
import 'package:renti_user/view/screens/cancel_request/cancel_request_model/request_cancel_response_model.dart';
import 'package:renti_user/view/screens/rent_history/rent_history_model/rent_history_model.dart';
import 'package:renti_user/view/screens/rent_history/rent_history_repo/rent_history_repo.dart';

class RentHistoryController extends GetxController{

  RentHistoryRepo rentHistoryRepo;
  RentHistoryController({required this.rentHistoryRepo});

  RentHistoryModel rentHistoryModel = RentHistoryModel();
  bool isLoading = false;
  List<UserWiseRent> rentUser = [];
  RequestCancelResponseModel requestCancelResponseModel = RequestCancelResponseModel();

  void initialState() async{
    rentUser.clear();
    isLoading = true;
    update();

    await rentHistoryResult();

    isLoading = false;
    update();
  }

  Future<void> rentHistoryResult() async{

    ApiResponseModel responseModel = await rentHistoryRepo.rentHistoryRepoResponse();

    if(responseModel.statusCode == 200){

      rentHistoryModel = RentHistoryModel.fromJson(jsonDecode(responseModel.responseJson));
      List<UserWiseRent>? tempCarList = rentHistoryModel.userWiseRent;
      if(tempCarList != null && tempCarList.isNotEmpty){
        rentUser.addAll(tempCarList);
      }
    }
  }

  bool isSubmit = false;

  cancelRequest(String rentId) async{

    isSubmit = true;
    update();

    ApiResponseModel responseModel = await rentHistoryRepo.cancelRentRequest(rentId: rentId);
    if(responseModel.statusCode == 200){
      requestCancelResponseModel = RequestCancelResponseModel.fromJson(jsonDecode(responseModel.responseJson));
      AppUtils.successToastMessage("Rent request cancel successfully");
    }
    else{

    }

    isSubmit = false;
    update();
  }
}


