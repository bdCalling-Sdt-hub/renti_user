import 'dart:convert';

import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/view/screens/car_list/offer_car/offer_car_repo/offer_car_repo.dart';

import '../offer_car_model/offer_car_model.dart';

class OfferCarController extends GetxController{
  OfferCarRepo offerCarRepo;
  OfferCarController({required this.offerCarRepo});

  Future<OfferCarModel> offerCarGetResponse() async{
    ApiResponseModel responseModel = await offerCarRepo.OfferCarRepoResponse();
    OfferCarModel offerCarModel;
    print("status code: ${responseModel.statusCode}");

    if(responseModel.statusCode == 200){
      offerCarModel = OfferCarModel.fromJson(jsonDecode(responseModel.responseJson));
      print("data: ${offerCarModel.cars![0].id}");
    }
    else{
      return OfferCarModel();
    }
    return offerCarModel;
  }

}