import 'dart:convert';
import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/view/screens/car_select/select_car/select_car_model/car_details_model.dart';
import 'package:renti_user/view/screens/car_select/select_car/select_car_model/delete_car_rent_model.dart';
import 'package:renti_user/view/screens/car_select/select_car/select_car_model/select_car_model.dart';
import 'package:renti_user/view/screens/car_select/select_car/select_car_repo/select_car_repo.dart';

class SelectCarController extends GetxController{
  SelectCarRepo selectCarRepo;
  SelectCarController({required this.selectCarRepo});
@override
  void onReady() {
  sentRentRequest();
  carDetailsRequest();
    super.onReady();
  }
  late SelectCarModel selectCarModel;
  late CarDetailsModel carDetailsModel;


  Future<SelectCarModel> sentRentRequest() async{
    ApiResponseModel responseModel = await selectCarRepo.selectCarRepo();
    print("status code: ${responseModel.statusCode}");

    if(responseModel.statusCode == 200){
      selectCarModel = SelectCarModel.fromJson(jsonDecode(responseModel.responseJson));
      print("data: ${selectCarModel.message.toString()}");
      print("$selectCarModel");
    }
    else{
      return SelectCarModel();
    }
    return selectCarModel;
  }

  Future<CarDetailsModel> carDetailsRequest() async{
    ApiResponseModel responseModel = await selectCarRepo.carDetailsResponse();
    print("status code: ${responseModel.statusCode}");

    if(responseModel.statusCode == 200){
      carDetailsModel = CarDetailsModel.fromJson(jsonDecode(responseModel.responseJson));
      print("data: ${carDetailsModel.message.toString()}");
      print("$carDetailsModel");
    }
    else{
      return CarDetailsModel();
    }
    return carDetailsModel;
  }

  Future<DeleteRentCarModel> deleteRentCarRequest() async{
    ApiResponseModel responseModel = await selectCarRepo.deleteRentCarRequest();
    print("status code: ${responseModel.statusCode}");
    DeleteRentCarModel deleteRentCarModel;
    if(responseModel.statusCode == 200){
      deleteRentCarModel = DeleteRentCarModel.fromJson(jsonDecode(responseModel.responseJson));
      print("data: ${deleteRentCarModel.message.toString()}");
      print("$deleteRentCarModel");
    }
    else{
      return DeleteRentCarModel();
    }
    return deleteRentCarModel;
  }
}
