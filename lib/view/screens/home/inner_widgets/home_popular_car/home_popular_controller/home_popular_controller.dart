import 'dart:convert';
import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/view/screens/home/inner_widgets/home_popular_car/home_popular_model/home_popular_model.dart';
import 'package:renti_user/view/screens/home/inner_widgets/home_popular_car/home_popular_repo/home_popular_repo.dart';


class PopularCarController extends GetxController{
  PopularCarRepo popularCarRepo;
  PopularCarController({required this.popularCarRepo});

  Future<PopularCarModel> searchResult() async{
    ApiResponseModel responseModel = await popularCarRepo.PopularCarRepoResponse();
   PopularCarModel popularCarModel;
    print("status code: ${responseModel.statusCode}");

    if(responseModel.statusCode == 200){
      popularCarModel = PopularCarModel.fromJson(jsonDecode(responseModel.responseJson));
      print("data: ${popularCarModel.cars![0].id}");
    }
    else{
      return PopularCarModel();
    }
    return popularCarModel;
  }

}
