import 'dart:convert';
import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/view/screens/car_list/offer_car/offer_car_model/offer_car_model.dart';

import 'package:renti_user/view/screens/car_list/offer_car/offer_car_repo/offer_car_repo.dart';
import 'package:renti_user/view/screens/home/inner_widgets/all_cars/all_cars_model/all_cars_model.dart';

class OfferCarController extends GetxController{

  OfferCarRepo offerCarRepo;
  OfferCarController({required this.offerCarRepo});

  bool isLoading = false;

  AllCarsModel offerCarModel = AllCarsModel();

  List<Car> offerCarList = [];

  void initialState() async{

    isLoading = true;
    update();

    await loadOfferCarData();

    isLoading = false;
    update();
  }

  Future<void> loadOfferCarData() async{

    ApiResponseModel responseModel = await offerCarRepo.fetchOfferCar();

    if(responseModel.statusCode == 200){
      offerCarModel = AllCarsModel.fromJson(jsonDecode(responseModel.responseJson));
      List<Car>? tempOfferCarList = offerCarModel.cars;
      if(tempOfferCarList != null && tempOfferCarList.isNotEmpty){
        offerCarList.addAll(tempOfferCarList);
      }
    }
    else{
      print("Error");
    }
  }
}