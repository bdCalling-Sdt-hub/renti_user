import 'dart:convert';

import 'package:renti_user/core/global/api_response_model.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/core/helper/shared_preference_helper.dart';
import 'package:renti_user/service/api_service.dart';
import 'package:http/http.dart' as http;

class ProfileSettingsRepo{

  ApiService apiService;
  ProfileSettingsRepo({required this.apiService});

  Future<ApiResponseModel> profileSettingsResponse({required String name, required String email, required String phone, required String address}) async{
    String uri = "${ApiUrlContainer.baseUrl}${ApiUrlContainer.updateUserEndPont}${apiService.sharedPreferences.getString(SharedPreferenceHelper.userIdKey)}";
    Map<String, dynamic> params = {
      "fullName" : name,
      "email" : email,
      "phoneNumber" : phone,
      "address" : address,
      "gender": "Male",
      "dateOfBirth": "31/09/45",
      "KYC": "kyc",
      "RFC": "rfc",
      "creaditCardNumber": "12345675",
      "image": "image"
    };
    ApiResponseModel responseModel;

    http.Response response = await http.post(Uri.parse(uri), body: jsonEncode(params), headers: {
      "Content-Type": "application/json",
      "Authorization": "${apiService.sharedPreferences.getString(SharedPreferenceHelper.accessTokenType)} ${apiService.sharedPreferences.getString(SharedPreferenceHelper.accessTokenKey)}",
    },);

    print("Authorization" + "${apiService.sharedPreferences.getString(SharedPreferenceHelper.accessTokenType)} ${apiService.sharedPreferences.getString(SharedPreferenceHelper.accessTokenKey)}");

    if (response.statusCode == 200) {
      responseModel = ApiResponseModel(200, 'Success', response.body);
      print("Srabon "+params.toString());
      print("Srabon "+uri);
      print("Srabon "+responseModel.statusCode.toString());
      print("Srabon "+responseModel.responseJson);
      print("Srabon "+responseModel.message);
    }else{
      print("Srabon "+params.toString());
      print("Srabon "+uri);
      print("Srabon "+response.statusCode.toString());
      print("Srabon "+response.headers.toString());
      return ApiResponseModel(response.statusCode, 'Error', response.body);
    }
    return responseModel;
  }
}