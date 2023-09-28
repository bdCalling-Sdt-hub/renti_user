import 'dart:convert';

import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/view/screens/car_list/all_cars/all_car_model/all_car_model.dart';
import 'package:renti_user/view/screens/car_list/all_cars/all_car_repo/all_car_repo.dart';


class AllCarController extends GetxController{
  AllCarRepo allCarRepo;
  AllCarController({required this.allCarRepo});

  Future<AllCarModel> allCarGetResponse() async{
    ApiResponseModel responseModel = await allCarRepo.AllCarRepoResponse();
    AllCarModel allCarModel ;
    print("status code: ${responseModel.statusCode}");

    if(responseModel.statusCode == 200){
      allCarModel = AllCarModel.fromJson(jsonDecode(responseModel.responseJson));
      print("data: ${allCarModel.cars![0].id}");
    }
    else{
      return AllCarModel();
    }
    return allCarModel;
  }

}