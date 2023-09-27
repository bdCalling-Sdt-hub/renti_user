import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/view/screens/home/inner_widgets/all_cars/all_cars_model/all_cars_model.dart';
import 'package:renti_user/view/screens/home/inner_widgets/all_cars/all_cars_repo/all_cars_repo.dart';

class AllCarsController extends GetxController{
  AllCarsController({required this.allCarsRepo});

  AllCarsRepo allCarsRepo;
  TextEditingController  searchController = TextEditingController();
  AllCarsModel allCarsModel =  AllCarsModel();
  bool isLoading = true;


  @override
  void onInit() {
    allCarResult();
    super.onInit();
  }

  Future<void> allCarResult({String search = ""}) async{

    ApiResponseModel responseModel = await allCarsRepo.AllCarsRepoResponse(search: search);
    // print("status code: ${responseModel.statusCode}");

    if(responseModel.statusCode == 200){
        allCarsModel = AllCarsModel.fromJson(jsonDecode(responseModel.responseJson));
        isLoading = false;
         update();
      // print("data: ${allCarsModel.cars![0].id}");
    }
    else{

    }

  }

}


