import 'dart:convert';

import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/view/screens/car_list/offer_car/offer_model/offer_model.dart';
import 'package:renti_user/view/screens/car_list/offer_car/offer_repo/offer_repo.dart';

class OfferCarController extends GetxController{
  OfferRepo offerRepo;
  OfferCarController({required this.offerRepo});


  Future<OfferModel> offerCarResponse() async{
    ApiResponseModel responseModel = await offerRepo.OfferRepoResponse();
    OfferModel offerModel ;
    print("status code: ${responseModel.statusCode}");

    if(responseModel.statusCode == 200){
      offerModel = OfferModel.fromJson(jsonDecode(responseModel.responseJson));
      print("data: $offerModel");
    }
    else{
      print("SomeThing Error..........................");
      return OfferModel();
    }
    return offerModel;
  }

}
