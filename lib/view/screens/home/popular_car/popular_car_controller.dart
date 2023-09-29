import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/view/screens/home/popular_car/popular_car_model.dart';
import 'package:renti_user/view/screens/home/popular_car/popular_car_repo.dart';



class PopularCarController extends GetxController{


  PopularCarController({required this.popularCarRepo});
  PopularCarRepo popularCarRepo;

  TextEditingController  searchController = TextEditingController();
  PopularCarModel popularCarModel =  PopularCarModel();
  bool isLoading = true;

  @override
  void onInit() {
    popularCarResult();
    super.onInit();
  }
  Future<void> popularCarResult({String search = ""}) async{
    ApiResponseModel responseModel = await popularCarRepo.popularCarRepoResponse(search : search);
    PopularCarModel popularCarModel;
    print("status code: ${responseModel.responseJson}");

    if(responseModel.statusCode == 200){
      popularCarModel = PopularCarModel.fromJson(jsonDecode(responseModel.responseJson));
      isLoading = false;
      update();
       print("data: ${popularCarModel.cars![0].carModelName}");
    }
    else{

    }

  }

}