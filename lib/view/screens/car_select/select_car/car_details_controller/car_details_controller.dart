import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
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

  sentRentRequest({required String carId}) async{

    isSubmit = true;
    update();

    print("Car id: $carId");
    print("from: ${startTripDateController.text}");
    print("until: ${endTripDateController.text}");

    ApiResponseModel responseModel = await carDetailsRepo.sentRentRequest(
        startDate: startTripDateController.text.toString(),
        endDate: endTripDateController.text.toString(),
        carId: carId
    );

    if(responseModel.statusCode == 200){
      sentRentRequestModel = SentRentRequestModel.fromJson(jsonDecode(responseModel.responseJson));
      Map<String, dynamic> rentRequestData = jsonDecode(sentRentRequestModelToJson(sentRentRequestModel));
      final rentRequestDataEncode = jsonEncode(rentRequestData);

      await carDetailsRepo.apiService.sharedPreferences.setString("rent_request_data", rentRequestDataEncode);
      print("Request sent successfully");
    }

    isSubmit = false;
    update();
  }
}
