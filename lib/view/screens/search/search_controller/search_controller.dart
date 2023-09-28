import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/view/screens/search/search_model/search_model.dart';
import 'package:renti_user/view/screens/search/search_repo/search_repo.dart';

class SearchScreenController extends GetxController{
  SearchRepo searchRepo;
  SearchScreenController({required this.searchRepo});

  Future<SearchModel> searchGetResponse() async{
    ApiResponseModel responseModel = await searchRepo.searchRepoResponse();
    SearchModel searchModel;

  SearchRepo searchRepo;

  SearchScreenController({required this.searchRepo});

  bool isLoading= true;
  TextEditingController searchController = TextEditingController();
   @override
   void onInit(){
     searchResult();
     super.onInit();
   }
   SearchModel searchModel= SearchModel();

  Future<void> searchResult({String search=""}) async{
    ApiResponseModel responseModel = await searchRepo.searchRepoResponse(search: search);

    print("status code: ${responseModel.statusCode}");

    if(responseModel.statusCode == 200){
      searchModel = SearchModel.fromJson(jsonDecode(responseModel.responseJson));
      print("data: ${searchModel.cars![0].id}");
    }
    else{
      return SearchModel();
    }
    return searchModel;

      bool isLoading= false;
      update();
    }
    else{

    }

  }

}
