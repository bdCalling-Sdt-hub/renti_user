import 'dart:convert';

import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/view/screens/car_list/offer_car/offer_car_repo/offer_car_repo.dart';

import '../offer_car_model/offer_car_model.dart';

class OfferCarController extends GetxController{

  OfferCarRepo offerCarRepo;
  OfferCarController({required this.offerCarRepo});

  bool isLoading = false;
  List<Car> carList = [];


  void initialState() async{
    carList.clear();
    isLoading = true;
    update();

    await offerCarGetResponse();

    isLoading = false;
    update();
  }

  Future<void> offerCarGetResponse() async{

    ApiResponseModel responseModel = await offerCarRepo.offerCarRepoResponse();

    if(responseModel.statusCode == 200){

      OfferCarModel carModel = OfferCarModel.fromJson(jsonDecode(responseModel.responseJson));
      List<Car>? tempCarList = carModel.cars;

      if(tempCarList != null && tempCarList.isNotEmpty){
        carList.addAll(tempCarList);
      }
    }
  }
}