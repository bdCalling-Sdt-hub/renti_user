import 'dart:convert';

import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/utils/app_images.dart';
import 'package:renti_user/view/screens/home/home_repo/home_repo.dart';

import 'package:renti_user/view/screens/profile/profile_details/profile_details_model/profile_details_model.dart';

import '../../car_list/luxury_car/luxury_car_model/luxury_car_model.dart';
import '../inner_widgets/all_cars/all_cars_model/all_cars_model.dart';

class HomeController extends GetxController{

  HomeRepo homeRepo;
  HomeController({required this.homeRepo});

  bool isLoading = false;

  //OfferCarModel offerCarModel = OfferCarModel();
  ProfileDetailsModel profileDetailsModel = ProfileDetailsModel();
  LuxuryCarModel luxuryCarModel = LuxuryCarModel();
  AllCarsModel allCarsModel = AllCarsModel();

  //List<OfferCar> offerCarList = [];

  List<LuxuryCar> luxuryCarList = [];
  List <Car> allCarList = [];

  String profileImage = "";
  String userName = "";
  String phoneNumber = "";

  void initialState() async{

    allCarList.clear();
    luxuryCarList.clear();

    isLoading = true;
    update();

    await loadUserData();
//   await loadOfferCarData();

    await loadAllCarData();
    await loadLuxuryCarData();

    isLoading = false;
    update();
  }
  loadUserData() async{
    ApiResponseModel responseModel = await homeRepo.fetchUserData();
    if(responseModel.statusCode == 200){
      ProfileDetailsModel model = ProfileDetailsModel.fromJson(jsonDecode(responseModel.responseJson));
     //profileImage = model.user?.image ?? "assets/images/user.png";
      profileImage = "${ApiUrlContainer.imageUrl}${model.user?.image}";
    }
  }
///========================= loadOfferCarData=====================>
/*  loadOfferCarData() async{
    ApiResponseModel responseModel = await homeRepo.fetchOfferCarsData();
    if(responseModel.statusCode == 200){
      OfferCarModel model = OfferCarModel.fromJson(jsonDecode(responseModel.responseJson));
      List<OfferCar>? tempList = model.offerCars;
      if(tempList != null && tempList.isNotEmpty){
        offerCarList.addAll(tempList);
      }
    }
  }*/
  ///========================= loadLuxuryCarData=====================>
  loadLuxuryCarData() async{
    ApiResponseModel responseModel = await homeRepo.fetchLuxuryCarsData();
    if(responseModel.statusCode == 200){
      LuxuryCarModel model = LuxuryCarModel.fromJson(jsonDecode(responseModel.responseJson));
      List<LuxuryCar>? tempList = model.luxuryCars;
      if(tempList != null && tempList.isNotEmpty){
        luxuryCarList.addAll(tempList);
      }
    }
  }
///========================= All Car Data =====================>
///
  loadAllCarData() async{
    ApiResponseModel responseModel = await homeRepo.fetchAllCarData();
    if(responseModel.statusCode == 200){
      AllCarsModel model = AllCarsModel.fromJson(jsonDecode(responseModel.responseJson));
      List<Car>? tempList = model.cars;
      if(tempList != null && tempList.isNotEmpty){
        allCarList.addAll(tempList);
      }
    }
  }
}