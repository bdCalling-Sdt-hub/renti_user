import 'dart:convert';
import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';

import 'popular_car_model.dart';
import 'popular_car_repo.dart';


class PopularCarController extends GetxController{

  PopularCarRepo popularCarRepo;

  PopularCarController({required this.popularCarRepo});

  Future<PopularCarModel> popularCarResult() async{
    ApiResponseModel responseModel = await popularCarRepo.PopularCarRepoResponse();
    PopularCarModel popularCarModel;
    print("status code: ${responseModel.statusCode}");

    if(responseModel.statusCode == 200){
      popularCarModel = PopularCarModel.fromJson(jsonDecode(responseModel.responseJson));
      // print("data: ${popularCarModel.cars![0].id}");
    }
    else{
      return PopularCarModel();
    }
    return popularCarModel;
  }

}