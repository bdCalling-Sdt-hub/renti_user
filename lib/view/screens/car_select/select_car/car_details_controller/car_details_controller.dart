import 'dart:convert';
import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/view/screens/car_select/select_car/car_details_model/car_details_model.dart';
import 'package:renti_user/view/screens/car_select/select_car/car_details_repo/car_details_repo.dart';

class CarDetailsController extends GetxController{

  CarDetailsRepo carDetailsRepo;
  CarDetailsController({required this.carDetailsRepo});

  bool isLoading = false;

  CarDetailsModel carDetailsModel = CarDetailsModel();

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
}
