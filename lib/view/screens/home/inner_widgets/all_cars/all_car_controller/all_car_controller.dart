import 'dart:convert';

import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/view/screens/home/inner_widgets/all_cars/all_car_model/all_car_model.dart';
import 'package:renti_user/view/screens/home/inner_widgets/all_cars/all_car_repo/all_car_repo.dart';


class AllCarController extends GetxController{
  AllCarRepo allCarRepo;
  AllCarController({required this.allCarRepo});

  bool isLoading= false;
  List<Car> carList=[];



  void initialState( )async{

    carList.clear();
    isLoading= true;

    update();

    await allCarGetResponse();
    isLoading=false;
    update();


  }

  Future<void> allCarGetResponse() async {
    ApiResponseModel responseModel = await allCarRepo.AllCarRepoResponse();

    if (responseModel.statusCode == 200) {
      AllCarModel allCarModel = AllCarModel.fromJson(
          jsonDecode(responseModel.responseJson));
      List<Car>? tempCarList = allCarModel.cars;
      if(tempCarList !=null && tempCarList.isNotEmpty){
        carList.addAll(tempCarList);
      }

    }
  }



}