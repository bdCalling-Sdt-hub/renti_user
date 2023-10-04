import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/view/screens/car_select/select_car/car_details_model/car_details_model.dart';
import 'package:renti_user/view/screens/car_select/select_car/car_details_repo/car_details_repo.dart';
import 'package:renti_user/view/screens/car_select/sent_rent_request_model/sent_rent_request_model.dart';

class CarDetailsController extends GetxController{

  CarDetailsRepo carDetailsRepo;
  CarDetailsController({required this.carDetailsRepo});

  bool isLoading = false;
  CarDetailsModel carDetailsModel = CarDetailsModel();
  SentRentRequestModel sentRentRequestModel = SentRentRequestModel();

  // get car details data
  Future<void> loadCarDetailsData(String carId) async{
    isLoading = true;
    update();

    ApiResponseModel responseModel = await carDetailsRepo.fetchCarDetails(id: carId);
    if(responseModel.statusCode == 200){
      carDetailsModel = CarDetailsModel.fromJson(jsonDecode(responseModel.responseJson));
    }
    else{
      print("Error");
    }

    isLoading = false;
    update();
  }

  // sent rent request
  TextEditingController startTripDateController = TextEditingController();
  TextEditingController endTripDateController = TextEditingController();

  bool isSubmit = false;
  String requestStatus = "";

  sentRentRequest({required String carId, required String startDate, required String endDate}) async{

    isSubmit = true;
    update();

    ApiResponseModel responseModel = await carDetailsRepo.sentRentRequest(
      startDate: startDate,
      endDate: endDate,
      carId: carId
    );

    if(responseModel.statusCode == 200){
      sentRentRequestModel = SentRentRequestModel.fromJson(jsonDecode(responseModel.responseJson));
      requestStatus = sentRentRequestModel.rents?.requestStatus ?? "";

      await carDetailsRepo.apiService.sharedPreferences.setString("request_status_key", requestStatus);
      print("Request: ${carDetailsRepo.apiService.sharedPreferences.getString("request_status_key")}");
    }

    clearData();
    isSubmit = false;
    update();
  }

  clearData() {
    startTripDateController.text = "";
    endTripDateController.text = "";
    gotoNextStep();
  }

  gotoNextStep() {
    Get.offAndToNamed(AppRoute.rentiHistory);
  }
}
