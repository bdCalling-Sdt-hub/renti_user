import 'dart:convert';
import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/view/screens/home/inner_widgets/all_cars/all_cars_model/all_cars_model.dart';
import 'package:renti_user/view/screens/home/inner_widgets/all_cars/all_cars_repo/all_cars_repo.dart';

class AllCarsController extends GetxController{

  AllCarsRepo allCarsRepo;
  AllCarsController({required this.allCarsRepo});

  Future<AllCarsModel> allCarResult() async{
    ApiResponseModel responseModel = await allCarsRepo.AllCarsRepoResponse();
    AllCarsModel allCarsModel;
    print("status code: ${responseModel.statusCode}");

    if(responseModel.statusCode == 200){
      allCarsModel = AllCarsModel.fromJson(jsonDecode(responseModel.responseJson));
      print("data: ${allCarsModel.cars![0].id}");
    }
    else{
      return AllCarsModel();
    }
    return allCarsModel;
  }

}
