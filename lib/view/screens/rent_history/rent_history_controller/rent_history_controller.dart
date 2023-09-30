import 'dart:convert';

import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/view/screens/rent_history/rent_history_model/rent_history_model.dart';
import 'package:renti_user/view/screens/rent_history/rent_history_repo/rent_history_repo.dart';

class RentHistoryController extends GetxController{
  RentHistoryRepo rentHistoryRepo;
  RentHistoryController({required this.rentHistoryRepo});

  bool isLoading =false;
  List<UserWiseRent> carList= [];
  
  void initialState()async{
    carList.clear();
    
    isLoading=true;
    update();
    
    await rentHistoryGetResponse();
    
    isLoading=true;
    update();
  }
  
  Future<void> rentHistoryGetResponse()async{
    ApiResponseModel responseModel=await rentHistoryRepo.rentHistoryRepoResponse();
    
    if(responseModel.statusCode==200){
      RentHistoryModel carModel=RentHistoryModel.fromJson(jsonDecode(responseModel.responseJson));
      List<UserWiseRent>? tempCarList=carModel.userWiseRent;

      if(tempCarList !=null && tempCarList.isNotEmpty){
        carList.addAll(tempCarList);

      }
    }
  }
}